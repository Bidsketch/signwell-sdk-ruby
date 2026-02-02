# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentUpdateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::DocumentUpdateParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Whether to allow recipients the option to decline signing a document. If
        # multiple signers are involved in a document, any single recipient can cancel the
        # entire document signing process by declining to sign.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :allow_decline

        sig { params(allow_decline: T::Boolean).void }
        attr_writer :allow_decline

        # In some cases a signer is not the right person to sign and may need to reassign
        # their signing responsibilities to another person. This feature allows them to
        # reassign the document to someone else.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :allow_reassign

        sig { params(allow_reassign: T::Boolean).void }
        attr_writer :allow_reassign

        # Unique identifier for API Application settings to use. API Applications are
        # optional and mainly used when isolating OAuth apps or for more control over
        # embedded API settings
        sig { returns(T.nilable(String)) }
        attr_reader :api_application_id

        sig { params(api_application_id: String).void }
        attr_writer :api_application_id

        # When set to `true` recipients will sign one at a time in the order of the
        # `recipients` collection of this request.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :apply_signing_order

        sig { params(apply_signing_order: T::Boolean).void }
        attr_writer :apply_signing_order

        # Checkbox fields that are placed on a document can be grouped with selection
        # requirements. At least 2 checkbox fields in an array of fields must be assigned
        # to the same recipient.
        sig { returns(T.nilable(T::Array[SignwellSDK::V1::CheckboxGroup])) }
        attr_reader :checkbox_groups

        sig do
          params(
            checkbox_groups: T::Array[SignwellSDK::V1::CheckboxGroup::OrHash]
          ).void
        end
        attr_writer :checkbox_groups

        # Sets the custom requester email for the document. When set, this is the email
        # used for all email communications, signing notifications, and in the audit file.
        sig { returns(T.nilable(String)) }
        attr_reader :custom_requester_email

        sig { params(custom_requester_email: String).void }
        attr_writer :custom_requester_email

        # Sets the custom requester name for the document. When set, this is the name used
        # for all email communications, signing notifications, and in the audit file.
        sig { returns(T.nilable(String)) }
        attr_reader :custom_requester_name

        sig { params(custom_requester_name: String).void }
        attr_writer :custom_requester_name

        # A URL that recipients are redirected to if the document is declined.
        sig { returns(T.nilable(String)) }
        attr_reader :decline_redirect_url

        sig { params(decline_redirect_url: String).void }
        attr_writer :decline_redirect_url

        # When set to `true` it enables embedded signing in your website/web application.
        # Embedded functionality works with an iFrame and email authentication is
        # disabled. :embedded_signinig defaults to `false`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :embedded_signing

        sig { params(embedded_signing: T::Boolean).void }
        attr_writer :embedded_signing

        # On embedding signing, document owners (and CC'd contacts) do not get a
        # notification email when documents have been completed. Setting this param to
        # `true` will send out those final completed notifications. Default is `false`
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :embedded_signing_notifications

        sig { params(embedded_signing_notifications: T::Boolean).void }
        attr_writer :embedded_signing_notifications

        # Number of days before the signature request expires. Defaults to the account
        # expiration setting or template expiration (if the document is created from a
        # template).
        sig { returns(T.nilable(Integer)) }
        attr_reader :expires_in

        sig { params(expires_in: Integer).void }
        attr_writer :expires_in

        # Labels can be used to organize documents in a way that can make it easy to find
        # using the document search in SignWell. A document can have multiple labels.
        # Updating labels on a document will replace any existing labels for that
        # document.
        sig { returns(T.nilable(T::Array[SignwellSDK::V1::Label])) }
        attr_reader :labels

        sig { params(labels: T::Array[SignwellSDK::V1::Label::OrHash]).void }
        attr_writer :labels

        # Email message for the signature request that recipients will see. Defaults to
        # the default system message or a template message (if the document is created
        # from a template).
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Optional key-value data that can be associated with the document. If set, will
        # be available every time the document data is returned.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # The name of the document.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # A URL that recipients are redirected to after successfully signing a document.
        sig { returns(T.nilable(String)) }
        attr_reader :redirect_url

        sig { params(redirect_url: String).void }
        attr_writer :redirect_url

        # Whether to send signing reminders to recipients. Reminders are sent on day 3,
        # day 6, and day 10 if set to `true`. Defaults to `true`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :reminders

        sig { params(reminders: T::Boolean).void }
        attr_writer :reminders

        # Email subject for the signature request that recipients will see. Defaults to
        # the default system subject or a template subject (if the document is created
        # from a template).
        sig { returns(T.nilable(String)) }
        attr_reader :subject

        sig { params(subject: String).void }
        attr_writer :subject

        # Set to `true` to enable Test Mode. Documents created with Test Mode do not count
        # towards API billing and are not legally binding. Defaults to `false`
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :test_mode

        sig { params(test_mode: T::Boolean).void }
        attr_writer :test_mode

        sig do
          params(
            allow_decline: T::Boolean,
            allow_reassign: T::Boolean,
            api_application_id: String,
            apply_signing_order: T::Boolean,
            checkbox_groups: T::Array[SignwellSDK::V1::CheckboxGroup::OrHash],
            custom_requester_email: String,
            custom_requester_name: String,
            decline_redirect_url: String,
            embedded_signing: T::Boolean,
            embedded_signing_notifications: T::Boolean,
            expires_in: Integer,
            labels: T::Array[SignwellSDK::V1::Label::OrHash],
            message: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            redirect_url: String,
            reminders: T::Boolean,
            subject: String,
            test_mode: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether to allow recipients the option to decline signing a document. If
          # multiple signers are involved in a document, any single recipient can cancel the
          # entire document signing process by declining to sign.
          allow_decline: nil,
          # In some cases a signer is not the right person to sign and may need to reassign
          # their signing responsibilities to another person. This feature allows them to
          # reassign the document to someone else.
          allow_reassign: nil,
          # Unique identifier for API Application settings to use. API Applications are
          # optional and mainly used when isolating OAuth apps or for more control over
          # embedded API settings
          api_application_id: nil,
          # When set to `true` recipients will sign one at a time in the order of the
          # `recipients` collection of this request.
          apply_signing_order: nil,
          # Checkbox fields that are placed on a document can be grouped with selection
          # requirements. At least 2 checkbox fields in an array of fields must be assigned
          # to the same recipient.
          checkbox_groups: nil,
          # Sets the custom requester email for the document. When set, this is the email
          # used for all email communications, signing notifications, and in the audit file.
          custom_requester_email: nil,
          # Sets the custom requester name for the document. When set, this is the name used
          # for all email communications, signing notifications, and in the audit file.
          custom_requester_name: nil,
          # A URL that recipients are redirected to if the document is declined.
          decline_redirect_url: nil,
          # When set to `true` it enables embedded signing in your website/web application.
          # Embedded functionality works with an iFrame and email authentication is
          # disabled. :embedded_signinig defaults to `false`.
          embedded_signing: nil,
          # On embedding signing, document owners (and CC'd contacts) do not get a
          # notification email when documents have been completed. Setting this param to
          # `true` will send out those final completed notifications. Default is `false`
          embedded_signing_notifications: nil,
          # Number of days before the signature request expires. Defaults to the account
          # expiration setting or template expiration (if the document is created from a
          # template).
          expires_in: nil,
          # Labels can be used to organize documents in a way that can make it easy to find
          # using the document search in SignWell. A document can have multiple labels.
          # Updating labels on a document will replace any existing labels for that
          # document.
          labels: nil,
          # Email message for the signature request that recipients will see. Defaults to
          # the default system message or a template message (if the document is created
          # from a template).
          message: nil,
          # Optional key-value data that can be associated with the document. If set, will
          # be available every time the document data is returned.
          metadata: nil,
          # The name of the document.
          name: nil,
          # A URL that recipients are redirected to after successfully signing a document.
          redirect_url: nil,
          # Whether to send signing reminders to recipients. Reminders are sent on day 3,
          # day 6, and day 10 if set to `true`. Defaults to `true`.
          reminders: nil,
          # Email subject for the signature request that recipients will see. Defaults to
          # the default system subject or a template subject (if the document is created
          # from a template).
          subject: nil,
          # Set to `true` to enable Test Mode. Documents created with Test Mode do not count
          # towards API billing and are not legally binding. Defaults to `false`
          test_mode: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              allow_decline: T::Boolean,
              allow_reassign: T::Boolean,
              api_application_id: String,
              apply_signing_order: T::Boolean,
              checkbox_groups: T::Array[SignwellSDK::V1::CheckboxGroup],
              custom_requester_email: String,
              custom_requester_name: String,
              decline_redirect_url: String,
              embedded_signing: T::Boolean,
              embedded_signing_notifications: T::Boolean,
              expires_in: Integer,
              labels: T::Array[SignwellSDK::V1::Label],
              message: String,
              metadata: T::Hash[Symbol, String],
              name: String,
              redirect_url: String,
              reminders: T::Boolean,
              subject: String,
              test_mode: T::Boolean,
              request_options: SignwellSDK::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
