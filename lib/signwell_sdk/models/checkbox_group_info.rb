# frozen_string_literal: true

module SignwellSDK
  module Models
    class CheckboxGroupInfo < SignwellSDK::Internal::Type::BaseModel
      # @!attribute id
      #   Checkbox group ID
      #
      #   @return [String]
      required :id, String

      # @!attribute checkbox_ids
      #   IDs of checkboxes in this group
      #
      #   @return [Array<String>]
      required :checkbox_ids, SignwellSDK::Internal::Type::ArrayOf[String]

      # @!attribute required
      #   Whether at least one checkbox must be checked
      #
      #   @return [Boolean]
      required :required, SignwellSDK::Internal::Type::Boolean

      # @!attribute group_name
      #   Name of the checkbox group
      #
      #   @return [String, nil]
      optional :group_name, String, nil?: true

      # @!attribute min_value
      #   Minimum number of checkboxes to check
      #
      #   @return [Integer, nil]
      optional :min_value, Integer

      # @!attribute recipient_id
      #   Recipient ID associated with the group
      #
      #   @return [String, nil]
      optional :recipient_id, String, nil?: true

      # @!attribute validation
      #   Validation rule for checkbox groups
      #
      #   @return [Symbol, SignwellSDK::Models::CheckboxValidation, nil]
      optional :validation, enum: -> { SignwellSDK::CheckboxValidation }, nil?: true

      # @!method initialize(id:, checkbox_ids:, required:, group_name: nil, min_value: nil, recipient_id: nil, validation: nil)
      #   Checkbox group configuration
      #
      #   @param id [String] Checkbox group ID
      #
      #   @param checkbox_ids [Array<String>] IDs of checkboxes in this group
      #
      #   @param required [Boolean] Whether at least one checkbox must be checked
      #
      #   @param group_name [String, nil] Name of the checkbox group
      #
      #   @param min_value [Integer] Minimum number of checkboxes to check
      #
      #   @param recipient_id [String, nil] Recipient ID associated with the group
      #
      #   @param validation [Symbol, SignwellSDK::Models::CheckboxValidation, nil] Validation rule for checkbox groups
    end
  end
end
