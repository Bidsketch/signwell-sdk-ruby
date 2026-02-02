# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentRemindParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::DocumentRemindParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Optional list if recipients within the document to send a reminder email to. If
        # none are specified, all recipients that have not signed yet will receive a
        # reminder email.
        sig do
          returns(
            T.nilable(
              T::Array[SignwellSDK::V1::DocumentRemindParams::Recipient]
            )
          )
        end
        attr_reader :recipients

        sig do
          params(
            recipients:
              T::Array[SignwellSDK::V1::DocumentRemindParams::Recipient::OrHash]
          ).void
        end
        attr_writer :recipients

        sig do
          params(
            recipients:
              T::Array[
                SignwellSDK::V1::DocumentRemindParams::Recipient::OrHash
              ],
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Optional list if recipients within the document to send a reminder email to. If
          # none are specified, all recipients that have not signed yet will receive a
          # reminder email.
          recipients: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              recipients:
                T::Array[SignwellSDK::V1::DocumentRemindParams::Recipient],
              request_options: SignwellSDK::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Recipient < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::DocumentRemindParams::Recipient,
                SignwellSDK::Internal::AnyHash
              )
            end

          # Recipient's email address.
          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          # Recipient's name (required if multiple recipients share the same email).
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { params(email: String, name: String).returns(T.attached_class) }
          def self.new(
            # Recipient's email address.
            email: nil,
            # Recipient's name (required if multiple recipients share the same email).
            name: nil
          )
          end

          sig { override.returns({ email: String, name: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
