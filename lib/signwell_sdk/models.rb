# frozen_string_literal: true

module SignwellSDK
  [SignwellSDK::Internal::Type::BaseModel, *SignwellSDK::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, SignwellSDK::Internal::AnyHash) } }
  end

  SignwellSDK::Internal::Util.walk_namespaces(SignwellSDK::Models).each do |mod|
    case mod
    in SignwellSDK::Internal::Type::Enum | SignwellSDK::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  SignwellSDK::Internal::Util.walk_namespaces(SignwellSDK::Models)
                             .lazy
                             .grep(SignwellSDK::Internal::Type::Union)
                             .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AttachmentRequestInfo = SignwellSDK::Models::AttachmentRequestInfo

  CheckboxGroupInfo = SignwellSDK::Models::CheckboxGroupInfo

  CheckboxValidation = SignwellSDK::Models::CheckboxValidation

  CopiedContactInfo = SignwellSDK::Models::CopiedContactInfo

  DateFormat = SignwellSDK::Models::DateFormat

  ErrorResponse = SignwellSDK::Models::ErrorResponse

  FieldType = SignwellSDK::Models::FieldType

  FileInfo = SignwellSDK::Models::FileInfo

  LabelInfo = SignwellSDK::Models::LabelInfo

  RateLimitErrorResponse = SignwellSDK::Models::RateLimitErrorResponse

  TextValidation = SignwellSDK::Models::TextValidation

  V1 = SignwellSDK::Models::V1

  V1MeParams = SignwellSDK::Models::V1MeParams

  ValidationErrorResponse = SignwellSDK::Models::ValidationErrorResponse
end
