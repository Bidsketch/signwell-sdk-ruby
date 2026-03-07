# frozen_string_literal: true

module SignWell
  # Convenience helpers for embedded signing and requesting workflows.
  #
  # The embedded API lets you integrate document signing and field placement
  # directly into your application via an iframe, instead of redirecting users
  # to SignWell. This module simplifies the backend portion of that flow:
  # building the request models, setting the right flags, and extracting
  # the URLs you need for the frontend embed.
  #
  # @example Create a document for embedded signing
  #   doc = SignWell::Embedded.create_signing_document(
  #     name: 'NDA',
  #     file_url: 'https://example.com/nda.pdf',
  #     recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }],
  #     fields: [{ x: 20, y: 60, page: 1, type: 'signature' }]
  #   )
  #   url = SignWell::Embedded.signing_url(doc)
  #
  #   # Then on the frontend:
  #   # new SignWellEmbed({ url: url }).open()
  #
  # @example Create a draft for embedded requesting (field placement)
  #   doc = SignWell::Embedded.create_requesting_document(
  #     name: 'Contract',
  #     file_url: 'https://example.com/contract.pdf',
  #     recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }]
  #   )
  #   edit_url = doc.embedded_edit_url
  #
  #   # Then on the frontend:
  #   # new SignWellEmbed({ url: edit_url }).open()
  #
  # @see https://developers.signwell.com/reference/embedded-signing SignWell Embedded Docs
  module Embedded # rubocop:disable Metrics/ModuleLength
    # URL for the SignWell embedded JavaScript library.
    SCRIPT_URL = 'https://static.signwell.com/assets/embedded.js'

    # Creates a document configured for embedded signing.
    #
    # This is a convenience wrapper around {SignWell::Resources::DocumentApi#create_document}
    # that automatically sets +embedded_signing: true+ and builds the model objects
    # for you from simple hashes.
    #
    # @param name [String] Document name.
    # @param recipients [Array<Hash>] List of recipient hashes. Each must include
    #   +:name+ and +:email+. An +:id+ is auto-assigned if not provided.
    # @param file_url [String, nil] URL of the file to sign.
    # @param file_base64 [String, nil] Base64-encoded file content (provide with +file_name+).
    # @param file_name [String, nil] Filename when using +file_base64+.
    # @param fields [Array<Hash>, nil] List of field hashes. Each should include
    #   +:x+, +:y+, +:page+, and +:type+. A +:recipient_id+ is auto-assigned to
    #   the first recipient if not provided.
    # @param test_mode [Boolean] Enable test mode (default: false).
    # @param send_notifications [Boolean] Send completion notifications (default: false).
    # @param opts [Hash] Additional attributes passed to {SignWell::Models::DocumentRequest}.
    # @return [SignWell::Models::DocumentResponse] The created document.
    # @raise [SignWell::Errors::ApiError] If the API request fails.
    def self.create_signing_document(name:, recipients:, file_url: nil, # rubocop:disable Metrics/MethodLength,Metrics/ParameterLists
                                     file_base64: nil, file_name: nil,
                                     fields: nil, test_mode: false,
                                     send_notifications: false, **opts)
      recipient_models = build_recipients(recipients)
      file_models = build_files(file_url: file_url, file_base64: file_base64, file_name: file_name)
      field_models = build_fields(fields, recipient_models) if fields

      attrs = {
        name: name,
        test_mode: test_mode,
        files: file_models,
        recipients: recipient_models,
        embedded_signing: true,
        embedded_signing_notifications: send_notifications
      }
      attrs[:fields] = field_models if field_models
      attrs.merge!(opts)

      request = Models::DocumentRequest.new(attrs)
      Resources::DocumentApi.new.create_document(request)
    end

    # Creates a draft document for embedded requesting (field placement by the sender).
    #
    # This sets +draft: true+ automatically so the document is not sent immediately.
    # Use the +embedded_edit_url+ from the response to open the field editor in an iframe.
    #
    # @param name [String] Document name.
    # @param recipients [Array<Hash>] List of recipient hashes (+:name+, +:email+).
    # @param file_url [String, nil] URL of the file.
    # @param file_base64 [String, nil] Base64-encoded file content.
    # @param file_name [String, nil] Filename when using +file_base64+.
    # @param test_mode [Boolean] Enable test mode (default: false).
    # @param opts [Hash] Additional attributes passed to {SignWell::Models::DocumentRequest}.
    # @return [SignWell::Models::DocumentResponse] The created draft document.
    # @raise [SignWell::Errors::ApiError] If the API request fails.
    def self.create_requesting_document(name:, recipients:, file_url: nil, # rubocop:disable Metrics/MethodLength,Metrics/ParameterLists
                                        file_base64: nil, file_name: nil,
                                        test_mode: false, **opts)
      recipient_models = build_recipients(recipients)
      file_models = build_files(file_url: file_url, file_base64: file_base64, file_name: file_name)

      attrs = {
        name: name,
        test_mode: test_mode,
        files: file_models,
        recipients: recipient_models,
        draft: true
      }
      attrs.merge!(opts)

      request = Models::DocumentRequest.new(attrs)
      Resources::DocumentApi.new.create_document(request)
    end

    # Creates a document from a template for embedded signing.
    #
    # @param template_id [String] The template UUID to create the document from.
    # @param recipients [Array<Hash>] List of recipient hashes. Each must include
    #   +:name+ and +:email+, and optionally +:placeholder_name+ to map to a
    #   template placeholder.
    # @param test_mode [Boolean] Enable test mode (default: false).
    # @param send_notifications [Boolean] Send completion notifications (default: false).
    # @param opts [Hash] Additional attributes passed to {SignWell::Models::DocumentFromTemplateRequest}.
    # @return [SignWell::Models::DocumentFromTemplateResponse] The created document.
    # @raise [SignWell::Errors::ApiError] If the API request fails.
    def self.create_signing_document_from_template(template_id:, recipients:, # rubocop:disable Metrics/MethodLength
                                                   test_mode: false,
                                                   send_notifications: false, **opts)
      recipient_models = recipients.map do |r|
        Models::TemplateRecipientsInner.new(
          placeholder_name: r[:placeholder_name] || r['placeholder_name'],
          name: r[:name] || r['name'],
          email: r[:email] || r['email']
        )
      end

      attrs = {
        template_id: template_id,
        test_mode: test_mode,
        recipients: recipient_models,
        embedded_signing: true,
        embedded_signing_notifications: send_notifications
      }
      attrs.merge!(opts)

      request = Models::DocumentFromTemplateRequest.new(attrs)
      Resources::DocumentApi.new.create_document_from_template(request)
    end

    # Returns a hash mapping each recipient's email to their signing URL.
    #
    # @param document [#recipients] A document response object with recipients.
    # @return [Hash{String => String}] Email-to-URL mapping.
    #
    # @example
    #   urls = SignWell::Embedded.signing_urls(doc)
    #   # => { "jane@example.com" => "https://www.signwell.com/docs/abc123/" }
    def self.signing_urls(document)
      return {} unless document.respond_to?(:recipients) && document.recipients

      document.recipients.each_with_object({}) do |r, hash|
        hash[r.email] = r.signing_url if r.respond_to?(:signing_url) && r.signing_url
      end
    end

    # Returns the signing URL for a single recipient.
    #
    # @param document [#recipients] A document response object with recipients.
    # @param recipient_index [Integer] Index of the recipient (default: 0).
    # @return [String, nil] The signing URL, or nil if not available.
    #
    # @example
    #   url = SignWell::Embedded.signing_url(doc)
    #   # => "https://www.signwell.com/docs/abc123/"
    def self.signing_url(document, recipient_index: 0)
      return nil unless document.respond_to?(:recipients) && document.recipients

      recipient = document.recipients[recipient_index]
      recipient&.signing_url
    end

    # Returns an HTML +<script>+ tag that loads the SignWell embedded JavaScript library.
    #
    # @return [String] HTML script tag.
    #
    # @example
    #   SignWell::Embedded.script_tag
    #   # => '<script src="https://static.signwell.com/assets/embedded.js"></script>'
    def self.script_tag
      %(<script src="#{SCRIPT_URL}"></script>)
    end

    # @api private
    def self.build_recipients(recipients)
      recipients.each_with_index.map do |r, i|
        Models::RecipientsInner.new(
          id: r[:id] || r['id'] || (i + 1).to_s,
          name: r[:name] || r['name'],
          email: r[:email] || r['email']
        )
      end
    end

    # @api private
    def self.build_files(file_url:, file_base64:, file_name:)
      if file_url
        [Models::FilesInner.new(file_url: file_url)]
      elsif file_base64
        [Models::FilesInner.new(file_base64: file_base64, name: file_name)]
      else
        raise ArgumentError, 'Provide either file_url or file_base64 (with file_name)'
      end
    end

    # @api private
    def self.build_fields(fields, recipient_models) # rubocop:disable Metrics
      default_id = recipient_models.first&.id
      [fields.map do |f|
        Models::FieldsInnerInner.new(
          x: f[:x] || f['x'],
          y: f[:y] || f['y'],
          page: f[:page] || f['page'],
          type: f[:type] || f['type'],
          recipient_id: f[:recipient_id] || f['recipient_id'] || default_id,
          required: f.fetch(:required, f.fetch('required', true))
        )
      end]
    end

    private_class_method :build_recipients, :build_files, :build_fields
  end
end
