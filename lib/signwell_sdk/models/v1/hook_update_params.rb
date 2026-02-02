# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Hooks#update
      class HookUpdateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute callback_url
        #   URL that we will post document events to.
        #
        #   @return [String]
        required :callback_url, String

        # @!attribute api_application_id
        #   Unique identifier for the API Application.
        #
        #   @return [String, nil]
        optional :api_application_id, String

        # @!method initialize(callback_url:, api_application_id: nil, request_options: {})
        #   @param callback_url [String] URL that we will post document events to.
        #
        #   @param api_application_id [String] Unique identifier for the API Application.
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
