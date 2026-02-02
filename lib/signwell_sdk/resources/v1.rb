# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      # @return [SignwellSDK::Resources::V1::Documents]
      attr_reader :documents

      # @return [SignwellSDK::Resources::V1::DocumentTemplates]
      attr_reader :document_templates

      # @return [SignwellSDK::Resources::V1::APIApplications]
      attr_reader :api_applications

      # @return [SignwellSDK::Resources::V1::Hooks]
      attr_reader :hooks

      # @return [SignwellSDK::Resources::V1::BulkSends]
      attr_reader :bulk_sends

      # Retrieves the account information associated with the API key being used.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SignwellSDK::Models::V1RetrieveParams
      def retrieve(params = {})
        @client.request(method: :get, path: "api/v1/me/", model: NilClass, options: params[:request_options])
      end

      # @api private
      #
      # @param client [SignwellSDK::Client]
      def initialize(client:)
        @client = client
        @documents = SignwellSDK::Resources::V1::Documents.new(client: client)
        @document_templates = SignwellSDK::Resources::V1::DocumentTemplates.new(client: client)
        @api_applications = SignwellSDK::Resources::V1::APIApplications.new(client: client)
        @hooks = SignwellSDK::Resources::V1::Hooks.new(client: client)
        @bulk_sends = SignwellSDK::Resources::V1::BulkSends.new(client: client)
      end
    end
  end
end
