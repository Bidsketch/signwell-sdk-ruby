# typed: strong

module SignwellSDK
  module Resources
    class V1
      class DocumentTemplates
        # Returns a paginated list of templates for the authenticated account.
        sig do
          params(
            limit: Integer,
            page: Integer,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::Models::V1::DocumentTemplateListResponse)
        end
        def list(
          # The number of documents to fetch. Defaults to 10, max is 50.
          limit: nil,
          # The page number for pagination. Defaults to the first page.
          page: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: SignwellSDK::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
