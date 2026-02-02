# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#list
      class DocumentListResponse < SignwellSDK::Internal::Type::BaseModel
        # @!attribute current_page
        #
        #   @return [Integer]
        required :current_page, Integer

        # @!attribute documents
        #
        #   @return [Array<SignwellSDK::Models::V1::Document>]
        required :documents, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document] }

        # @!attribute total_count
        #
        #   @return [Integer]
        required :total_count, Integer

        # @!attribute total_pages
        #
        #   @return [Integer]
        required :total_pages, Integer

        # @!attribute next_page
        #
        #   @return [Integer, nil]
        optional :next_page, Integer, nil?: true

        # @!attribute previous_page
        #
        #   @return [Integer, nil]
        optional :previous_page, Integer, nil?: true

        # @!method initialize(current_page:, documents:, total_count:, total_pages:, next_page: nil, previous_page: nil)
        #   List of documents with pagination
        #
        #   @param current_page [Integer]
        #   @param documents [Array<SignwellSDK::Models::V1::Document>]
        #   @param total_count [Integer]
        #   @param total_pages [Integer]
        #   @param next_page [Integer, nil]
        #   @param previous_page [Integer, nil]
      end
    end
  end
end
