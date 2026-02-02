# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      class Documents
        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentCreateParams} for more details.
        #
        # Creates and optionally sends a new document for signing. If `draft` is set to
        # true the document will not be sent.
        #
        # @overload create(files:, recipients:, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, attachment_requests: nil, checkbox_groups: nil, copied_contacts: nil, custom_requester_email: nil, custom_requester_name: nil, decline_redirect_url: nil, draft: nil, embedded_signing: nil, embedded_signing_notifications: nil, expires_in: nil, fields: nil, labels: nil, language: nil, message: nil, metadata: nil, name: nil, redirect_url: nil, reminders: nil, subject: nil, test_mode: nil, text_tags: nil, with_signature_page: nil, request_options: {})
        #
        # @param files [Array<SignwellSDK::Models::V1::File>] Document files can be uploaded by specifying a file URL or base64 string. Either
        #
        # @param recipients [Array<SignwellSDK::Models::V1::DocumentCreateParams::Recipient>] Document recipients are people that must complete and/or sign a document.
        #
        # @param allow_decline [Boolean] Whether to allow recipients the option to decline signing a document. If multipl
        #
        # @param allow_reassign [Boolean] In some cases a signer is not the right person to sign and may need to reassign
        #
        # @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        # @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        # @param attachment_requests [Array<SignwellSDK::Models::V1::AttachmentRequest>] Attachments that a recipient must upload to complete the signing process. Attach
        #
        # @param checkbox_groups [Array<SignwellSDK::Models::V1::CheckboxGroup>] Checkbox fields that are placed on a document can be grouped with selection requ
        #
        # @param copied_contacts [Array<SignwellSDK::Models::V1::CopiedContact>] Copied contacts are emailed the final document once it has been completed by all
        #
        # @param custom_requester_email [String] Sets the custom requester email for the document. When set, this is the email us
        #
        # @param custom_requester_name [String] Sets the custom requester name for the document. When set, this is the name used
        #
        # @param decline_redirect_url [String] A URL that recipients are redirected to if the document is declined.
        #
        # @param draft [Boolean] Whether the document can still be updated before sending a signature request. If
        #
        # @param embedded_signing [Boolean] When set to `true` it enables embedded signing in your website/web application.
        #
        # @param embedded_signing_notifications [Boolean] On embedding signing, document owners (and CC'd contacts) do not get a notificat
        #
        # @param expires_in [Integer] Number of days before the signature request expires. Defaults to the account exp
        #
        # @param fields [Array<Array<SignwellSDK::Models::V1::DocumentCreateParams::Field>>] Document fields placed on a document for collecting data or signatures from reci
        #
        # @param labels [Array<SignwellSDK::Models::V1::Label>] Labels can be used to organize documents in a way that can make it easy to find
        #
        # @param language [String] Sets the language for all recipients on the document and updates all recipient s
        #
        # @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        # @param metadata [Hash{Symbol=>String}] Optional key-value data that can be associated with the document. If set, will b
        #
        # @param name [String] The name of the document.
        #
        # @param redirect_url [String] A URL that recipients are redirected to after successfully signing a document.
        #
        # @param reminders [Boolean] Whether to send signing reminders to recipients. Reminders are sent on day 3, da
        #
        # @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        # @param test_mode [Boolean] Set to `true` to enable Test Mode. Documents created with Test Mode do not count
        #
        # @param text_tags [Boolean] An alternative way (if you can’t use the recommended way) of placing fields in s
        #
        # @param with_signature_page [Boolean] When set to `true` the document will have a signature page added to the end, and
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::Document]
        #
        # @see SignwellSDK::Models::V1::DocumentCreateParams
        def create(params)
          parsed, options = SignwellSDK::V1::DocumentCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/v1/documents",
            body: parsed,
            model: SignwellSDK::V1::Document,
            options: options
          )
        end

        # Returns a document and all associated document data. Supply the unique document
        # ID from either a document creation request or Document page URL.
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Unique identifier for a document.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::Document]
        #
        # @see SignwellSDK::Models::V1::DocumentRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["api/v1/documents/%1$s", id],
            model: SignwellSDK::V1::Document,
            options: params[:request_options]
          )
        end

        # Returns a paginated list of documents for the authenticated account.
        #
        # @overload list(limit: nil, page: nil, request_options: {})
        #
        # @param limit [Integer] The number of documents to fetch. Defaults to 10, max is 50.
        #
        # @param page [Integer] The page number for pagination. Defaults to the first page.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentListResponse]
        #
        # @see SignwellSDK::Models::V1::DocumentListParams
        def list(params = {})
          parsed, options = SignwellSDK::V1::DocumentListParams.dump_request(params)
          @client.request(
            method: :get,
            path: "api/v1/documents",
            query: parsed,
            model: SignwellSDK::Models::V1::DocumentListResponse,
            options: options
          )
        end

        # Deletes a document. Deleting a document will also cancel document signing (if in
        # progress). Supply the unique document ID from either a Create Document request
        # or document page URL.
        #
        # @overload delete(id, request_options: {})
        #
        # @param id [String] Unique identifier for a document.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::DocumentDeleteParams
        def delete(id, params = {})
          @client.request(
            method: :delete,
            path: ["api/v1/documents/%1$s", id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentCreateFromTemplateParams} for more details.
        #
        # Creates and optionally sends a new document for signing. If `draft` is set to
        # true the document will not be sent.
        #
        # @overload create_from_template(recipients:, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, attachment_requests: nil, checkbox_groups: nil, copied_contacts: nil, custom_requester_email: nil, custom_requester_name: nil, decline_redirect_url: nil, draft: nil, embedded_signing: nil, embedded_signing_notifications: nil, expires_in: nil, fields: nil, files: nil, labels: nil, language: nil, message: nil, metadata: nil, name: nil, redirect_url: nil, reminders: nil, subject: nil, template_fields: nil, template_id: nil, template_ids: nil, test_mode: nil, text_tags: nil, with_signature_page: nil, request_options: {})
        #
        # @param recipients [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateParams::Recipient>] Document recipients are people that must complete and/or sign a document. Recipi
        #
        # @param allow_decline [Boolean] Whether to allow recipients the option to decline signing a document. If multipl
        #
        # @param allow_reassign [Boolean] In some cases a signer is not the right person to sign and may need to reassign
        #
        # @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        # @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        # @param attachment_requests [Array<SignwellSDK::Models::V1::AttachmentRequest>] Attachments that a recipient must upload to complete the signing process. Attach
        #
        # @param checkbox_groups [Array<SignwellSDK::Models::V1::CheckboxGroup>] Checkbox fields that are placed on a document can be grouped with selection requ
        #
        # @param copied_contacts [Array<SignwellSDK::Models::V1::CopiedContact>] Copied contacts are emailed the final document once it has been completed by all
        #
        # @param custom_requester_email [String] Sets the custom requester email for the document. When set, this is the email us
        #
        # @param custom_requester_name [String] Sets the custom requester name for the document. When set, this is the name used
        #
        # @param decline_redirect_url [String] A URL that recipients are redirected to if the document is declined.
        #
        # @param draft [Boolean] Whether the document can still be updated before sending a signature request. If
        #
        # @param embedded_signing [Boolean] When set to `true` it enables embedded signing in your website/web application.
        #
        # @param embedded_signing_notifications [Boolean] On embedding signing, document owners (and CC'd contacts) do not get a notificat
        #
        # @param expires_in [Integer] Number of days before the signature request expires. Defaults to the account exp
        #
        # @param fields [Array<Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateParams::Field>>] Fields to be added to any appended files (not existing files). Document fields p
        #
        # @param files [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateParams::File>]
        #
        # @param labels [Array<SignwellSDK::Models::V1::Label>] Labels can be used to organize documents in a way that can make it easy to find
        #
        # @param language [String] Sets the language for all recipients on the document and updates all recipient s
        #
        # @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        # @param metadata [Hash{Symbol=>String}] Optional key-value data that can be associated with the document. If set, will b
        #
        # @param name [String] The name of the document.
        #
        # @param redirect_url [String] A URL that recipients are redirected to after successfully signing a document.
        #
        # @param reminders [Boolean] Whether to send signing reminders to recipients. Reminders are sent on day 3, da
        #
        # @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        # @param template_fields [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateParams::TemplateField>] Fields of your template(s) that you can prepopulate with values. Signature and I
        #
        # @param template_id [String] Use when you have to create a document from a single template. Either
        # :template\_
        #
        # @param template_ids [Array<String>] Use when you have to create a document from multiple templates. Either :template
        #
        # @param test_mode [Boolean] Set to `true` to enable Test Mode. Documents created with Test Mode do not count
        #
        # @param text_tags [Boolean] An alternative way (if you can’t use the recommended way) of placing fields in s
        #
        # @param with_signature_page [Boolean] When set to `true` the document will have a signature page added to the end, and
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse]
        #
        # @see SignwellSDK::Models::V1::DocumentCreateFromTemplateParams
        def create_from_template(params)
          parsed, options = SignwellSDK::V1::DocumentCreateFromTemplateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/v1/document_templates/documents",
            body: parsed,
            model: SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentRemindParams} for more details.
        #
        # Sends a reminder email to recipients that have not signed yet.
        #
        # @overload remind(id, recipients: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a document.
        #
        # @param recipients [Array<SignwellSDK::Models::V1::DocumentRemindParams::Recipient>] Optional list if recipients within the document to send a reminder email to. If
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::DocumentRemindParams
        def remind(id, params = {})
          parsed, options = SignwellSDK::V1::DocumentRemindParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["api/v1/documents/%1$s/remind", id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfParams} for more details.
        #
        # Gets a completed document PDF or ZIP file. Supply the unique document ID from
        # either a document creation request or document page URL.
        #
        # @overload retrieve_completed_pdf(id, audit_page: nil, file_format: nil, url_only: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a completed document.
        #
        # @param audit_page [Boolean] Whether to include the audit page as part of the document. Defaults to `true`
        #
        # @param file_format [Symbol, SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfParams::FileFormat] Format of the file to be downloaded. Supported formats are 'pdf' and 'zip'.
        #
        # @param url_only [Boolean] Whether to return the URL of the completed PDF or the actual PDF content. Defaul
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfResponse::Json, StringIO]
        #
        # @see SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfParams
        def retrieve_completed_pdf(id, params = {})
          parsed, options = SignwellSDK::V1::DocumentRetrieveCompletedPdfParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["api/v1/documents/%1$s/completed_pdf", id],
            query: parsed,
            model: SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateParams} for more
        # details.
        #
        # Download NOM-151 certificate for a completed document. Returns a ZIP file,
        # download URL, or raw certificate data based on query parameters.
        #
        # @overload retrieve_nom151_certificate(id, object_only: nil, url_only: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a completed document.
        #
        # @param object_only [Boolean] If true, returns raw NOM-151 constancia certificate object as JSON instead of a
        #
        # @param url_only [Boolean] If true, returns JSON with download URL instead of downloading the file
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse, SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151URLResponse, StringIO]
        #
        # @see SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateParams
        def retrieve_nom151_certificate(id, params = {})
          parsed, options = SignwellSDK::V1::DocumentRetrieveNom151CertificateParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["api/v1/documents/%1$s/nom151_certificate", id],
            query: parsed,
            model: SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentSendParams} for more details.
        #
        # Updates a draft document and sends it to be signed by recipients.
        #
        # @overload send_(id, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, checkbox_groups: nil, custom_requester_email: nil, custom_requester_name: nil, decline_redirect_url: nil, embedded_signing: nil, embedded_signing_notifications: nil, expires_in: nil, labels: nil, message: nil, metadata: nil, name: nil, redirect_url: nil, reminders: nil, subject: nil, test_mode: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a document.
        #
        # @param allow_decline [Boolean] Whether to allow recipients the option to decline signing a document. If multipl
        #
        # @param allow_reassign [Boolean] In some cases a signer is not the right person to sign and may need to reassign
        #
        # @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        # @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        # @param checkbox_groups [Array<SignwellSDK::Models::V1::CheckboxGroup>] Checkbox fields that are placed on a document can be grouped with selection requ
        #
        # @param custom_requester_email [String] Sets the custom requester email for the document. When set, this is the email us
        #
        # @param custom_requester_name [String] Sets the custom requester name for the document. When set, this is the name used
        #
        # @param decline_redirect_url [String] A URL that recipients are redirected to if the document is declined.
        #
        # @param embedded_signing [Boolean] When set to `true` it enables embedded signing in your website/web application.
        #
        # @param embedded_signing_notifications [Boolean] On embedding signing, document owners (and CC'd contacts) do not get a notificat
        #
        # @param expires_in [Integer] Number of days before the signature request expires. Defaults to the account exp
        #
        # @param labels [Array<SignwellSDK::Models::V1::Label>] Labels can be used to organize documents in a way that can make it easy to find
        #
        # @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        # @param metadata [Hash{Symbol=>String}] Optional key-value data that can be associated with the document. If set, will b
        #
        # @param name [String] The name of the document.
        #
        # @param redirect_url [String] A URL that recipients are redirected to after successfully signing a document.
        #
        # @param reminders [Boolean] Whether to send signing reminders to recipients. Reminders are sent on day 3, da
        #
        # @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        # @param test_mode [Boolean] Set to `true` to enable Test Mode. Documents created with Test Mode do not count
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::Document]
        #
        # @see SignwellSDK::Models::V1::DocumentSendParams
        def send_(id, params = {})
          parsed, options = SignwellSDK::V1::DocumentSendParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["api/v1/documents/%1$s/send", id],
            body: parsed,
            model: SignwellSDK::V1::Document,
            options: options
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
