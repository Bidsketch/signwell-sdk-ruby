# frozen_string_literal: true

module SignwellSDK
  module Models
    class LabelInfo < SignwellSDK::Internal::Type::BaseModel
      # @!attribute id
      #   Label ID
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute name
      #   Label name
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(id: nil, name: nil)
      #   Label information
      #
      #   @param id [String] Label ID
      #
      #   @param name [String] Label name
    end
  end
end
