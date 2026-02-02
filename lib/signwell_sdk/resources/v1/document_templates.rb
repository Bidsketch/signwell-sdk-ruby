# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      class DocumentTemplates
        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentTemplateCreateParams} for more details.
        #
        # Creates a new template.
        #
        # @overload create(files:, placeholders:, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, attachment_requests: nil, checkbox_groups: nil, copied_placeholders: nil, decline_redirect_url: nil, draft: nil, expires_in: nil, fields: nil, labels: nil, language: nil, message: nil, metadata: nil, name: nil, redirect_url: nil, reminders: nil, subject: nil, text_tags: nil, request_options: {})
        #
        # @param files [Array<SignwellSDK::Models::V1::File>] Document files can be uploaded by specifying a file URL or base64 string. Either
        #
        # @param placeholders [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::Placeholder>] Placeholders are generally job roles that must complete and/or sign the document
        #
        # @param allow_decline [Boolean] Whether to allow recipients the option to decline signing a document. If multipl
        #
        # @param allow_reassign [Boolean] In some cases a signer is not the right person to sign and may need to reassign
        #
        # @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        # @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        # @param attachment_requests [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::AttachmentRequest>] Attachments that a recipient must upload to complete the signing process. Attach
        #
        # @param checkbox_groups [Array<SignwellSDK::Models::V1::TemplateCheckboxGroup>] Checkbox fields that are placed on a document can be grouped with selection requ
        #
        # @param copied_placeholders [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::CopiedPlaceholder>] Copied placeholders are emailed the final document once it has been completed by
        #
        # @param decline_redirect_url [String] A URL that recipients are redirected to if the document is declined.
        #
        # @param draft [Boolean] Whether the template can still be updated before it is ready for usage. If set t
        #
        # @param expires_in [Integer] Number of days before the signature request expires. Defaults to the account exp
        #
        # @param fields [Array<Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::Field>>] Document fields placed on a document for collecting data or signatures from reci
        #
        # @param labels [Array<SignwellSDK::Models::V1::Label>] Labels can be used to organize documents in a way that can make it easy to find
        #
        # @param language [String] Sets the language for the template and documents created from the template for a
        #
        # @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        # @param metadata [Hash{Symbol=>String}] Optional key-value data that can be associated with the document. If set, will b
        #
        # @param name [String] The name of the template.
        #
        # @param redirect_url [String] A URL that recipients are redirected to after successfully signing a document.
        #
        # @param reminders [Boolean] Whether to send signing reminders to recipients. Reminders are sent on day 3, da
        #
        # @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        # @param text_tags [Boolean] An alternative way (if you can’t use the recommended way) of placing fields in s
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentTemplate]
        #
        # @see SignwellSDK::Models::V1::DocumentTemplateCreateParams
        def create(params)
          parsed, options = SignwellSDK::V1::DocumentTemplateCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/v1/document_templates",
            body: parsed,
            model: SignwellSDK::V1::DocumentTemplate,
            options: options
          )
        end

        # Returns a template and all associated template data. Supply the unique template
        # ID from either a Create Template request or template page URL.
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Unique identifier for a template.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentTemplate]
        #
        # @see SignwellSDK::Models::V1::DocumentTemplateRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["api/v1/document_templates/%1$s", id],
            model: SignwellSDK::V1::DocumentTemplate,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentTemplateUpdateParams} for more details.
        #
        # Updates an existing template.
        #
        # @overload update(id, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, checkbox_groups: nil, decline_redirect_url: nil, draft: nil, expires_in: nil, labels: nil, message: nil, metadata: nil, name: nil, redirect_url: nil, reminders: nil, subject: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a template.
        #
        # @param allow_decline [Boolean] Whether to allow recipients the option to decline signing a document. If multipl
        #
        # @param allow_reassign [Boolean] In some cases a signer is not the right person to sign and may need to reassign
        #
        # @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        # @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        # @param checkbox_groups [Array<SignwellSDK::Models::V1::TemplateCheckboxGroup>] Checkbox fields that are placed on a document can be grouped with selection requ
        #
        # @param decline_redirect_url [String] A URL that recipients are redirected to if the document is declined.
        #
        # @param draft [Boolean] Whether the template can still be updated before it is ready for usage. If set t
        #
        # @param expires_in [Integer] Number of days before the signature request expires. Defaults to the account exp
        #
        # @param labels [Array<SignwellSDK::Models::V1::Label>] Labels can be used to organize documents in a way that can make it easy to find
        #
        # @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        # @param metadata [Hash{Symbol=>String}] Optional key-value data that can be associated with the document. If set, will b
        #
        # @param name [String] The name of the template.
        #
        # @param redirect_url [String] A URL that recipients are redirected to after successfully signing a document.
        #
        # @param reminders [Boolean] Whether to send signing reminders to recipients. Reminders are sent on day 3, da
        #
        # @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentTemplate]
        #
        # @see SignwellSDK::Models::V1::DocumentTemplateUpdateParams
        def update(id, params = {})
          parsed, options = SignwellSDK::V1::DocumentTemplateUpdateParams.dump_request(params)
          @client.request(
            method: :put,
            path: ["api/v1/document_templates/%1$s", id],
            body: parsed,
            model: SignwellSDK::V1::DocumentTemplate,
            options: options
          )
        end

        # Returns a paginated list of templates for the authenticated account.
        #
        # @overload list(limit: nil, page: nil, request_options: {})
        #
        # @param limit [Integer] The number of documents to fetch. Defaults to 10, max is 50.
        #
        # @param page [Integer] The page number for pagination. Defaults to the first page.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentTemplateListResponse]
        #
        # @see SignwellSDK::Models::V1::DocumentTemplateListParams
        def list(params = {})
          parsed, options = SignwellSDK::V1::DocumentTemplateListParams.dump_request(params)
          @client.request(
            method: :get,
            path: "api/v1/document_templates",
            query: parsed,
            model: SignwellSDK::Models::V1::DocumentTemplateListResponse,
            options: options
          )
        end

        # Deletes a template. Supply the unique template ID from either a Create Template
        # request or template page URL.
        #
        # @overload delete(id, request_options: {})
        #
        # @param id [String] Unique identifier for a template.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::DocumentTemplateDeleteParams
        def delete(id, params = {})
          @client.request(
            method: :delete,
            path: ["api/v1/document_templates/%1$s", id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [SignwellSDK::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
