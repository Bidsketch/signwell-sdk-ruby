# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      class DocumentFile < SignwellSDK::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the file that will be uploaded.
        #
        #   @return [String]
        required :name, String

        # @!attribute file_base64
        #   A RFC 4648 base64 string of the file to be uploaded.
        #
        #   @return [String, nil]
        optional :file_base64, String

        # @!attribute file_url
        #   Publicly available URL of the file to be uploaded.
        #
        #   @return [String, nil]
        optional :file_url, String

        # @!method initialize(name:, file_base64: nil, file_url: nil)
        #   @param name [String] Name of the file that will be uploaded.
        #
        #   @param file_base64 [String] A RFC 4648 base64 string of the file to be uploaded.
        #
        #   @param file_url [String] Publicly available URL of the file to be uploaded.
      end
    end
  end
end
