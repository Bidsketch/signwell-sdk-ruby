# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentListParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::DocumentListParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # The number of documents to fetch. Defaults to 10, max is 50.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # The page number for pagination. Defaults to the first page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page

        sig { params(page: Integer).void }
        attr_writer :page

        sig do
          params(
            limit: Integer,
            page: Integer,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The number of documents to fetch. Defaults to 10, max is 50.
          limit: nil,
          # The page number for pagination. Defaults to the first page.
          page: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              limit: Integer,
              page: Integer,
              request_options: SignwellSDK::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
