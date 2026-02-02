# typed: strong

module SignwellSDK
  module Resources
    class V1
      sig { returns(SignwellSDK::Resources::V1::Documents) }
      attr_reader :documents

      sig { returns(SignwellSDK::Resources::V1::DocumentTemplates) }
      attr_reader :document_templates

      sig { returns(SignwellSDK::Resources::V1::APIApplications) }
      attr_reader :api_applications

      sig { returns(SignwellSDK::Resources::V1::Hooks) }
      attr_reader :hooks

      sig { returns(SignwellSDK::Resources::V1::BulkSends) }
      attr_reader :bulk_sends

      # Retrieves the account information associated with the API key being used.
      sig { params(request_options: SignwellSDK::RequestOptions::OrHash).void }
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: SignwellSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
