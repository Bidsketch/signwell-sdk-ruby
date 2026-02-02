# typed: strong

module SignwellSDK
  module Models
    module V1
      class CopiedContact < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::CopiedContact,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Email for the copied contact.
        sig { returns(String) }
        attr_accessor :email

        # Name of the copied contact.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { params(email: String, name: String).returns(T.attached_class) }
        def self.new(
          # Email for the copied contact.
          email:,
          # Name of the copied contact.
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
