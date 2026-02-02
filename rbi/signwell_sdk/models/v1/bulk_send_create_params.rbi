# typed: strong

module SignwellSDK
  module Models
    module V1
      class BulkSendCreateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::BulkSendCreateParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # A RFC 4648 base64 string of the template CSV file to be validated.
        sig { returns(String) }
        attr_accessor :bulk_send_csv

        # Unique identifiers for a list of templates.
        sig { returns(T::Array[String]) }
        attr_accessor :template_ids

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

        # Email message for the signature request that recipients will see. Defaults to
        # the default system message or a template message.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # The name of the Bulk Send. Will be used as the document name for each of the
        # documents.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Whether to skip errors in the rows. Defaults to `false`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :skip_row_errors

        sig { params(skip_row_errors: T::Boolean).void }
        attr_writer :skip_row_errors

        # Email subject for the signature request that recipients will see. Defaults to
        # the default system subject or a template subject.
        sig { returns(T.nilable(String)) }
        attr_reader :subject

        sig { params(subject: String).void }
        attr_writer :subject

        sig do
          params(
            bulk_send_csv: String,
            template_ids: T::Array[String],
            api_application_id: String,
            apply_signing_order: T::Boolean,
            custom_requester_email: String,
            custom_requester_name: String,
            message: String,
            name: String,
            skip_row_errors: T::Boolean,
            subject: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A RFC 4648 base64 string of the template CSV file to be validated.
          bulk_send_csv:,
          # Unique identifiers for a list of templates.
          template_ids:,
          # Unique identifier for API Application settings to use. API Applications are
          # optional and mainly used when isolating OAuth apps or for more control over
          # embedded API settings
          api_application_id: nil,
          # When set to `true` recipients will sign one at a time in the order of the
          # `recipients` collection of this request.
          apply_signing_order: nil,
          # Sets the custom requester email for the document. When set, this is the email
          # used for all email communications, signing notifications, and in the audit file.
          custom_requester_email: nil,
          # Sets the custom requester name for the document. When set, this is the name used
          # for all email communications, signing notifications, and in the audit file.
          custom_requester_name: nil,
          # Email message for the signature request that recipients will see. Defaults to
          # the default system message or a template message.
          message: nil,
          # The name of the Bulk Send. Will be used as the document name for each of the
          # documents.
          name: nil,
          # Whether to skip errors in the rows. Defaults to `false`.
          skip_row_errors: nil,
          # Email subject for the signature request that recipients will see. Defaults to
          # the default system subject or a template subject.
          subject: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              bulk_send_csv: String,
              template_ids: T::Array[String],
              api_application_id: String,
              apply_signing_order: T::Boolean,
              custom_requester_email: String,
              custom_requester_name: String,
              message: String,
              name: String,
              skip_row_errors: T::Boolean,
              subject: String,
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
