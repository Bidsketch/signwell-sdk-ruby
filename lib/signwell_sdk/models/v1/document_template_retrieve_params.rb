# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::DocumentTemplates#retrieve
      class DocumentTemplateRetrieveParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
