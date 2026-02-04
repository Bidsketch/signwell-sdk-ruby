# frozen_string_literal: true

module SignwellSDK
  module Models
    class ErrorResponse < SignwellSDK::Internal::Type::BaseModel
      # @!attribute message
      #   Human-readable error message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute meta
      #
      #   @return [SignwellSDK::Models::ErrorResponse::Meta, nil]
      optional :meta, -> { SignwellSDK::ErrorResponse::Meta }

      # @!method initialize(message: nil, meta: nil)
      #   Standard error response
      #
      #   @param message [String] Human-readable error message
      #
      #   @param meta [SignwellSDK::Models::ErrorResponse::Meta]

      # @see SignwellSDK::Models::ErrorResponse#meta
      class Meta < SignwellSDK::Internal::Type::BaseModel
        # @!attribute error
        #   Error code identifier
        #
        #   @return [String]
        required :error, String

        # @!attribute message
        #   Detailed error message
        #
        #   @return [String]
        required :message, String

        # @!attribute messages
        #   List of error messages
        #
        #   @return [Array<String>, nil]
        optional :messages, SignwellSDK::Internal::Type::ArrayOf[String]

        # @!method initialize(error:, message:, messages: nil)
        #   @param error [String] Error code identifier
        #
        #   @param message [String] Detailed error message
        #
        #   @param messages [Array<String>] List of error messages
      end
    end
  end
end
