# typed: strong

module SignwellSDK
  module Models
    module V1
      module DocumentRetrieveResponse
        extend SignwellSDK::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              SignwellSDK::Models::V1::DocumentRetrieveResponse::Json,
              StringIO
            )
          end

        class Json < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::Models::V1::DocumentRetrieveResponse::Json,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :file_url

          sig { params(file_url: String).void }
          attr_writer :file_url

          sig { params(file_url: String).returns(T.attached_class) }
          def self.new(file_url: nil)
          end

          sig { override.returns({ file_url: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              SignwellSDK::Models::V1::DocumentRetrieveResponse::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
