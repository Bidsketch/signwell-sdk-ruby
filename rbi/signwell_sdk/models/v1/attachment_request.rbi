# typed: strong

module SignwellSDK
  module Models
    module V1
      class AttachmentRequest < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::AttachmentRequest,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Name of the requested attachment.
        sig { returns(String) }
        attr_accessor :name

        # Unique identifier of the recipient that will view the attachment request.
        sig { returns(String) }
        attr_accessor :recipient_id

        # Whether the recipient will need to upload the attachment to successfully
        # complete/sign the document. Defaults to `true`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :required

        sig { params(required: T::Boolean).void }
        attr_writer :required

        sig do
          params(
            name: String,
            recipient_id: String,
            required: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Name of the requested attachment.
          name:,
          # Unique identifier of the recipient that will view the attachment request.
          recipient_id:,
          # Whether the recipient will need to upload the attachment to successfully
          # complete/sign the document. Defaults to `true`.
          required: nil
        )
        end

        sig do
          override.returns(
            { name: String, recipient_id: String, required: T::Boolean }
          )
        end
        def to_hash
        end
      end
    end
  end
end
