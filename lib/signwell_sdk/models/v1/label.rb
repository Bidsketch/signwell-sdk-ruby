# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      class Label < SignwellSDK::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!method initialize(name:)
        #   Labels can be used to organize documents and templates in a way that can make it
        #   easy to find using the document search/template search in SignWell. Labels can
        #   be used to organize documents in a way that can make it easy to find using the
        #   document search in SignWell.
        #
        #   @param name [String]
      end
    end
  end
end
