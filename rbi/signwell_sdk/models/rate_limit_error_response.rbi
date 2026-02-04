# typed: strong

module SignwellSDK
  module Models
    class RateLimitErrorResponse < SignwellSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SignwellSDK::RateLimitErrorResponse,
            SignwellSDK::Internal::AnyHash
          )
        end

      # Rate limit error message indicating the limit and reset time
      sig { returns(String) }
      attr_accessor :error

      # Rate limit exceeded error response (HTTP 429)
      sig { params(error: String).returns(T.attached_class) }
      def self.new(
        # Rate limit error message indicating the limit and reset time
        error:
      )
      end

      sig { override.returns({ error: String }) }
      def to_hash
      end
    end
  end
end
