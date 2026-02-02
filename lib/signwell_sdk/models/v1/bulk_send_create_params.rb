# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::BulkSends#create
      class BulkSendCreateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute bulk_send_csv
        #   A RFC 4648 base64 string of the template CSV file to be validated.
        #
        #   @return [String]
        required :bulk_send_csv, String

        # @!attribute template_ids
        #   Unique identifiers for a list of templates.
        #
        #   @return [Array<String>]
        required :template_ids, SignwellSDK::Internal::Type::ArrayOf[String]

        # @!attribute api_application_id
        #   Unique identifier for API Application settings to use. API Applications are
        #   optional and mainly used when isolating OAuth apps or for more control over
        #   embedded API settings
        #
        #   @return [String, nil]
        optional :api_application_id, String

        # @!attribute apply_signing_order
        #   When set to `true` recipients will sign one at a time in the order of the
        #   `recipients` collection of this request.
        #
        #   @return [Boolean, nil]
        optional :apply_signing_order, SignwellSDK::Internal::Type::Boolean

        # @!attribute custom_requester_email
        #   Sets the custom requester email for the document. When set, this is the email
        #   used for all email communications, signing notifications, and in the audit file.
        #
        #   @return [String, nil]
        optional :custom_requester_email, String

        # @!attribute custom_requester_name
        #   Sets the custom requester name for the document. When set, this is the name used
        #   for all email communications, signing notifications, and in the audit file.
        #
        #   @return [String, nil]
        optional :custom_requester_name, String

        # @!attribute message
        #   Email message for the signature request that recipients will see. Defaults to
        #   the default system message or a template message.
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute name
        #   The name of the Bulk Send. Will be used as the document name for each of the
        #   documents.
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute skip_row_errors
        #   Whether to skip errors in the rows. Defaults to `false`.
        #
        #   @return [Boolean, nil]
        optional :skip_row_errors, SignwellSDK::Internal::Type::Boolean

        # @!attribute subject
        #   Email subject for the signature request that recipients will see. Defaults to
        #   the default system subject or a template subject.
        #
        #   @return [String, nil]
        optional :subject, String

        # @!method initialize(bulk_send_csv:, template_ids:, api_application_id: nil, apply_signing_order: nil, custom_requester_email: nil, custom_requester_name: nil, message: nil, name: nil, skip_row_errors: nil, subject: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::BulkSendCreateParams} for more details.
        #
        #   @param bulk_send_csv [String] A RFC 4648 base64 string of the template CSV file to be validated.
        #
        #   @param template_ids [Array<String>] Unique identifiers for a list of templates.
        #
        #   @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        #   @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        #   @param custom_requester_email [String] Sets the custom requester email for the document. When set, this is the email us
        #
        #   @param custom_requester_name [String] Sets the custom requester name for the document. When set, this is the name used
        #
        #   @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        #   @param name [String] The name of the Bulk Send. Will be used as the document name for each of the doc
        #
        #   @param skip_row_errors [Boolean] Whether to skip errors in the rows. Defaults to `false`.
        #
        #   @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
