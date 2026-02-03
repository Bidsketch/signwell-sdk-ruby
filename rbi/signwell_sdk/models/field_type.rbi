# typed: strong

module SignwellSDK
  module Models
    # Type of signing field
    module FieldType
      extend SignwellSDK::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, SignwellSDK::FieldType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INITIALS = T.let(:initials, SignwellSDK::FieldType::TaggedSymbol)
      SIGNATURE = T.let(:signature, SignwellSDK::FieldType::TaggedSymbol)
      CHECKBOX = T.let(:checkbox, SignwellSDK::FieldType::TaggedSymbol)
      DATE = T.let(:date, SignwellSDK::FieldType::TaggedSymbol)
      SELECT = T.let(:select, SignwellSDK::FieldType::TaggedSymbol)
      TEXT = T.let(:text, SignwellSDK::FieldType::TaggedSymbol)
      DROPDOWN = T.let(:dropdown, SignwellSDK::FieldType::TaggedSymbol)
      AUTOFILL_COMPANY =
        T.let(:autofill_company, SignwellSDK::FieldType::TaggedSymbol)
      AUTOFILL_EMAIL =
        T.let(:autofill_email, SignwellSDK::FieldType::TaggedSymbol)
      AUTOFILL_FIRST_NAME =
        T.let(:autofill_first_name, SignwellSDK::FieldType::TaggedSymbol)
      AUTOFILL_LAST_NAME =
        T.let(:autofill_last_name, SignwellSDK::FieldType::TaggedSymbol)
      AUTOFILL_NAME =
        T.let(:autofill_name, SignwellSDK::FieldType::TaggedSymbol)
      AUTOFILL_PHONE =
        T.let(:autofill_phone, SignwellSDK::FieldType::TaggedSymbol)
      AUTOFILL_TITLE =
        T.let(:autofill_title, SignwellSDK::FieldType::TaggedSymbol)
      AUTOFILL_DATE_SIGNED =
        T.let(:autofill_date_signed, SignwellSDK::FieldType::TaggedSymbol)

      sig { override.returns(T::Array[SignwellSDK::FieldType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
