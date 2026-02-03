# frozen_string_literal: true

module SignwellSDK
  module Models
    class CopiedContactInfo < SignwellSDK::Internal::Type::BaseModel
      # @!attribute email
      #   Contact email
      #
      #   @return [String]
      required :email, String

      # @!attribute id
      #   Contact ID
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute name
      #   Contact name
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(email:, id: nil, name: nil)
      #   Copied contact information
      #
      #   @param email [String] Contact email
      #
      #   @param id [String] Contact ID
      #
      #   @param name [String] Contact name
    end
  end
end
