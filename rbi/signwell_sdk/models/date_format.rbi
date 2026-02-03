# typed: strong

module SignwellSDK
  module Models
    # Date format for date fields. Valid values: MM/DD/YYYY, DD/MM/YYYY, YYYY/MM/DD,
    # Month DD, YYYY, MM/DD/YYYY hh:mm:ss a. Default: MM/DD/YYYY
    module DateFormat
      extend SignwellSDK::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, SignwellSDK::DateFormat) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      MM_DD_YYYY = T.let(:"MM/DD/YYYY", SignwellSDK::DateFormat::TaggedSymbol)
      DD_MM_YYYY = T.let(:"DD/MM/YYYY", SignwellSDK::DateFormat::TaggedSymbol)
      YYYY_MM_DD = T.let(:"YYYY/MM/DD", SignwellSDK::DateFormat::TaggedSymbol)
      MONTH_DD_YYYY =
        T.let(:"Month DD, YYYY", SignwellSDK::DateFormat::TaggedSymbol)
      MM_DD_YYYY_HH_MM_SS_A =
        T.let(:"MM/DD/YYYY hh:mm:ss a", SignwellSDK::DateFormat::TaggedSymbol)

      sig { override.returns(T::Array[SignwellSDK::DateFormat::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
