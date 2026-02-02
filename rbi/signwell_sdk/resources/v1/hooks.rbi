# typed: strong

module SignwellSDK
  module Resources
    class V1
      class Hooks
        # Register a callback URL that we will post document events to.
        sig do
          params(
            callback_url: String,
            api_application_id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def update(
          # URL that we will post document events to.
          callback_url:,
          # Unique identifier for the API Application.
          api_application_id: nil,
          request_options: {}
        )
        end

        # Deletes a registered callback URL that we are posting document events to.
        sig do
          params(
            id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Unique identifier for a webhook.
          id,
          request_options: {}
        )
        end

        # List all the webhooks in the account.
        sig do
          params(request_options: SignwellSDK::RequestOptions::OrHash).void
        end
        def retrieve(request_options: {})
        end

        # @api private
        sig { params(client: SignwellSDK::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
