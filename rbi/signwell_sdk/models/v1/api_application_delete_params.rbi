# typed: strong

module SignwellSDK
  module Models
    module V1
      class APIApplicationDeleteParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::APIApplicationDeleteParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        sig do
          params(request_options: SignwellSDK::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig do
          override.returns({ request_options: SignwellSDK::RequestOptions })
        end
        def to_hash
        end
      end
    end
  end
end
