# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#list
      class DocumentListParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute limit
        #   The number of documents to fetch. Defaults to 10, max is 50.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   The page number for pagination. Defaults to the first page.
        #
        #   @return [Integer, nil]
        optional :page, Integer

        # @!method initialize(limit: nil, page: nil, request_options: {})
        #   @param limit [Integer] The number of documents to fetch. Defaults to 10, max is 50.
        #
        #   @param page [Integer] The page number for pagination. Defaults to the first page.
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
