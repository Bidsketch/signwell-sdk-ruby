# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#retrieve_nom151_certificate
      class DocumentRetrieveNom151CertificateResponse < SignwellSDK::Internal::Type::BaseModel
        # @!attribute file_url
        #   Public URL to download the certificate ZIP file
        #
        #   @return [String]
        required :file_url, String

        # @!method initialize(file_url:)
        #   @param file_url [String] Public URL to download the certificate ZIP file
      end
    end
  end
end
