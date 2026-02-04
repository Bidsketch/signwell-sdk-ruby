# frozen_string_literal: true

module SignwellSDK
  module Models
    class RateLimitErrorResponse < SignwellSDK::Internal::Type::BaseModel
      # @!attribute error
      #   Rate limit error message indicating the limit and reset time
      #
      #   @return [String]
      required :error, String

      # @!method initialize(error:)
      #   Rate limit exceeded error response (HTTP 429)
      #
      #   @param error [String] Rate limit error message indicating the limit and reset time
    end
  end
end
