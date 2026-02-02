# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      class BulkSends
        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::BulkSendCreateParams} for more details.
        #
        # Creates a bulk send, and it validates the CSV file before creating the bulk
        # send.
        #
        # @overload create(bulk_send_csv:, template_ids:, api_application_id: nil, apply_signing_order: nil, custom_requester_email: nil, custom_requester_name: nil, message: nil, name: nil, skip_row_errors: nil, subject: nil, request_options: {})
        #
        # @param bulk_send_csv [String] A RFC 4648 base64 string of the template CSV file to be validated.
        #
        # @param template_ids [Array<String>] Unique identifiers for a list of templates.
        #
        # @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        # @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        # @param custom_requester_email [String] Sets the custom requester email for the document. When set, this is the email us
        #
        # @param custom_requester_name [String] Sets the custom requester name for the document. When set, this is the name used
        #
        # @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        # @param name [String] The name of the Bulk Send. Will be used as the document name for each of the doc
        #
        # @param skip_row_errors [Boolean] Whether to skip errors in the rows. Defaults to `false`.
        #
        # @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::BulkSendCreateParams
        def create(params)
          parsed, options = SignwellSDK::V1::BulkSendCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/v1/bulk_sends",
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Returns information about the Bulk Send.
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Unique identifier for a bulk send.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::BulkSendRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["api/v1/bulk_sends/%1$s", id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::BulkSendListParams} for more details.
        #
        # Returns information about the Bulk Send.
        #
        # @overload list(api_application_id: nil, limit: nil, page: nil, user_email: nil, request_options: {})
        #
        # @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        # @param limit [Integer] The number of documents to fetch. Defaults to 10, max is 50.
        #
        # @param page [Integer] The page number for pagination. Defaults to the first page.
        #
        # @param user_email [String] The email address of the user that sent the Bulk Send. Must have the `admin` or
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::BulkSendListParams
        def list(params = {})
          parsed, options = SignwellSDK::V1::BulkSendListParams.dump_request(params)
          @client.request(
            method: :get,
            path: "api/v1/bulk_sends",
            query: parsed,
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::BulkSendRetrieveCsvTemplateParams} for more details.
        #
        # Fetches a CSV template that corresponds to the provided document template IDs.
        # CSV templates are blank CSV files that have columns containing required and
        # optional data that can be sent when creating a bulk send. Fields can be
        # referenced by the field label. Example: [placeholder name]\_[field label] could
        # be something like customer_address or signer_company_name (if 'Customer' and
        # 'Signer' were placeholder names for templates set up in SignWell).
        #
        # @overload retrieve_csv_template(template_ids:, base64: nil, request_options: {})
        #
        # @param template_ids [Array<String>] Specify one or more templates to generate a single blank CSV file that will cont
        #
        # @param base64 [String] A RFC 4648 base64 string of the template CSV file to be validated.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [StringIO]
        #
        # @see SignwellSDK::Models::V1::BulkSendRetrieveCsvTemplateParams
        def retrieve_csv_template(params)
          parsed, options = SignwellSDK::V1::BulkSendRetrieveCsvTemplateParams.dump_request(params)
          @client.request(
            method: :get,
            path: "api/v1/bulk_sends/csv_template",
            query: parsed,
            headers: {"accept" => "application/octet-stream"},
            model: StringIO,
            options: options
          )
        end

        # Returns information about the Bulk Send.
        #
        # @overload retrieve_documents(id, limit: nil, page: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a bulk send.
        #
        # @param limit [Integer] The number of documents to fetch. Defaults to 10, max is 50.
        #
        # @param page [Integer] The page number for pagination. Defaults to the first page.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::BulkSendRetrieveDocumentsParams
        def retrieve_documents(id, params = {})
          parsed, options = SignwellSDK::V1::BulkSendRetrieveDocumentsParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["api/v1/bulk_sends/%1$s/documents", id],
            query: parsed,
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::BulkSendValidateCsvParams} for more details.
        #
        # Validates a Bulk Send CSV file before creating the Bulk Send. It will check the
        # structure of the CSV and the data it contains, and return any errors found.
        #
        # @overload validate_csv(bulk_send_csv:, template_ids:, request_options: {})
        #
        # @param bulk_send_csv [String] A RFC 4648 base64 string of the template CSV file to be validated.
        #
        # @param template_ids [Array<String>] Specify one or more templates to generate a single blank CSV file that will cont
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::BulkSendValidateCsvParams
        def validate_csv(params)
          parsed, options = SignwellSDK::V1::BulkSendValidateCsvParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/v1/bulk_sends/validate_csv",
            body: parsed,
            model: NilClass,
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
