# frozen_string_literal: true

module SignwellSDK
  module Models
    # Validation rule for checkbox groups
    module CheckboxValidation
      extend SignwellSDK::Internal::Type::Enum

      MINIMUM = :minimum
      MAXIMUM = :maximum
      RANGE = :range
      EXACT = :exact

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
