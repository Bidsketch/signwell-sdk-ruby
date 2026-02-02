# typed: strong

module SignwellSDK
  module Models
    module V1
      class BulkSendListParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::BulkSendListParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Unique identifier for API Application settings to use. API Applications are
        # optional and mainly used when isolating OAuth apps or for more control over
        # embedded API settings
        sig { returns(T.nilable(String)) }
        attr_reader :api_application_id

        sig { params(api_application_id: String).void }
        attr_writer :api_application_id

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

        # The email address of the user that sent the Bulk Send. Must have the `admin` or
        # `manager` role to view Bulk Sends of other users. Defaults to the user that the
        # API key belongs to.
        sig { returns(T.nilable(String)) }
        attr_reader :user_email

        sig { params(user_email: String).void }
        attr_writer :user_email

        sig do
          params(
            api_application_id: String,
            limit: Integer,
            page: Integer,
            user_email: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for API Application settings to use. API Applications are
          # optional and mainly used when isolating OAuth apps or for more control over
          # embedded API settings
          api_application_id: nil,
          # The number of documents to fetch. Defaults to 10, max is 50.
          limit: nil,
          # The page number for pagination. Defaults to the first page.
          page: nil,
          # The email address of the user that sent the Bulk Send. Must have the `admin` or
          # `manager` role to view Bulk Sends of other users. Defaults to the user that the
          # API key belongs to.
          user_email: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              api_application_id: String,
              limit: Integer,
              page: Integer,
              user_email: String,
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
