# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::BulkSends#validate_csv
      class BulkSendValidateCsvParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute bulk_send_csv
        #   A RFC 4648 base64 string of the template CSV file to be validated.
        #
        #   @return [String]
        required :bulk_send_csv, String

        # @!attribute template_ids
        #   Specify one or more templates to generate a single blank CSV file that will
        #   contain available columns for your recipient data. The template_ids[] parameter
        #   is an array of template IDs
        #   (e.g.,`/?template_ids[]=5a67dbd7-928a-4ea0-a7e2-e476a0eb045f&template_ids[]=d7315111-c671-4b15-8354-c9a19bbaefa0`).
        #   Each ID should be a separate parameter in the query string.
        #
        #   @return [Array<String>]
        required :template_ids, SignwellSDK::Internal::Type::ArrayOf[String]

        # @!method initialize(bulk_send_csv:, template_ids:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::BulkSendValidateCsvParams} for more details.
        #
        #   @param bulk_send_csv [String] A RFC 4648 base64 string of the template CSV file to be validated.
        #
        #   @param template_ids [Array<String>] Specify one or more templates to generate a single blank CSV file that will cont
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
