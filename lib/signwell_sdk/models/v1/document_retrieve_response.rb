# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#retrieve
      module DocumentRetrieveResponse
        extend SignwellSDK::Internal::Type::Union

        variant -> { SignwellSDK::Models::V1::DocumentRetrieveResponse::Json }

        variant StringIO

        class Json < SignwellSDK::Internal::Type::BaseModel
          # @!attribute file_url
          #
          #   @return [String, nil]
          optional :file_url, String

          # @!method initialize(file_url: nil)
          #   @param file_url [String]
        end

        # @!method self.variants
        #   @return [Array(SignwellSDK::Models::V1::DocumentRetrieveResponse::Json, StringIO)]
      end
    end
  end
end
