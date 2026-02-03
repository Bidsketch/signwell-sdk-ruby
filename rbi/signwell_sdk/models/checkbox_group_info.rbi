# typed: strong

module SignwellSDK
  module Models
    class CheckboxGroupInfo < SignwellSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SignwellSDK::CheckboxGroupInfo, SignwellSDK::Internal::AnyHash)
        end

      # Checkbox group ID
      sig { returns(String) }
      attr_accessor :id

      # IDs of checkboxes in this group
      sig { returns(T::Array[String]) }
      attr_accessor :checkbox_ids

      # Whether at least one checkbox must be checked
      sig { returns(T::Boolean) }
      attr_accessor :required

      # Name of the checkbox group
      sig { returns(T.nilable(String)) }
      attr_accessor :group_name

      # Minimum number of checkboxes to check
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_value

      sig { params(min_value: Integer).void }
      attr_writer :min_value

      # Recipient ID associated with the group
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient_id

      # Validation rule for checkbox groups
      sig { returns(T.nilable(SignwellSDK::CheckboxValidation::TaggedSymbol)) }
      attr_accessor :validation

      # Checkbox group configuration
      sig do
        params(
          id: String,
          checkbox_ids: T::Array[String],
          required: T::Boolean,
          group_name: T.nilable(String),
          min_value: Integer,
          recipient_id: T.nilable(String),
          validation: T.nilable(SignwellSDK::CheckboxValidation::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        # Checkbox group ID
        id:,
        # IDs of checkboxes in this group
        checkbox_ids:,
        # Whether at least one checkbox must be checked
        required:,
        # Name of the checkbox group
        group_name: nil,
        # Minimum number of checkboxes to check
        min_value: nil,
        # Recipient ID associated with the group
        recipient_id: nil,
        # Validation rule for checkbox groups
        validation: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            checkbox_ids: T::Array[String],
            required: T::Boolean,
            group_name: T.nilable(String),
            min_value: Integer,
            recipient_id: T.nilable(String),
            validation: T.nilable(SignwellSDK::CheckboxValidation::TaggedSymbol)
          }
        )
      end
      def to_hash
      end
    end
  end
end
