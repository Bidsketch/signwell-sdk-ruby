# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      class DocumentTemplates
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
