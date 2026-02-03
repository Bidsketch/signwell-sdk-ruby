# typed: strong

module SignwellSDK
  module Models
    class FileInfo < SignwellSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SignwellSDK::FileInfo, SignwellSDK::Internal::AnyHash)
        end

      # File name
      sig { returns(String) }
      attr_accessor :name

      # Number of pages in the file
      sig { returns(Integer) }
      attr_accessor :pages_number

      # File information
      sig do
        params(name: String, pages_number: Integer).returns(T.attached_class)
      end
      def self.new(
        # File name
        name:,
        # Number of pages in the file
        pages_number:
      )
      end

      sig { override.returns({ name: String, pages_number: Integer }) }
      def to_hash
      end
    end
  end
end
