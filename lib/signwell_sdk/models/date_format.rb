# frozen_string_literal: true

module SignwellSDK
  module Models
    # Date format for date fields. Valid values: MM/DD/YYYY, DD/MM/YYYY, YYYY/MM/DD,
    # Month DD, YYYY, MM/DD/YYYY hh:mm:ss a. Default: MM/DD/YYYY
    module DateFormat
      extend SignwellSDK::Internal::Type::Enum

      MM_DD_YYYY = :"MM/DD/YYYY"
      DD_MM_YYYY = :"DD/MM/YYYY"
      YYYY_MM_DD = :"YYYY/MM/DD"
      MONTH_DD_YYYY = :"Month DD, YYYY"
      MM_DD_YYYY_HH_MM_SS_A = :"MM/DD/YYYY hh:mm:ss a"

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
