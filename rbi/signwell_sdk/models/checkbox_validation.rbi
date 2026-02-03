# typed: strong

module SignwellSDK
  module Models
    # Validation rule for checkbox groups
    module CheckboxValidation
      extend SignwellSDK::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, SignwellSDK::CheckboxValidation) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      MINIMUM = T.let(:minimum, SignwellSDK::CheckboxValidation::TaggedSymbol)
      MAXIMUM = T.let(:maximum, SignwellSDK::CheckboxValidation::TaggedSymbol)
      RANGE = T.let(:range, SignwellSDK::CheckboxValidation::TaggedSymbol)
      EXACT = T.let(:exact, SignwellSDK::CheckboxValidation::TaggedSymbol)

      sig do
        override.returns(
          T::Array[SignwellSDK::CheckboxValidation::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
