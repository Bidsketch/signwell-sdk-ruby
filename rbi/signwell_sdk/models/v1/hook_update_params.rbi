# typed: strong

module SignwellSDK
  module Models
    module V1
      class HookUpdateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::HookUpdateParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # URL that we will post document events to.
        sig { returns(String) }
        attr_accessor :callback_url

        # Unique identifier for the API Application.
        sig { returns(T.nilable(String)) }
        attr_reader :api_application_id

        sig { params(api_application_id: String).void }
        attr_writer :api_application_id

        sig do
          params(
            callback_url: String,
            api_application_id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # URL that we will post document events to.
          callback_url:,
          # Unique identifier for the API Application.
          api_application_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              callback_url: String,
              api_application_id: String,
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
