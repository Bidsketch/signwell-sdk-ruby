# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      class APIApplications
        # Deletes an API Application from an account. Supply the unique Application ID
        # from either the Create API Application response or the API Application edit page
        #
        # @overload delete(id, request_options: {})
        #
        # @param id [String] Unique identifier for the API Application.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::APIApplicationDeleteParams
        def delete(id, params = {})
          @client.request(
            method: :delete,
            path: ["api/v1/api_applications/%1$s", id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Gets the details of a specific API Application within an account. Supply the
        # unique Application ID from either the Create API Application response or the API
        # Application edit page.
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Unique identifier for the API Application.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::APIApplicationRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["api/v1/api_applications/%1$s", id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [SignwellSDK::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
