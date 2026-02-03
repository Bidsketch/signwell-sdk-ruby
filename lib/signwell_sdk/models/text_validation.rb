# frozen_string_literal: true

module SignwellSDK
  module Models
    # Validation rule for text fields
    module TextValidation
      extend SignwellSDK::Internal::Type::Enum

      NO_TEXT_VALIDATION = :no_text_validation
      NUMBERS = :numbers
      LETTERS = :letters
      EMAIL_ADDRESS = :email_address
      US_PHONE_NUMBER = :us_phone_number
      US_ZIP_CODE = :us_zip_code
      US_SSN = :us_ssn
      US_AGE = :us_age
      ALPHANUMERIC = :alphanumeric
      US_BANK_ROUTING_NUMBER = :us_bank_routing_number
      US_BANK_ACCOUNT_NUMBER = :us_bank_account_number

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
