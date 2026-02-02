# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#retrieve_completed_pdf
      class DocumentRetrieveCompletedPdfParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute audit_page
        #   Whether to include the audit page as part of the document. Defaults to `true`
        #
        #   @return [Boolean, nil]
        optional :audit_page, SignwellSDK::Internal::Type::Boolean

        # @!attribute file_format
        #   Format of the file to be downloaded. Supported formats are 'pdf' and 'zip'.
        #
        #   @return [Symbol, SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfParams::FileFormat, nil]
        optional :file_format, enum: -> { SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat }

        # @!attribute url_only
        #   Whether to return the URL of the completed PDF or the actual PDF content.
        #   Defaults to `false`.
        #
        #   @return [Boolean, nil]
        optional :url_only, SignwellSDK::Internal::Type::Boolean

        # @!method initialize(audit_page: nil, file_format: nil, url_only: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfParams} for more details.
        #
        #   @param audit_page [Boolean] Whether to include the audit page as part of the document. Defaults to `true`
        #
        #   @param file_format [Symbol, SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfParams::FileFormat] Format of the file to be downloaded. Supported formats are 'pdf' and 'zip'.
        #
        #   @param url_only [Boolean] Whether to return the URL of the completed PDF or the actual PDF content. Defaul
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]

        # Format of the file to be downloaded. Supported formats are 'pdf' and 'zip'.
        module FileFormat
          extend SignwellSDK::Internal::Type::Enum

          PDF = :pdf
          ZIP = :zip

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
