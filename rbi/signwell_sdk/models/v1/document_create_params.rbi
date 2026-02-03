# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentCreateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::DocumentCreateParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Document files can be uploaded by specifying a file URL or base64 string. Either
        # `file_url` or `file_base64` must be present (not both). Valid file types are:
        # .pdf, .doc, .docx, .pages, .ppt, .pptx, .key, .xls, .xlsx, .numbers, .jpg,
        # .jpeg, .png, .tiff, .tif, .webp, .html, and .htm
        sig { returns(T::Array[SignwellSDK::V1::DocumentFile]) }
        attr_accessor :files

        # Document recipients are people that must complete and/or sign a document.
        sig do
          returns(T::Array[SignwellSDK::V1::DocumentCreateParams::Recipient])
        end
        attr_accessor :recipients

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

        # Attachments that a recipient must upload to complete the signing process.
        # Attachment requests are shown after all document fields have been completed.
        sig { returns(T.nilable(T::Array[SignwellSDK::V1::AttachmentRequest])) }
        attr_reader :attachment_requests

        sig do
          params(
            attachment_requests:
              T::Array[SignwellSDK::V1::AttachmentRequest::OrHash]
          ).void
        end
        attr_writer :attachment_requests

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

        # Copied contacts are emailed the final document once it has been completed by all
        # recipients.
        sig { returns(T.nilable(T::Array[SignwellSDK::V1::CopiedContact])) }
        attr_reader :copied_contacts

        sig do
          params(
            copied_contacts: T::Array[SignwellSDK::V1::CopiedContact::OrHash]
          ).void
        end
        attr_writer :copied_contacts

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

        # Whether the document can still be updated before sending a signature request. If
        # set to `false` the document is sent for signing as part of this request.
        # Defaults to `false`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :draft

        sig { params(draft: T::Boolean).void }
        attr_writer :draft

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

        # Document fields placed on a document for collecting data or signatures from
        # recipients. At least one field must be present in the Create Document request if
        # `draft` is `false` (unless adding a signature page by using
        # `with_signature_page`). Field data should be sent as a 2-dimensional JSON array.
        # One array of fields is needed for each file in the files array. An array of
        # fields can be empty if you have a file that does not contain any fields.
        sig do
          returns(
            T.nilable(
              T::Array[T::Array[SignwellSDK::V1::DocumentCreateParams::Field]]
            )
          )
        end
        attr_reader :fields

        sig do
          params(
            fields:
              T::Array[
                T::Array[SignwellSDK::V1::DocumentCreateParams::Field::OrHash]
              ]
          ).void
        end
        attr_writer :fields

        # Labels can be used to organize documents in a way that can make it easy to find
        # using the document search in SignWell. A document can have multiple labels.
        sig { returns(T.nilable(T::Array[SignwellSDK::V1::Label])) }
        attr_reader :labels

        sig { params(labels: T::Array[SignwellSDK::V1::Label::OrHash]).void }
        attr_writer :labels

        # Sets the language for all recipients on the document and updates all recipient
        # side interactions including the document email and the document itself. Accepted
        # languages: English, Français, Español, Deutsch, Polski, Português, Dansk,
        # Nederlands, Italiano, Русский, Svenska, العربية, Ελληνικά, Türkçe, Slovenčina.
        # Defaults to English. Language should be sent in ISO 639-1 format: en, fr, es,
        # de, pl, pt, da, nl, it, ru, sv, ar, el, tr, sk.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

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

        # An alternative way (if you can’t use the recommended way) of placing fields in
        # specific locations of your document by using special text tags. Useful when
        # changing the content of your files changes the location of fields. See API
        # documentation for “Text Tags” for details. Defaults to false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :text_tags

        sig { params(text_tags: T::Boolean).void }
        attr_writer :text_tags

        # When set to `true` the document will have a signature page added to the end, and
        # all signers will be required to add their signature on that page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :with_signature_page

        sig { params(with_signature_page: T::Boolean).void }
        attr_writer :with_signature_page

        sig do
          params(
            files: T::Array[SignwellSDK::V1::DocumentFile::OrHash],
            recipients:
              T::Array[
                SignwellSDK::V1::DocumentCreateParams::Recipient::OrHash
              ],
            allow_decline: T::Boolean,
            allow_reassign: T::Boolean,
            api_application_id: String,
            apply_signing_order: T::Boolean,
            attachment_requests:
              T::Array[SignwellSDK::V1::AttachmentRequest::OrHash],
            checkbox_groups: T::Array[SignwellSDK::V1::CheckboxGroup::OrHash],
            copied_contacts: T::Array[SignwellSDK::V1::CopiedContact::OrHash],
            custom_requester_email: String,
            custom_requester_name: String,
            decline_redirect_url: String,
            draft: T::Boolean,
            embedded_signing: T::Boolean,
            embedded_signing_notifications: T::Boolean,
            expires_in: Integer,
            fields:
              T::Array[
                T::Array[SignwellSDK::V1::DocumentCreateParams::Field::OrHash]
              ],
            labels: T::Array[SignwellSDK::V1::Label::OrHash],
            language: String,
            message: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            redirect_url: String,
            reminders: T::Boolean,
            subject: String,
            test_mode: T::Boolean,
            text_tags: T::Boolean,
            with_signature_page: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Document files can be uploaded by specifying a file URL or base64 string. Either
          # `file_url` or `file_base64` must be present (not both). Valid file types are:
          # .pdf, .doc, .docx, .pages, .ppt, .pptx, .key, .xls, .xlsx, .numbers, .jpg,
          # .jpeg, .png, .tiff, .tif, .webp, .html, and .htm
          files:,
          # Document recipients are people that must complete and/or sign a document.
          recipients:,
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
          # Attachments that a recipient must upload to complete the signing process.
          # Attachment requests are shown after all document fields have been completed.
          attachment_requests: nil,
          # Checkbox fields that are placed on a document can be grouped with selection
          # requirements. At least 2 checkbox fields in an array of fields must be assigned
          # to the same recipient.
          checkbox_groups: nil,
          # Copied contacts are emailed the final document once it has been completed by all
          # recipients.
          copied_contacts: nil,
          # Sets the custom requester email for the document. When set, this is the email
          # used for all email communications, signing notifications, and in the audit file.
          custom_requester_email: nil,
          # Sets the custom requester name for the document. When set, this is the name used
          # for all email communications, signing notifications, and in the audit file.
          custom_requester_name: nil,
          # A URL that recipients are redirected to if the document is declined.
          decline_redirect_url: nil,
          # Whether the document can still be updated before sending a signature request. If
          # set to `false` the document is sent for signing as part of this request.
          # Defaults to `false`.
          draft: nil,
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
          # Document fields placed on a document for collecting data or signatures from
          # recipients. At least one field must be present in the Create Document request if
          # `draft` is `false` (unless adding a signature page by using
          # `with_signature_page`). Field data should be sent as a 2-dimensional JSON array.
          # One array of fields is needed for each file in the files array. An array of
          # fields can be empty if you have a file that does not contain any fields.
          fields: nil,
          # Labels can be used to organize documents in a way that can make it easy to find
          # using the document search in SignWell. A document can have multiple labels.
          labels: nil,
          # Sets the language for all recipients on the document and updates all recipient
          # side interactions including the document email and the document itself. Accepted
          # languages: English, Français, Español, Deutsch, Polski, Português, Dansk,
          # Nederlands, Italiano, Русский, Svenska, العربية, Ελληνικά, Türkçe, Slovenčina.
          # Defaults to English. Language should be sent in ISO 639-1 format: en, fr, es,
          # de, pl, pt, da, nl, it, ru, sv, ar, el, tr, sk.
          language: nil,
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
          # An alternative way (if you can’t use the recommended way) of placing fields in
          # specific locations of your document by using special text tags. Useful when
          # changing the content of your files changes the location of fields. See API
          # documentation for “Text Tags” for details. Defaults to false.
          text_tags: nil,
          # When set to `true` the document will have a signature page added to the end, and
          # all signers will be required to add their signature on that page.
          with_signature_page: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              files: T::Array[SignwellSDK::V1::DocumentFile],
              recipients:
                T::Array[SignwellSDK::V1::DocumentCreateParams::Recipient],
              allow_decline: T::Boolean,
              allow_reassign: T::Boolean,
              api_application_id: String,
              apply_signing_order: T::Boolean,
              attachment_requests: T::Array[SignwellSDK::V1::AttachmentRequest],
              checkbox_groups: T::Array[SignwellSDK::V1::CheckboxGroup],
              copied_contacts: T::Array[SignwellSDK::V1::CopiedContact],
              custom_requester_email: String,
              custom_requester_name: String,
              decline_redirect_url: String,
              draft: T::Boolean,
              embedded_signing: T::Boolean,
              embedded_signing_notifications: T::Boolean,
              expires_in: Integer,
              fields:
                T::Array[
                  T::Array[SignwellSDK::V1::DocumentCreateParams::Field]
                ],
              labels: T::Array[SignwellSDK::V1::Label],
              language: String,
              message: String,
              metadata: T::Hash[Symbol, String],
              name: String,
              redirect_url: String,
              reminders: T::Boolean,
              subject: String,
              test_mode: T::Boolean,
              text_tags: T::Boolean,
              with_signature_page: T::Boolean,
              request_options: SignwellSDK::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Recipient < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::DocumentCreateParams::Recipient,
                SignwellSDK::Internal::AnyHash
              )
            end

          # A unique identifier that you will give to each recipient. We recommend numbering
          # sequentially from 1 to X. IDs are required for associating recipients to fields
          # and more.
          sig { returns(String) }
          attr_accessor :id

          # Email address for the recipient.
          sig { returns(String) }
          attr_accessor :email

          # Email message for the signature request that the recipient will see. Overrides
          # the general message for the document.
          sig { returns(T.nilable(String)) }
          attr_reader :message

          sig { params(message: String).void }
          attr_writer :message

          # Name of the recipient.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # If set, signers assigned with a passcode will be required to enter the passcode
          # before they’re able to view and complete the document.
          sig { returns(T.nilable(String)) }
          attr_reader :passcode

          sig { params(passcode: String).void }
          attr_writer :passcode

          # Applies on when `embedded_signing` is `true`. By default, recipients are not
          # notified through email to sign when doing embedded signing. Setting this to
          # `true` will send a notification email to the recipient. Default is `false`.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :send_email

          sig { params(send_email: T::Boolean).void }
          attr_writer :send_email

          # If `send_email` is `true` recipients will receive a new document notification
          # immediately. In the case of embedded signing, you can delay this notification to
          # only send if the document is not completed within a few minutes. The email
          # notification will not go out if the document is completed before the delay time
          # is over. Valid values are in minutes ranging from `0` to `60`. Defaults to `0`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :send_email_delay

          sig { params(send_email_delay: Integer).void }
          attr_writer :send_email_delay

          # Email subject for the signature request that the recipient will see. Overrides
          # the general subject for the document.
          sig { returns(T.nilable(String)) }
          attr_reader :subject

          sig { params(subject: String).void }
          attr_writer :subject

          sig do
            params(
              id: String,
              email: String,
              message: String,
              name: String,
              passcode: String,
              send_email: T::Boolean,
              send_email_delay: Integer,
              subject: String
            ).returns(T.attached_class)
          end
          def self.new(
            # A unique identifier that you will give to each recipient. We recommend numbering
            # sequentially from 1 to X. IDs are required for associating recipients to fields
            # and more.
            id:,
            # Email address for the recipient.
            email:,
            # Email message for the signature request that the recipient will see. Overrides
            # the general message for the document.
            message: nil,
            # Name of the recipient.
            name: nil,
            # If set, signers assigned with a passcode will be required to enter the passcode
            # before they’re able to view and complete the document.
            passcode: nil,
            # Applies on when `embedded_signing` is `true`. By default, recipients are not
            # notified through email to sign when doing embedded signing. Setting this to
            # `true` will send a notification email to the recipient. Default is `false`.
            send_email: nil,
            # If `send_email` is `true` recipients will receive a new document notification
            # immediately. In the case of embedded signing, you can delay this notification to
            # only send if the document is not completed within a few minutes. The email
            # notification will not go out if the document is completed before the delay time
            # is over. Valid values are in minutes ranging from `0` to `60`. Defaults to `0`.
            send_email_delay: nil,
            # Email subject for the signature request that the recipient will see. Overrides
            # the general subject for the document.
            subject: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                email: String,
                message: String,
                name: String,
                passcode: String,
                send_email: T::Boolean,
                send_email_delay: Integer,
                subject: String
              }
            )
          end
          def to_hash
          end
        end

        class Field < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::DocumentCreateParams::Field,
                SignwellSDK::Internal::AnyHash
              )
            end

          # The page number within the file. If the page does not exist within the file then
          # the field won't be created.
          sig { returns(Integer) }
          attr_accessor :page

          # Unique identifier of the recipient assigned to the field. Recipients assigned to
          # fields will be the only ones that will see and be able to complete those fields.
          sig { returns(String) }
          attr_accessor :recipient_id

          # Field type of the field. Valid field types: initials, signatures, checkbox,
          # date, and text. To autofill fields with contact data, use an autofill field
          # type. To group checkbox fields, enter an api_id for each checkbox and add the
          # checkbox_groups parameter.
          sig { returns(SignwellSDK::FieldType::OrSymbol) }
          attr_accessor :type

          # Horizontal value in the coordinates of the field (in pixels). Coordinates are
          # specific to the page where fields are located.
          sig { returns(Float) }
          attr_accessor :x

          # Vertical value in the coordinates of the field (in pixels). Coordinates are
          # specific to the page where fields are located.
          sig { returns(Float) }
          attr_accessor :y_

          # Whether to allow "Other" option with text input (for dropdown/select fields
          # only)
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :allow_other

          sig { params(allow_other: T::Boolean).void }
          attr_writer :allow_other

          # Unique identifier of the field. Useful when needing to reference specific field
          # values or update a document and its fields.
          sig { returns(T.nilable(String)) }
          attr_reader :api_id

          sig { params(api_id: String).void }
          attr_writer :api_id

          # Date fields only: date format to use for the field. Valid values: MM/DD/YYYY,
          # DD/MM/YYYY, YYYY/MM/DD, Month DD, YYYY, and MM/DD/YYYY hh:mm:ss a. Defaults to
          # MM/DD/YYYY.
          sig { returns(T.nilable(SignwellSDK::DateFormat::OrSymbol)) }
          attr_reader :date_format

          sig { params(date_format: SignwellSDK::DateFormat::OrSymbol).void }
          attr_writer :date_format

          # Default selected option (for dropdown/select fields only)
          sig { returns(T.nilable(String)) }
          attr_reader :default_option

          sig { params(default_option: String).void }
          attr_writer :default_option

          # Text fields only: whether the field width will stay fixed and text will display
          # in multiple lines, rather than one long line. If set to `false` the field width
          # will automatically grow horizontally to fit text on one line. Defaults to
          # `false`.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :fixed_width

          sig { params(fixed_width: T::Boolean).void }
          attr_writer :fixed_width

          # Height of the field (in pixels). Maximum height varies by field type:
          # Signature/Initials (200px), others (74px). When using text tags if the height is
          # greater than the maximum height, the height will be set to the maximum height.
          sig { returns(T.nilable(Float)) }
          attr_reader :height

          sig { params(height: Float).void }
          attr_writer :height

          # Text and Date fields only: label that is displayed when the field is empty.
          sig { returns(T.nilable(String)) }
          attr_reader :label

          sig { params(label: String).void }
          attr_writer :label

          # Date fields only: makes fields readonly and automatically populates with the
          # date the recipient signed. Defaults to `false`.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :lock_sign_date

          sig { params(lock_sign_date: T::Boolean).void }
          attr_writer :lock_sign_date

          # Checkbox fields only. At least 2 checkbox fields in an array of fields must be
          # assigned to the same recipient and grouped with selection requirements.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Array of dropdown options (for dropdown/select fields only)
          sig do
            returns(
              T.nilable(
                T::Array[
                  T.any(
                    String,
                    SignwellSDK::V1::DocumentCreateParams::Field::Option::DetailedOption
                  )
                ]
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                T::Array[
                  T.any(
                    String,
                    SignwellSDK::V1::DocumentCreateParams::Field::Option::DetailedOption::OrHash
                  )
                ]
            ).void
          end
          attr_writer :options

          # Whether the field must be completed by the recipient. Defaults to `true` except
          # for checkbox type fields.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :required

          sig { params(required: T::Boolean).void }
          attr_writer :required

          # Text fields only: optional validation for field values. Valid values: numbers,
          # letters, email_address, us_phone_number, us_zip_code, us_ssn, us_age,
          # alphanumeric, us_bank_routing_number, us_bank_account.
          sig { returns(T.nilable(SignwellSDK::TextValidation::OrSymbol)) }
          attr_reader :validation

          sig { params(validation: SignwellSDK::TextValidation::OrSymbol).void }
          attr_writer :validation

          # Varies according to the field type. Text fields accept strings or numbers. Date
          # fields accept Iso8601 date strings. CheckBoxes accept booleans. Signature and
          # Initials fields can't be signed through API requests. Autofill text fields
          # accept strings or numbers.
          sig do
            returns(
              T.nilable(
                SignwellSDK::V1::DocumentCreateParams::Field::Value::Variants
              )
            )
          end
          attr_reader :value

          sig do
            params(
              value:
                SignwellSDK::V1::DocumentCreateParams::Field::Value::Variants
            ).void
          end
          attr_writer :value

          # Width of the field (in pixels). For text fields, width will auto-grow unless
          # `fixed_width` is true.
          sig { returns(T.nilable(Float)) }
          attr_reader :width

          sig { params(width: Float).void }
          attr_writer :width

          sig do
            params(
              page: Integer,
              recipient_id: String,
              type: SignwellSDK::FieldType::OrSymbol,
              x: Float,
              y_: Float,
              allow_other: T::Boolean,
              api_id: String,
              date_format: SignwellSDK::DateFormat::OrSymbol,
              default_option: String,
              fixed_width: T::Boolean,
              height: Float,
              label: String,
              lock_sign_date: T::Boolean,
              name: String,
              options:
                T::Array[
                  T.any(
                    String,
                    SignwellSDK::V1::DocumentCreateParams::Field::Option::DetailedOption::OrHash
                  )
                ],
              required: T::Boolean,
              validation: SignwellSDK::TextValidation::OrSymbol,
              value:
                SignwellSDK::V1::DocumentCreateParams::Field::Value::Variants,
              width: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # The page number within the file. If the page does not exist within the file then
            # the field won't be created.
            page:,
            # Unique identifier of the recipient assigned to the field. Recipients assigned to
            # fields will be the only ones that will see and be able to complete those fields.
            recipient_id:,
            # Field type of the field. Valid field types: initials, signatures, checkbox,
            # date, and text. To autofill fields with contact data, use an autofill field
            # type. To group checkbox fields, enter an api_id for each checkbox and add the
            # checkbox_groups parameter.
            type:,
            # Horizontal value in the coordinates of the field (in pixels). Coordinates are
            # specific to the page where fields are located.
            x:,
            # Vertical value in the coordinates of the field (in pixels). Coordinates are
            # specific to the page where fields are located.
            y_:,
            # Whether to allow "Other" option with text input (for dropdown/select fields
            # only)
            allow_other: nil,
            # Unique identifier of the field. Useful when needing to reference specific field
            # values or update a document and its fields.
            api_id: nil,
            # Date fields only: date format to use for the field. Valid values: MM/DD/YYYY,
            # DD/MM/YYYY, YYYY/MM/DD, Month DD, YYYY, and MM/DD/YYYY hh:mm:ss a. Defaults to
            # MM/DD/YYYY.
            date_format: nil,
            # Default selected option (for dropdown/select fields only)
            default_option: nil,
            # Text fields only: whether the field width will stay fixed and text will display
            # in multiple lines, rather than one long line. If set to `false` the field width
            # will automatically grow horizontally to fit text on one line. Defaults to
            # `false`.
            fixed_width: nil,
            # Height of the field (in pixels). Maximum height varies by field type:
            # Signature/Initials (200px), others (74px). When using text tags if the height is
            # greater than the maximum height, the height will be set to the maximum height.
            height: nil,
            # Text and Date fields only: label that is displayed when the field is empty.
            label: nil,
            # Date fields only: makes fields readonly and automatically populates with the
            # date the recipient signed. Defaults to `false`.
            lock_sign_date: nil,
            # Checkbox fields only. At least 2 checkbox fields in an array of fields must be
            # assigned to the same recipient and grouped with selection requirements.
            name: nil,
            # Array of dropdown options (for dropdown/select fields only)
            options: nil,
            # Whether the field must be completed by the recipient. Defaults to `true` except
            # for checkbox type fields.
            required: nil,
            # Text fields only: optional validation for field values. Valid values: numbers,
            # letters, email_address, us_phone_number, us_zip_code, us_ssn, us_age,
            # alphanumeric, us_bank_routing_number, us_bank_account.
            validation: nil,
            # Varies according to the field type. Text fields accept strings or numbers. Date
            # fields accept Iso8601 date strings. CheckBoxes accept booleans. Signature and
            # Initials fields can't be signed through API requests. Autofill text fields
            # accept strings or numbers.
            value: nil,
            # Width of the field (in pixels). For text fields, width will auto-grow unless
            # `fixed_width` is true.
            width: nil
          )
          end

          sig do
            override.returns(
              {
                page: Integer,
                recipient_id: String,
                type: SignwellSDK::FieldType::OrSymbol,
                x: Float,
                y_: Float,
                allow_other: T::Boolean,
                api_id: String,
                date_format: SignwellSDK::DateFormat::OrSymbol,
                default_option: String,
                fixed_width: T::Boolean,
                height: Float,
                label: String,
                lock_sign_date: T::Boolean,
                name: String,
                options:
                  T::Array[
                    T.any(
                      String,
                      SignwellSDK::V1::DocumentCreateParams::Field::Option::DetailedOption
                    )
                  ],
                required: T::Boolean,
                validation: SignwellSDK::TextValidation::OrSymbol,
                value:
                  SignwellSDK::V1::DocumentCreateParams::Field::Value::Variants,
                width: Float
              }
            )
          end
          def to_hash
          end

          # A dropdown option - either a simple string or a detailed object with name and
          # optional api_id
          module Option
            extend SignwellSDK::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  String,
                  SignwellSDK::V1::DocumentCreateParams::Field::Option::DetailedOption
                )
              end

            class DetailedOption < SignwellSDK::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    SignwellSDK::V1::DocumentCreateParams::Field::Option::DetailedOption,
                    SignwellSDK::Internal::AnyHash
                  )
                end

              # Option display name
              sig { returns(String) }
              attr_accessor :name

              # Unique identifier for the option
              sig { returns(T.nilable(String)) }
              attr_reader :api_id

              sig { params(api_id: String).void }
              attr_writer :api_id

              # Whether this is the special "Other" option
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :is_other

              sig { params(is_other: T::Boolean).void }
              attr_writer :is_other

              # Detailed option object
              sig do
                params(
                  name: String,
                  api_id: String,
                  is_other: T::Boolean
                ).returns(T.attached_class)
              end
              def self.new(
                # Option display name
                name:,
                # Unique identifier for the option
                api_id: nil,
                # Whether this is the special "Other" option
                is_other: nil
              )
              end

              sig do
                override.returns(
                  { name: String, api_id: String, is_other: T::Boolean }
                )
              end
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  SignwellSDK::V1::DocumentCreateParams::Field::Option::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # Varies according to the field type. Text fields accept strings or numbers. Date
          # fields accept Iso8601 date strings. CheckBoxes accept booleans. Signature and
          # Initials fields can't be signed through API requests. Autofill text fields
          # accept strings or numbers.
          module Value
            extend SignwellSDK::Internal::Type::Union

            Variants = T.type_alias { T.any(String, T::Boolean, Float) }

            sig do
              override.returns(
                T::Array[
                  SignwellSDK::V1::DocumentCreateParams::Field::Value::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end
      end
    end
  end
end
