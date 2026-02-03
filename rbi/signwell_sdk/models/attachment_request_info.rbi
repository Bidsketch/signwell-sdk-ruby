# typed: strong

module SignwellSDK
  module Models
    class AttachmentRequestInfo < SignwellSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SignwellSDK::AttachmentRequestInfo,
            SignwellSDK::Internal::AnyHash
          )
        end

      # Name of the attachment request
      sig { returns(String) }
      attr_accessor :name

      # Whether the attachment is required
      sig { returns(T::Boolean) }
      attr_accessor :required

      # URL of the uploaded attachment (when available)
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # Attachment request information
      sig do
        params(name: String, required: T::Boolean, url: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Name of the attachment request
        name:,
        # Whether the attachment is required
        required:,
        # URL of the uploaded attachment (when available)
        url: nil
      )
      end

      sig do
        override.returns({ name: String, required: T::Boolean, url: String })
      end
      def to_hash
      end
    end
  end
end
