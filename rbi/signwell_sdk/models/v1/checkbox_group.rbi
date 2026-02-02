# typed: strong

module SignwellSDK
  module Models
    module V1
      class CheckboxGroup < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::CheckboxGroup,
              SignwellSDK::Internal::AnyHash
            )
          end

        sig { returns(T::Array[String]) }
        attr_accessor :checkbox_ids

        # A unique identifier for the checkbox group.
        sig { returns(String) }
        attr_accessor :group_name

        # The recipient ID associated with the checkbox group.
        sig { returns(String) }
        attr_accessor :recipient_id

        # The exact number of checkboxes that must be checked in the group. (Only for
        # validation: exact)
        sig { returns(T.nilable(Integer)) }
        attr_reader :exact_value

        sig { params(exact_value: Integer).void }
        attr_writer :exact_value

        # The maximum number of checkboxes that can be checked in the group. (Only for
        # validation: maximum and range)
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_value

        sig { params(max_value: Integer).void }
        attr_writer :max_value

        # The minimum number of checkboxes that must be checked in the group. (Only for
        # validation: minimum and range)
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_value

        sig { params(min_value: Integer).void }
        attr_writer :min_value

        # Whether the group must be completed by the recipient. Defaults to false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :required

        sig { params(required: T::Boolean).void }
        attr_writer :required

        # Set requirements for the group of one or multiple selections by the recipient.
        # Defaults to minimum. Validation values: minimum, maximum, exact, range.
        sig do
          returns(
            T.nilable(SignwellSDK::V1::CheckboxGroup::Validation::OrSymbol)
          )
        end
        attr_reader :validation

        sig do
          params(
            validation: SignwellSDK::V1::CheckboxGroup::Validation::OrSymbol
          ).void
        end
        attr_writer :validation

        sig do
          params(
            checkbox_ids: T::Array[String],
            group_name: String,
            recipient_id: String,
            exact_value: Integer,
            max_value: Integer,
            min_value: Integer,
            required: T::Boolean,
            validation: SignwellSDK::V1::CheckboxGroup::Validation::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          checkbox_ids:,
          # A unique identifier for the checkbox group.
          group_name:,
          # The recipient ID associated with the checkbox group.
          recipient_id:,
          # The exact number of checkboxes that must be checked in the group. (Only for
          # validation: exact)
          exact_value: nil,
          # The maximum number of checkboxes that can be checked in the group. (Only for
          # validation: maximum and range)
          max_value: nil,
          # The minimum number of checkboxes that must be checked in the group. (Only for
          # validation: minimum and range)
          min_value: nil,
          # Whether the group must be completed by the recipient. Defaults to false.
          required: nil,
          # Set requirements for the group of one or multiple selections by the recipient.
          # Defaults to minimum. Validation values: minimum, maximum, exact, range.
          validation: nil
        )
        end

        sig do
          override.returns(
            {
              checkbox_ids: T::Array[String],
              group_name: String,
              recipient_id: String,
              exact_value: Integer,
              max_value: Integer,
              min_value: Integer,
              required: T::Boolean,
              validation: SignwellSDK::V1::CheckboxGroup::Validation::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Set requirements for the group of one or multiple selections by the recipient.
        # Defaults to minimum. Validation values: minimum, maximum, exact, range.
        module Validation
          extend SignwellSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, SignwellSDK::V1::CheckboxGroup::Validation)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MINIMUM =
            T.let(
              :minimum,
              SignwellSDK::V1::CheckboxGroup::Validation::TaggedSymbol
            )
          MAXIMUM =
            T.let(
              :maximum,
              SignwellSDK::V1::CheckboxGroup::Validation::TaggedSymbol
            )
          RANGE =
            T.let(
              :range,
              SignwellSDK::V1::CheckboxGroup::Validation::TaggedSymbol
            )
          EXACT =
            T.let(
              :exact,
              SignwellSDK::V1::CheckboxGroup::Validation::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[SignwellSDK::V1::CheckboxGroup::Validation::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
