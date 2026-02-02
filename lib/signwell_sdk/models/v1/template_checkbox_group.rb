# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      class TemplateCheckboxGroup < SignwellSDK::Internal::Type::BaseModel
        # @!attribute checkbox_ids
        #
        #   @return [Array<String>]
        required :checkbox_ids, SignwellSDK::Internal::Type::ArrayOf[String]

        # @!attribute group_name
        #   A unique identifier for the checkbox group.
        #
        #   @return [String]
        required :group_name, String

        # @!attribute placeholder_id
        #   The recipient ID associated with the checkbox group.
        #
        #   @return [String]
        required :placeholder_id, String

        # @!attribute exact_value
        #   The exact number of checkboxes that must be checked in the group. (Only for
        #   validation: exact)
        #
        #   @return [Integer, nil]
        optional :exact_value, Integer

        # @!attribute max_value
        #   The maximum number of checkboxes that can be checked in the group. (Only for
        #   validation: maximum and range)
        #
        #   @return [Integer, nil]
        optional :max_value, Integer

        # @!attribute min_value
        #   The minimum number of checkboxes that must be checked in the group. (Only for
        #   validation: minimum and range)
        #
        #   @return [Integer, nil]
        optional :min_value, Integer

        # @!attribute required
        #   Whether the group must be completed by the recipient. Defaults to false.
        #
        #   @return [Boolean, nil]
        optional :required, SignwellSDK::Internal::Type::Boolean

        # @!attribute validation
        #   Set requirements for the group of one or multiple selections by the recipient.
        #   Defaults to minimum. Validation values: minimum, maximum, exact, range.
        #
        #   @return [Symbol, SignwellSDK::Models::V1::TemplateCheckboxGroup::Validation, nil]
        optional :validation, enum: -> { SignwellSDK::V1::TemplateCheckboxGroup::Validation }

        # @!method initialize(checkbox_ids:, group_name:, placeholder_id:, exact_value: nil, max_value: nil, min_value: nil, required: nil, validation: nil)
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::TemplateCheckboxGroup} for more details.
        #
        #   @param checkbox_ids [Array<String>]
        #
        #   @param group_name [String] A unique identifier for the checkbox group.
        #
        #   @param placeholder_id [String] The recipient ID associated with the checkbox group.
        #
        #   @param exact_value [Integer] The exact number of checkboxes that must be checked in the group. (Only for vali
        #
        #   @param max_value [Integer] The maximum number of checkboxes that can be checked in the group. (Only for val
        #
        #   @param min_value [Integer] The minimum number of checkboxes that must be checked in the group. (Only for va
        #
        #   @param required [Boolean] Whether the group must be completed by the recipient. Defaults to false.
        #
        #   @param validation [Symbol, SignwellSDK::Models::V1::TemplateCheckboxGroup::Validation] Set requirements for the group of one or multiple selections by the recipient. D

        # Set requirements for the group of one or multiple selections by the recipient.
        # Defaults to minimum. Validation values: minimum, maximum, exact, range.
        #
        # @see SignwellSDK::Models::V1::TemplateCheckboxGroup#validation
        module Validation
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
  end
end
