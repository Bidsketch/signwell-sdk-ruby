# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::BulkSends#list
      class BulkSendListParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute api_application_id
        #   Unique identifier for API Application settings to use. API Applications are
        #   optional and mainly used when isolating OAuth apps or for more control over
        #   embedded API settings
        #
        #   @return [String, nil]
        optional :api_application_id, String

        # @!attribute limit
        #   The number of documents to fetch. Defaults to 10, max is 50.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   The page number for pagination. Defaults to the first page.
        #
        #   @return [Integer, nil]
        optional :page, Integer

        # @!attribute user_email
        #   The email address of the user that sent the Bulk Send. Must have the `admin` or
        #   `manager` role to view Bulk Sends of other users. Defaults to the user that the
        #   API key belongs to.
        #
        #   @return [String, nil]
        optional :user_email, String

        # @!method initialize(api_application_id: nil, limit: nil, page: nil, user_email: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::BulkSendListParams} for more details.
        #
        #   @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        #   @param limit [Integer] The number of documents to fetch. Defaults to 10, max is 50.
        #
        #   @param page [Integer] The page number for pagination. Defaults to the first page.
        #
        #   @param user_email [String] The email address of the user that sent the Bulk Send. Must have the `admin` or
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
