# typed: strong

module SignwellSDK
  module Models
    class CopiedContactInfo < SignwellSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SignwellSDK::CopiedContactInfo, SignwellSDK::Internal::AnyHash)
        end

      # Contact email
      sig { returns(String) }
      attr_accessor :email

      # Contact ID
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Contact name
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Copied contact information
      sig do
        params(email: String, id: String, name: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Contact email
        email:,
        # Contact ID
        id: nil,
        # Contact name
        name: nil
      )
      end

      sig { override.returns({ email: String, id: String, name: String }) }
      def to_hash
      end
    end
  end
end
