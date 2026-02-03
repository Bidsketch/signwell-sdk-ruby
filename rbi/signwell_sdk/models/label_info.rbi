# typed: strong

module SignwellSDK
  module Models
    class LabelInfo < SignwellSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SignwellSDK::LabelInfo, SignwellSDK::Internal::AnyHash)
        end

      # Label ID
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Label name
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Label information
      sig { params(id: String, name: String).returns(T.attached_class) }
      def self.new(
        # Label ID
        id: nil,
        # Label name
        name: nil
      )
      end

      sig { override.returns({ id: String, name: String }) }
      def to_hash
      end
    end
  end
end
