# typed: strong

module SignwellSDK
  module Models
    module V1
      class File < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SignwellSDK::V1::File, SignwellSDK::Internal::AnyHash)
          end

        # Name of the file that will be uploaded.
        sig { returns(String) }
        attr_accessor :name

        # A RFC 4648 base64 string of the file to be uploaded.
        sig { returns(T.nilable(String)) }
        attr_reader :file_base64

        sig { params(file_base64: String).void }
        attr_writer :file_base64

        # Publicly available URL of the file to be uploaded.
        sig { returns(T.nilable(String)) }
        attr_reader :file_url

        sig { params(file_url: String).void }
        attr_writer :file_url

        sig do
          params(name: String, file_base64: String, file_url: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Name of the file that will be uploaded.
          name:,
          # A RFC 4648 base64 string of the file to be uploaded.
          file_base64: nil,
          # Publicly available URL of the file to be uploaded.
          file_url: nil
        )
        end

        sig do
          override.returns(
            { name: String, file_base64: String, file_url: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
