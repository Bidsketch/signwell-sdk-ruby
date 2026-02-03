# frozen_string_literal: true

module SignwellSDK
  module Models
    # Type of signing field
    module FieldType
      extend SignwellSDK::Internal::Type::Enum

      INITIALS = :initials
      SIGNATURE = :signature
      CHECKBOX = :checkbox
      DATE = :date
      SELECT = :select
      TEXT = :text
      DROPDOWN = :dropdown
      AUTOFILL_COMPANY = :autofill_company
      AUTOFILL_EMAIL = :autofill_email
      AUTOFILL_FIRST_NAME = :autofill_first_name
      AUTOFILL_LAST_NAME = :autofill_last_name
      AUTOFILL_NAME = :autofill_name
      AUTOFILL_PHONE = :autofill_phone
      AUTOFILL_TITLE = :autofill_title
      AUTOFILL_DATE_SIGNED = :autofill_date_signed

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
