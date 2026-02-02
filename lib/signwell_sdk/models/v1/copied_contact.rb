# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      class CopiedContact < SignwellSDK::Internal::Type::BaseModel
        # @!attribute email
        #   Email for the copied contact.
        #
        #   @return [String]
        required :email, String

        # @!attribute name
        #   Name of the copied contact.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(email:, name: nil)
        #   @param email [String] Email for the copied contact.
        #
        #   @param name [String] Name of the copied contact.
      end
    end
  end
end
