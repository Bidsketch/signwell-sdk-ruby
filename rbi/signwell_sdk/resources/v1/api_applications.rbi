# typed: strong

module SignwellSDK
  module Resources
    class V1
      class APIApplications
        # Gets the details of a specific API Application within an account. Supply the
        # unique Application ID from either the Create API Application response or the API
        # Application edit page.
        sig do
          params(
            id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def retrieve(
          # Unique identifier for the API Application.
          id,
          request_options: {}
        )
        end

        # Deletes an API Application from an account. Supply the unique Application ID
        # from either the Create API Application response or the API Application edit page
        sig do
          params(
            id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Unique identifier for the API Application.
          id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: SignwellSDK::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
