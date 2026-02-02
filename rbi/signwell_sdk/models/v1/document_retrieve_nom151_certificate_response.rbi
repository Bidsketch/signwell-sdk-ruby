# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentRetrieveNom151CertificateResponse < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Public URL to download the certificate ZIP file
        sig { returns(String) }
        attr_accessor :file_url

        sig { params(file_url: String).returns(T.attached_class) }
        def self.new(
          # Public URL to download the certificate ZIP file
          file_url:
        )
        end

        sig { override.returns({ file_url: String }) }
        def to_hash
        end
      end
    end
  end
end
