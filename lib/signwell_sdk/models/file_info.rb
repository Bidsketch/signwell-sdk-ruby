# frozen_string_literal: true

module SignwellSDK
  module Models
    class FileInfo < SignwellSDK::Internal::Type::BaseModel
      # @!attribute name
      #   File name
      #
      #   @return [String]
      required :name, String

      # @!attribute pages_number
      #   Number of pages in the file
      #
      #   @return [Integer]
      required :pages_number, Integer

      # @!method initialize(name:, pages_number:)
      #   File information
      #
      #   @param name [String] File name
      #
      #   @param pages_number [Integer] Number of pages in the file
    end
  end
end
