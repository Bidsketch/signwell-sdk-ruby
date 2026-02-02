# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#retrieve_nom151_certificate
      class DocumentRetrieveNom151CertificateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute object_only
        #   If true, returns raw NOM-151 constancia certificate object as JSON instead of a
        #   zip file or URL.
        #
        #   @return [Boolean, nil]
        optional :object_only, SignwellSDK::Internal::Type::Boolean

        # @!attribute url_only
        #   If true, returns JSON with download URL instead of downloading the file
        #
        #   @return [Boolean, nil]
        optional :url_only, SignwellSDK::Internal::Type::Boolean

        # @!method initialize(object_only: nil, url_only: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateParams} for more
        #   details.
        #
        #   @param object_only [Boolean] If true, returns raw NOM-151 constancia certificate object as JSON instead of a
        #
        #   @param url_only [Boolean] If true, returns JSON with download URL instead of downloading the file
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
