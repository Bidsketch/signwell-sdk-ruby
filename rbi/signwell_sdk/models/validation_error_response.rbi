# typed: strong

module SignwellSDK
  module Models
    class ValidationErrorResponse < SignwellSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SignwellSDK::ValidationErrorResponse,
            SignwellSDK::Internal::AnyHash
          )
        end

      # Field-specific validation errors. Keys are field names (e.g., recipients,
      # fields, files). Values can be strings, arrays of strings, or nested objects with
      # further field-specific errors.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :errors

      # Validation error response. The errors object contains field-specific error
      # details with dynamic keys.
      sig do
        params(errors: T::Hash[Symbol, T.anything]).returns(T.attached_class)
      end
      def self.new(
        # Field-specific validation errors. Keys are field names (e.g., recipients,
        # fields, files). Values can be strings, arrays of strings, or nested objects with
        # further field-specific errors.
        errors:
      )
      end

      sig { override.returns({ errors: T::Hash[Symbol, T.anything] }) }
      def to_hash
      end
    end
  end
end
