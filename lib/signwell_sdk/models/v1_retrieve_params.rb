# frozen_string_literal: true

module SignwellSDK
  module Models
    # @see SignwellSDK::Resources::V1#retrieve
    class V1RetrieveParams < SignwellSDK::Internal::Type::BaseModel
      extend SignwellSDK::Internal::Type::RequestParameters::Converter
      include SignwellSDK::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
