# typed: strong

module SignwellSDK
  module Models
    # Validation rule for text fields
    module TextValidation
      extend SignwellSDK::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, SignwellSDK::TextValidation) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      NO_TEXT_VALIDATION =
        T.let(:no_text_validation, SignwellSDK::TextValidation::TaggedSymbol)
      NUMBERS = T.let(:numbers, SignwellSDK::TextValidation::TaggedSymbol)
      LETTERS = T.let(:letters, SignwellSDK::TextValidation::TaggedSymbol)
      EMAIL_ADDRESS =
        T.let(:email_address, SignwellSDK::TextValidation::TaggedSymbol)
      US_PHONE_NUMBER =
        T.let(:us_phone_number, SignwellSDK::TextValidation::TaggedSymbol)
      US_ZIP_CODE =
        T.let(:us_zip_code, SignwellSDK::TextValidation::TaggedSymbol)
      US_SSN = T.let(:us_ssn, SignwellSDK::TextValidation::TaggedSymbol)
      US_AGE = T.let(:us_age, SignwellSDK::TextValidation::TaggedSymbol)
      ALPHANUMERIC =
        T.let(:alphanumeric, SignwellSDK::TextValidation::TaggedSymbol)
      US_BANK_ROUTING_NUMBER =
        T.let(
          :us_bank_routing_number,
          SignwellSDK::TextValidation::TaggedSymbol
        )
      US_BANK_ACCOUNT_NUMBER =
        T.let(
          :us_bank_account_number,
          SignwellSDK::TextValidation::TaggedSymbol
        )

      sig do
        override.returns(T::Array[SignwellSDK::TextValidation::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
