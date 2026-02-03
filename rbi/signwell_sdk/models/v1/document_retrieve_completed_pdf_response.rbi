# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentRetrieveCompletedPdfResponse < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfResponse,
              SignwellSDK::Internal::AnyHash
            )
          end

        # URL to download the completed document
        sig { returns(String) }
        attr_accessor :file_url

        # Response containing the URL to the completed PDF file (returned when
        # url_only=true)
        sig { params(file_url: String).returns(T.attached_class) }
        def self.new(
          # URL to download the completed document
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
