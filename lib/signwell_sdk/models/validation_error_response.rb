# frozen_string_literal: true

module SignwellSDK
  module Models
    class ValidationErrorResponse < SignwellSDK::Internal::Type::BaseModel
      # @!attribute errors
      #   Field-specific validation errors. Keys are field names (e.g., recipients,
      #   fields, files). Values can be strings, arrays of strings, or nested objects with
      #   further field-specific errors.
      #
      #   @return [Hash{Symbol=>Object}]
      required :errors, SignwellSDK::Internal::Type::HashOf[SignwellSDK::Internal::Type::Unknown]

      # @!method initialize(errors:)
      #   Some parameter documentations has been truncated, see
      #   {SignwellSDK::Models::ValidationErrorResponse} for more details.
      #
      #   Validation error response. The errors object contains field-specific error
      #   details with dynamic keys.
      #
      #   @param errors [Hash{Symbol=>Object}] Field-specific validation errors. Keys are field names (e.g., recipients, fields
    end
  end
end
