# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::DocumentTemplates#update
      class DocumentTemplateUpdateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute allow_decline
        #   Whether to allow recipients the option to decline signing a document. If
        #   multiple signers are involved in a document, any single recipient can cancel the
        #   entire document signing process by declining to sign.
        #
        #   @return [Boolean, nil]
        optional :allow_decline, SignwellSDK::Internal::Type::Boolean

        # @!attribute allow_reassign
        #   In some cases a signer is not the right person to sign and may need to reassign
        #   their signing responsibilities to another person. This feature allows them to
        #   reassign the document to someone else.
        #
        #   @return [Boolean, nil]
        optional :allow_reassign, SignwellSDK::Internal::Type::Boolean

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

        # @!attribute checkbox_groups
        #   Checkbox fields that are placed on a document can be grouped with selection
        #   requirements. At least 2 checkbox fields in an array of fields must be assigned
        #   to the same recipient.
        #
        #   @return [Array<SignwellSDK::Models::V1::TemplateCheckboxGroup>, nil]
        optional :checkbox_groups,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::TemplateCheckboxGroup] }

        # @!attribute decline_redirect_url
        #   A URL that recipients are redirected to if the document is declined.
        #
        #   @return [String, nil]
        optional :decline_redirect_url, String

        # @!attribute draft
        #   Whether the template can still be updated before it is ready for usage. If set
        #   to `false` the template is marked as `Available` and it will be ready for use.
        #   Defaults to `false`.
        #
        #   @return [Boolean, nil]
        optional :draft, SignwellSDK::Internal::Type::Boolean

        # @!attribute expires_in
        #   Number of days before the signature request expires. Defaults to the account
        #   expiration setting or template expiration (if the document is created from a
        #   template).
        #
        #   @return [Integer, nil]
        optional :expires_in, Integer

        # @!attribute labels
        #   Labels can be used to organize documents in a way that can make it easy to find
        #   using the document search in SignWell. A document can have multiple labels.
        #   Updating labels on a document will replace any existing labels for that
        #   document.
        #
        #   @return [Array<SignwellSDK::Models::V1::Label>, nil]
        optional :labels, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Label] }

        # @!attribute message
        #   Email message for the signature request that recipients will see. Defaults to
        #   the default system message or a template message (if the document is created
        #   from a template).
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute metadata
        #   Optional key-value data that can be associated with the document. If set, will
        #   be available every time the document data is returned.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, SignwellSDK::Internal::Type::HashOf[String]

        # @!attribute name
        #   The name of the template.
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute redirect_url
        #   A URL that recipients are redirected to after successfully signing a document.
        #
        #   @return [String, nil]
        optional :redirect_url, String

        # @!attribute reminders
        #   Whether to send signing reminders to recipients. Reminders are sent on day 3,
        #   day 6, and day 10 if set to `true`. Defaults to `true`.
        #
        #   @return [Boolean, nil]
        optional :reminders, SignwellSDK::Internal::Type::Boolean

        # @!attribute subject
        #   Email subject for the signature request that recipients will see. Defaults to
        #   the default system subject or a template subject (if the document is created
        #   from a template).
        #
        #   @return [String, nil]
        optional :subject, String

        # @!method initialize(allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, checkbox_groups: nil, decline_redirect_url: nil, draft: nil, expires_in: nil, labels: nil, message: nil, metadata: nil, name: nil, redirect_url: nil, reminders: nil, subject: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::DocumentTemplateUpdateParams} for more details.
        #
        #   @param allow_decline [Boolean] Whether to allow recipients the option to decline signing a document. If multipl
        #
        #   @param allow_reassign [Boolean] In some cases a signer is not the right person to sign and may need to reassign
        #
        #   @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        #   @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        #   @param checkbox_groups [Array<SignwellSDK::Models::V1::TemplateCheckboxGroup>] Checkbox fields that are placed on a document can be grouped with selection requ
        #
        #   @param decline_redirect_url [String] A URL that recipients are redirected to if the document is declined.
        #
        #   @param draft [Boolean] Whether the template can still be updated before it is ready for usage. If set t
        #
        #   @param expires_in [Integer] Number of days before the signature request expires. Defaults to the account exp
        #
        #   @param labels [Array<SignwellSDK::Models::V1::Label>] Labels can be used to organize documents in a way that can make it easy to find
        #
        #   @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        #   @param metadata [Hash{Symbol=>String}] Optional key-value data that can be associated with the document. If set, will b
        #
        #   @param name [String] The name of the template.
        #
        #   @param redirect_url [String] A URL that recipients are redirected to after successfully signing a document.
        #
        #   @param reminders [Boolean] Whether to send signing reminders to recipients. Reminders are sent on day 3, da
        #
        #   @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
