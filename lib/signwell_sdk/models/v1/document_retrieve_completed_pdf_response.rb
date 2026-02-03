# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#retrieve_completed_pdf
      class DocumentRetrieveCompletedPdfResponse < SignwellSDK::Internal::Type::BaseModel
        # @!attribute file_url
        #   URL to download the completed document
        #
        #   @return [String]
        required :file_url, String

        # @!method initialize(file_url:)
        #   Response containing the URL to the completed PDF file (returned when
        #   url_only=true)
        #
        #   @param file_url [String] URL to download the completed document
      end
    end
  end
end
