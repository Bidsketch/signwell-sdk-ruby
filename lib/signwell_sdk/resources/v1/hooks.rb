# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      class Hooks
        # Register a callback URL that we will post document events to.
        #
        # @overload update(callback_url:, api_application_id: nil, request_options: {})
        #
        # @param callback_url [String] URL that we will post document events to.
        #
        # @param api_application_id [String] Unique identifier for the API Application.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::HookUpdateParams
        def update(params)
          parsed, options = SignwellSDK::V1::HookUpdateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/v1/hooks/",
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Deletes a registered callback URL that we are posting document events to.
        #
        # @overload delete(id, request_options: {})
        #
        # @param id [String] Unique identifier for a webhook.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::HookDeleteParams
        def delete(id, params = {})
          @client.request(
            method: :delete,
            path: ["api/v1/hooks/%1$s/", id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # List all the webhooks in the account.
        #
        # @overload retrieve(request_options: {})
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::HookRetrieveParams
        def retrieve(params = {})
          @client.request(
            method: :get,
            path: "api/v1/hooks/",
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
