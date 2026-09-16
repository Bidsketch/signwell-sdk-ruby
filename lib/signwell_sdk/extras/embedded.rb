# frozen_string_literal: true
# Source: signwell-sdk-generator/extras/ruby/overlay/lib/signwell_sdk/extras/embedded.rb
# Do not edit the generated SDK copy directly.

require 'signwell_sdk/extras/embedded/view_helpers'

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
  #     files: [{ name: 'nda.pdf', file_url: 'https://example.com/nda.pdf' }],
  #     recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }],
  #     fields: [[{ x: 20, y: 60, page: 1, type: 'signature' }]]
  #   )
  #   url = SignWell::Embedded.embedded_signing_url(doc)
  #
  #   # Then on the frontend:
  #   # new SignWellEmbed({ url: url }).open()
  #
  # @example Create a draft for embedded requesting (field placement)
  #   doc = SignWell::Embedded.create_requesting_document(
  #     name: 'Contract',
  #     files: [{ name: 'contract.pdf', file_url: 'https://example.com/contract.pdf' }],
  #     recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }]
  #   )
  #   edit_url = doc.embedded_edit_url
  #
  #   # Then on the frontend:
  #   # new SignWellEmbed({ url: edit_url }).open()
  #
  # @see https://developers.signwell.com/reference/embedded-signing SignWell Embedded Docs
  module Embedded
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
    # @param files [Array<Hash>] List of file hashes. Each must include +:name+
    #   and either +:file_url+ or +:file_base64+.
    # @param fields [Array<Array<Hash>>, nil] 2D array of field hashes - one inner
    #   array per file in the document. Each field hash should include +:x+, +:y+,
    #   +:page+, and +:type+. A +:recipient_id+ is auto-assigned to the first
    #   recipient if not provided.
    # @param test_mode [Boolean] Enable test mode (default: false).
    # @param send_notifications [Boolean] Send completion notifications (default: false).
    # @param opts [Hash] Additional attributes passed to {SignWell::Models::DocumentRequest}.
    # @return [SignWell::Models::DocumentResponse] The created document.
    # @raise [SignWell::Errors::ApiError] If the API request fails.
    def self.create_signing_document(name:, files:, recipients:,
                                     fields: nil, test_mode: false,
                                     send_notifications: false, **opts)
      recipient_models = build_recipients(recipients)

      attrs = {
        name: name,
        test_mode: test_mode,
        files: build_files(files),
        recipients: recipient_models,
        embedded_signing: true,
        embedded_signing_notifications: send_notifications
      }
      attrs.merge!(opts)
      attrs[:fields] = build_fields(fields, recipient_models) if fields

      request = Models::DocumentRequest.new(attrs)
      validate_signing_placement(request, recipient_models)
      Resources::DocumentApi.new.create_document(request)
    end

    # Creates a draft document for embedded requesting (field placement by the sender).
    #
    # This sets +draft: true+ automatically so the document is not sent immediately.
    # Use the +embedded_edit_url+ from the response to open the field editor in an iframe.
    #
    # @param name [String] Document name.
    # @param recipients [Array<Hash>] List of recipient hashes (+:name+, +:email+).
    # @param files [Array<Hash>] List of file hashes. Each must include +:name+
    #   and either +:file_url+ or +:file_base64+.
    # @param test_mode [Boolean] Enable test mode (default: false).
    # @param opts [Hash] Additional attributes passed to {SignWell::Models::DocumentRequest}.
    # @return [SignWell::Models::DocumentResponse] The created draft document.
    # @raise [SignWell::Errors::ApiError] If the API request fails.
    def self.create_requesting_document(name:, files:, recipients:,
                                        test_mode: false, **opts)
      attrs = {
        name: name,
        test_mode: test_mode,
        files: build_files(files),
        recipients: build_recipients(recipients),
        draft: true
      }
      attrs.merge!(opts)

      request = Models::DocumentRequest.new(attrs)
      Resources::DocumentApi.new.create_document(request)
    end

    # Creates a document from one or more templates for embedded signing.
    #
    # Provide either +:template_id+ (single template) or +:template_ids+
    # (multiple templates), but not both.
    #
    # @param template_id [String, nil] UUID of a single template.
    # @param template_ids [Array<String>, nil] UUIDs of multiple templates.
    # @param recipients [Array<Hash>] List of recipient hashes. Each must include
    #   +:name+ and +:email+, and optionally +:placeholder_name+ to map to a
    #   template placeholder.
    # @param test_mode [Boolean] Enable test mode (default: false).
    # @param send_notifications [Boolean] Send completion notifications (default: false).
    # @param opts [Hash] Additional attributes passed to {SignWell::Models::DocumentFromTemplateRequest}.
    # @return [SignWell::Models::DocumentFromTemplateResponse] The created document.
    # @raise [ArgumentError] If both or neither template_id/template_ids are provided.
    # @raise [SignWell::Errors::ApiError] If the API request fails.
    def self.create_signing_document_from_template(recipients:, template_id: nil,
                                                   template_ids: nil, test_mode: false,
                                                   send_notifications: false, **opts)
      raise ArgumentError, 'Provide either :template_id or :template_ids, not both' if template_id && template_ids
      raise ArgumentError, 'Provide :template_id or :template_ids' unless template_id || template_ids

      attrs = {
        test_mode: test_mode,
        recipients: build_template_recipients(recipients),
        embedded_signing: true,
        embedded_signing_notifications: send_notifications
      }
      attrs[:template_id] = template_id if template_id
      attrs[:template_ids] = template_ids if template_ids
      attrs.merge!(opts)

      request = Models::DocumentFromTemplateRequest.new(attrs)
      Resources::DocumentApi.new.create_document_from_template(request)
    end

    # Returns a hash mapping each recipient's email to their embedded signing URL.
    #
    # @param document [#recipients] A document response object with recipients.
    # @return [Hash{String => String}] Email-to-URL mapping.
    #
    # @example
    #   urls = SignWell::Embedded.embedded_signing_urls(doc)
    #   # => { "jane@example.com" => "https://www.signwell.com/docs/abc123/" }
    def self.embedded_signing_urls(document)
      return {} unless document.respond_to?(:recipients) && document.recipients

      document.recipients.each_with_object({}) do |r, hash|
        hash[r.email] = r.embedded_signing_url if r.embedded_signing_url
      end
    end

    # Returns the embedded signing URL for a single recipient.
    #
    # @param document [#recipients] A document response object with recipients.
    # @param recipient_index [Integer] Index of the recipient (default: 0).
    # @return [String, nil] The embedded signing URL, or nil if not available.
    #
    # @example
    #   url = SignWell::Embedded.embedded_signing_url(doc)
    #   # => "https://www.signwell.com/docs/abc123/"
    def self.embedded_signing_url(document, recipient_index: 0)
      return nil unless document.respond_to?(:recipients) && document.recipients

      recipient = document.recipients[recipient_index]
      return nil unless recipient

      recipient.embedded_signing_url
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
        Models::RecipientsInner.new(recipient_attrs(r, i))
      end
    end

    # @api private
    def self.build_template_recipients(recipients)
      recipients.each_with_index.map do |r, i|
        attrs = recipient_attrs(r, i)
        placeholder_name = hash_value(r, :placeholder_name)
        attrs[:placeholder_name] = placeholder_name if placeholder_name
        Models::TemplateRecipientsInner.new(attrs)
      end
    end

    # @api private
    def self.optional_string_or_nil(value)
      return nil if value.nil?

      normalized = value.to_s.strip
      normalized.empty? ? nil : normalized
    end

    # @api private
    def self.build_files(files)
      files.map do |f|
        url = hash_value(f, :file_url)
        b64 = hash_value(f, :file_base64)
        name = hash_value(f, :name)
        has_url = present_value?(url)
        has_b64 = present_value?(b64)

        raise ArgumentError, 'Each file must include :name' unless present_value?(name)
        raise ArgumentError, 'Each file must include exactly one of :file_url or :file_base64' if has_url == has_b64

        attrs = { name: name }
        attrs[has_url ? :file_url : :file_base64] = has_url ? url : b64
        Models::FilesInner.new(attrs)
      end
    end

    # @api private
    def self.build_fields(fields, recipient_models)
      default_id = recipient_models.first&.id
      fields.map do |file_fields|
        file_fields.map do |f|
          attrs = symbolize_keys(f)
          attrs[:recipient_id] = default_id unless present_value?(attrs[:recipient_id])
          raise ArgumentError, 'Each field must include :recipient_id when no default recipient exists' unless attrs[:recipient_id]

          attrs[:required] = true unless attrs.key?(:required)
          Models::FieldsInnerInner.new(attrs)
        end
      end
    end

    def self.validate_signing_placement(request, recipient_models)
      return if request.with_signature_page == true || request.text_tags == true

      fields = Array(request.fields).flatten
      assigned_recipient_ids = fields.map(&:recipient_id).compact.map(&:to_s).reject(&:empty?)
      missing_recipients = recipient_models.select do |recipient|
        recipient.id && !assigned_recipient_ids.include?(recipient.id.to_s)
      end

      return unless fields.empty? || missing_recipients.any?

      raise ArgumentError,
            'Embedded signing documents must include fields for every recipient, set with_signature_page: true, or set text_tags: true'
    end

    def self.recipient_attrs(recipient, index)
      attrs = {
        id: (hash_value(recipient, :id) || (index + 1)).to_s,
        name: hash_value(recipient, :name),
        email: hash_value(recipient, :email)
      }
      passcode = optional_string_or_nil(hash_value(recipient, :passcode))
      attrs[:passcode] = passcode if passcode
      attrs
    end

    def self.hash_value(hash, key)
      return hash[key] if hash.respond_to?(:key?) && hash.key?(key)
      return hash[key.to_s] if hash.respond_to?(:key?) && hash.key?(key.to_s)

      nil
    end

    def self.symbolize_keys(hash)
      hash.each_with_object({}) { |(key, value), attrs| attrs[key.to_sym] = value }
    end

    def self.present_value?(value)
      !value.nil? && !(value.respond_to?(:empty?) && value.empty?)
    end

    private_class_method :build_recipients, :build_template_recipients, :build_files, :build_fields,
                         :validate_signing_placement, :recipient_attrs, :hash_value, :symbolize_keys,
                         :present_value?, :optional_string_or_nil
  end
end
