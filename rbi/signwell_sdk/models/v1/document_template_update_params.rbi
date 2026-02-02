# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentTemplateUpdateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::DocumentTemplateUpdateParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Document files can be uploaded by specifying a file URL or base64 string. Either
        # `file_url` or `file_base64` must be present (not both). Valid file types are:
        # .pdf, .doc, .docx, .pages, .ppt, .pptx, .key, .xls, .xlsx, .numbers, .jpg,
        # .jpeg, .png, .tiff, .tif, and .webp
        sig { returns(T::Array[SignwellSDK::V1::File]) }
        attr_accessor :files

        # Placeholders are generally job roles that must complete and/or sign the
        # document. For example, a placeholder might be “Client” or “Legal Department”.
        # When a document is created from the template, you assign a person to each
        # placeholder.
        sig do
          returns(
            T::Array[SignwellSDK::V1::DocumentTemplateUpdateParams::Placeholder]
          )
        end
        attr_accessor :placeholders

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
        sig do
          returns(
            T.nilable(
              T::Array[
                SignwellSDK::V1::DocumentTemplateUpdateParams::AttachmentRequest
              ]
            )
          )
        end
        attr_reader :attachment_requests

        sig do
          params(
            attachment_requests:
              T::Array[
                SignwellSDK::V1::DocumentTemplateUpdateParams::AttachmentRequest::OrHash
              ]
          ).void
        end
        attr_writer :attachment_requests

        # Checkbox fields that are placed on a document can be grouped with selection
        # requirements. At least 2 checkbox fields in an array of fields must be assigned
        # to the same recipient.
        sig do
          returns(T.nilable(T::Array[SignwellSDK::V1::TemplateCheckboxGroup]))
        end
        attr_reader :checkbox_groups

        sig do
          params(
            checkbox_groups:
              T::Array[SignwellSDK::V1::TemplateCheckboxGroup::OrHash]
          ).void
        end
        attr_writer :checkbox_groups

        # Copied placeholders are emailed the final document once it has been completed by
        # all recipients.
        sig do
          returns(
            T.nilable(
              T::Array[
                SignwellSDK::V1::DocumentTemplateUpdateParams::CopiedPlaceholder
              ]
            )
          )
        end
        attr_reader :copied_placeholders

        sig do
          params(
            copied_placeholders:
              T::Array[
                SignwellSDK::V1::DocumentTemplateUpdateParams::CopiedPlaceholder::OrHash
              ]
          ).void
        end
        attr_writer :copied_placeholders

        # A URL that recipients are redirected to if the document is declined.
        sig { returns(T.nilable(String)) }
        attr_reader :decline_redirect_url

        sig { params(decline_redirect_url: String).void }
        attr_writer :decline_redirect_url

        # Whether the template can still be updated before it is ready for usage. If set
        # to `false` the template is marked as `Available` and it will be ready for use.
        # Defaults to `false`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :draft

        sig { params(draft: T::Boolean).void }
        attr_writer :draft

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
              T::Array[
                T::Array[SignwellSDK::V1::DocumentTemplateUpdateParams::Field]
              ]
            )
          )
        end
        attr_reader :fields

        sig do
          params(
            fields:
              T::Array[
                T::Array[
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::OrHash
                ]
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

        # Sets the language for the template and documents created from the template for
        # all recipient side interactions including the document email and the document
        # itself. Accepted languages: English, Français, Español, Deutsch, Polski,
        # Português, Dansk, Nederlands, Italiano, Русский, Svenska, العربية, Ελληνικά,
        # Türkçe, Slovenčina. Language should be sent in ISO 639-1 format: en, fr, es, de,
        # pl, pt, da, nl, it, ru, sv, ar, el, tr, sk.
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
        sig { returns(T.nilable(T.anything)) }
        attr_reader :metadata

        sig { params(metadata: T.anything).void }
        attr_writer :metadata

        # The name of the template.
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

        # An alternative way (if you can’t use the recommended way) of placing fields in
        # specific locations of your document by using special text tags. Useful when
        # changing the content of your files changes the location of fields. See API
        # documentation for “Text Tags” for details. Defaults to false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :text_tags

        sig { params(text_tags: T::Boolean).void }
        attr_writer :text_tags

        sig do
          params(
            files: T::Array[SignwellSDK::V1::File::OrHash],
            placeholders:
              T::Array[
                SignwellSDK::V1::DocumentTemplateUpdateParams::Placeholder::OrHash
              ],
            allow_decline: T::Boolean,
            allow_reassign: T::Boolean,
            api_application_id: String,
            apply_signing_order: T::Boolean,
            attachment_requests:
              T::Array[
                SignwellSDK::V1::DocumentTemplateUpdateParams::AttachmentRequest::OrHash
              ],
            checkbox_groups:
              T::Array[SignwellSDK::V1::TemplateCheckboxGroup::OrHash],
            copied_placeholders:
              T::Array[
                SignwellSDK::V1::DocumentTemplateUpdateParams::CopiedPlaceholder::OrHash
              ],
            decline_redirect_url: String,
            draft: T::Boolean,
            expires_in: Integer,
            fields:
              T::Array[
                T::Array[
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::OrHash
                ]
              ],
            labels: T::Array[SignwellSDK::V1::Label::OrHash],
            language: String,
            message: String,
            metadata: T.anything,
            name: String,
            redirect_url: String,
            reminders: T::Boolean,
            subject: String,
            text_tags: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Document files can be uploaded by specifying a file URL or base64 string. Either
          # `file_url` or `file_base64` must be present (not both). Valid file types are:
          # .pdf, .doc, .docx, .pages, .ppt, .pptx, .key, .xls, .xlsx, .numbers, .jpg,
          # .jpeg, .png, .tiff, .tif, and .webp
          files:,
          # Placeholders are generally job roles that must complete and/or sign the
          # document. For example, a placeholder might be “Client” or “Legal Department”.
          # When a document is created from the template, you assign a person to each
          # placeholder.
          placeholders:,
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
          # Copied placeholders are emailed the final document once it has been completed by
          # all recipients.
          copied_placeholders: nil,
          # A URL that recipients are redirected to if the document is declined.
          decline_redirect_url: nil,
          # Whether the template can still be updated before it is ready for usage. If set
          # to `false` the template is marked as `Available` and it will be ready for use.
          # Defaults to `false`.
          draft: nil,
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
          # Sets the language for the template and documents created from the template for
          # all recipient side interactions including the document email and the document
          # itself. Accepted languages: English, Français, Español, Deutsch, Polski,
          # Português, Dansk, Nederlands, Italiano, Русский, Svenska, العربية, Ελληνικά,
          # Türkçe, Slovenčina. Language should be sent in ISO 639-1 format: en, fr, es, de,
          # pl, pt, da, nl, it, ru, sv, ar, el, tr, sk.
          language: nil,
          # Email message for the signature request that recipients will see. Defaults to
          # the default system message or a template message (if the document is created
          # from a template).
          message: nil,
          # Optional key-value data that can be associated with the document. If set, will
          # be available every time the document data is returned.
          metadata: nil,
          # The name of the template.
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
          # An alternative way (if you can’t use the recommended way) of placing fields in
          # specific locations of your document by using special text tags. Useful when
          # changing the content of your files changes the location of fields. See API
          # documentation for “Text Tags” for details. Defaults to false.
          text_tags: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              files: T::Array[SignwellSDK::V1::File],
              placeholders:
                T::Array[
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Placeholder
                ],
              allow_decline: T::Boolean,
              allow_reassign: T::Boolean,
              api_application_id: String,
              apply_signing_order: T::Boolean,
              attachment_requests:
                T::Array[
                  SignwellSDK::V1::DocumentTemplateUpdateParams::AttachmentRequest
                ],
              checkbox_groups: T::Array[SignwellSDK::V1::TemplateCheckboxGroup],
              copied_placeholders:
                T::Array[
                  SignwellSDK::V1::DocumentTemplateUpdateParams::CopiedPlaceholder
                ],
              decline_redirect_url: String,
              draft: T::Boolean,
              expires_in: Integer,
              fields:
                T::Array[
                  T::Array[SignwellSDK::V1::DocumentTemplateUpdateParams::Field]
                ],
              labels: T::Array[SignwellSDK::V1::Label],
              language: String,
              message: String,
              metadata: T.anything,
              name: String,
              redirect_url: String,
              reminders: T::Boolean,
              subject: String,
              text_tags: T::Boolean,
              request_options: SignwellSDK::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Placeholder < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::DocumentTemplateUpdateParams::Placeholder,
                SignwellSDK::Internal::AnyHash
              )
            end

          # A unique identifier that you will give to each placeholder. We recommend
          # numbering sequentially from 1 to X. IDs are required for associating recipients
          # to fields and more.
          sig { returns(String) }
          attr_accessor :id

          # Name of the placeholder.
          sig { returns(String) }
          attr_accessor :name

          # In some cases, it may be necessary to pre-fill the name and email for a
          # placeholder because it will always be the same person for all documents created
          # from this template. This sets the email.
          sig { returns(T.nilable(String)) }
          attr_reader :preassigned_recipient_email

          sig { params(preassigned_recipient_email: String).void }
          attr_writer :preassigned_recipient_email

          # In some cases, it may be necessary to pre-fill the name and email for a
          # placeholder because it will always be the same person for all documents created
          # from this template. This sets the name.
          sig { returns(T.nilable(String)) }
          attr_reader :preassigned_recipient_name

          sig { params(preassigned_recipient_name: String).void }
          attr_writer :preassigned_recipient_name

          sig do
            params(
              id: String,
              name: String,
              preassigned_recipient_email: String,
              preassigned_recipient_name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # A unique identifier that you will give to each placeholder. We recommend
            # numbering sequentially from 1 to X. IDs are required for associating recipients
            # to fields and more.
            id:,
            # Name of the placeholder.
            name:,
            # In some cases, it may be necessary to pre-fill the name and email for a
            # placeholder because it will always be the same person for all documents created
            # from this template. This sets the email.
            preassigned_recipient_email: nil,
            # In some cases, it may be necessary to pre-fill the name and email for a
            # placeholder because it will always be the same person for all documents created
            # from this template. This sets the name.
            preassigned_recipient_name: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                name: String,
                preassigned_recipient_email: String,
                preassigned_recipient_name: String
              }
            )
          end
          def to_hash
          end
        end

        class AttachmentRequest < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::DocumentTemplateUpdateParams::AttachmentRequest,
                SignwellSDK::Internal::AnyHash
              )
            end

          # Name of the requested attachment.
          sig { returns(String) }
          attr_accessor :name

          # Unique identifier of the recipient that will view the attachment request.
          sig { returns(String) }
          attr_accessor :placeholder_id

          # Whether the recipient will need to upload the attachment to successfully
          # complete/sign the document. Defaults to `true`.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :required

          sig { params(required: T::Boolean).void }
          attr_writer :required

          sig do
            params(
              name: String,
              placeholder_id: String,
              required: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Name of the requested attachment.
            name:,
            # Unique identifier of the recipient that will view the attachment request.
            placeholder_id:,
            # Whether the recipient will need to upload the attachment to successfully
            # complete/sign the document. Defaults to `true`.
            required: nil
          )
          end

          sig do
            override.returns(
              { name: String, placeholder_id: String, required: T::Boolean }
            )
          end
          def to_hash
          end
        end

        class CopiedPlaceholder < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::DocumentTemplateUpdateParams::CopiedPlaceholder,
                SignwellSDK::Internal::AnyHash
              )
            end

          # Name of the placeholder.
          sig { returns(String) }
          attr_accessor :name

          # In some cases, it may be necessary to pre-fill the name and email for a
          # placeholder because it will always be the same person for all documents created
          # from this template. This sets the email.
          sig { returns(T.nilable(String)) }
          attr_reader :preassigned_recipient_email

          sig { params(preassigned_recipient_email: String).void }
          attr_writer :preassigned_recipient_email

          # In some cases, it may be necessary to pre-fill the name and email for a
          # placeholder because it will always be the same person for all documents created
          # from this template. This sets the name.
          sig { returns(T.nilable(String)) }
          attr_reader :preassigned_recipient_name

          sig { params(preassigned_recipient_name: String).void }
          attr_writer :preassigned_recipient_name

          sig do
            params(
              name: String,
              preassigned_recipient_email: String,
              preassigned_recipient_name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Name of the placeholder.
            name:,
            # In some cases, it may be necessary to pre-fill the name and email for a
            # placeholder because it will always be the same person for all documents created
            # from this template. This sets the email.
            preassigned_recipient_email: nil,
            # In some cases, it may be necessary to pre-fill the name and email for a
            # placeholder because it will always be the same person for all documents created
            # from this template. This sets the name.
            preassigned_recipient_name: nil
          )
          end

          sig do
            override.returns(
              {
                name: String,
                preassigned_recipient_email: String,
                preassigned_recipient_name: String
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
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field,
                SignwellSDK::Internal::AnyHash
              )
            end

          # The page number within the file. If the page does not exist within the file then
          # the field won't be created.
          sig { returns(Integer) }
          attr_accessor :page

          # Unique identifier of the placeholder assigned to the field.
          sig { returns(String) }
          attr_accessor :placeholder_id

          # Field type of the field. Valid field types: initials, signatures, checkbox,
          # date, and text. To autofill fields with contact data, use an autofill field
          # type. To group checkbox fields, enter an api_id for each checkbox and add the
          # checkbox_groups parameter.
          sig do
            returns(
              SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::OrSymbol
            )
          end
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
          sig do
            returns(
              T.nilable(
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::OrSymbol
              )
            )
          end
          attr_reader :date_format

          sig do
            params(
              date_format:
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::OrSymbol
            ).void
          end
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
                    SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Option::UnionMember1
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
                    SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Option::UnionMember1::OrHash
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
          sig do
            returns(
              T.nilable(
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::OrSymbol
              )
            )
          end
          attr_reader :validation

          sig do
            params(
              validation:
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::OrSymbol
            ).void
          end
          attr_writer :validation

          # Varies according to the field type. Text fields accept strings or numbers. Date
          # fields accept Iso8601 date strings. CheckBoxes accept booleans. Signature and
          # Initials fields can't be signed through API requests. Autofill text fields
          # accept strings or numbers.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :value

          sig { params(value: T.anything).void }
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
              placeholder_id: String,
              type:
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::OrSymbol,
              x: Float,
              y_: Float,
              allow_other: T::Boolean,
              api_id: String,
              date_format:
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::OrSymbol,
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
                    SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Option::UnionMember1::OrHash
                  )
                ],
              required: T::Boolean,
              validation:
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::OrSymbol,
              value: T.anything,
              width: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # The page number within the file. If the page does not exist within the file then
            # the field won't be created.
            page:,
            # Unique identifier of the placeholder assigned to the field.
            placeholder_id:,
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
                placeholder_id: String,
                type:
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::OrSymbol,
                x: Float,
                y_: Float,
                allow_other: T::Boolean,
                api_id: String,
                date_format:
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::OrSymbol,
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
                      SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Option::UnionMember1
                    )
                  ],
                required: T::Boolean,
                validation:
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::OrSymbol,
                value: T.anything,
                width: Float
              }
            )
          end
          def to_hash
          end

          # Field type of the field. Valid field types: initials, signatures, checkbox,
          # date, and text. To autofill fields with contact data, use an autofill field
          # type. To group checkbox fields, enter an api_id for each checkbox and add the
          # checkbox_groups parameter.
          module Type
            extend SignwellSDK::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INITIALS =
              T.let(
                :initials,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            SIGNATURE =
              T.let(
                :signature,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            CHECKBOX =
              T.let(
                :checkbox,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            DATE =
              T.let(
                :date,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            SELECT =
              T.let(
                :select,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            TEXT =
              T.let(
                :text,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            DROPDOWN =
              T.let(
                :dropdown,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            AUTOFILL_COMPANY =
              T.let(
                :autofill_company,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            AUTOFILL_EMAIL =
              T.let(
                :autofill_email,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            AUTOFILL_FIRST_NAME =
              T.let(
                :autofill_first_name,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            AUTOFILL_LAST_NAME =
              T.let(
                :autofill_last_name,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            AUTOFILL_NAME =
              T.let(
                :autofill_name,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            AUTOFILL_PHONE =
              T.let(
                :autofill_phone,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            AUTOFILL_TITLE =
              T.let(
                :autofill_title,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )
            AUTOFILL_DATE_SIGNED =
              T.let(
                :autofill_date_signed,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Date fields only: date format to use for the field. Valid values: MM/DD/YYYY,
          # DD/MM/YYYY, YYYY/MM/DD, Month DD, YYYY, and MM/DD/YYYY hh:mm:ss a. Defaults to
          # MM/DD/YYYY.
          module DateFormat
            extend SignwellSDK::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MM_DD_YYYY =
              T.let(
                :"MM/DD/YYYY",
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::TaggedSymbol
              )
            DD_MM_YYYY =
              T.let(
                :"DD/MM/YYYY",
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::TaggedSymbol
              )
            YYYY_MM_DD =
              T.let(
                :"YYYY/MM/DD",
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::TaggedSymbol
              )
            MONTH_DD_YYYY =
              T.let(
                :"Month DD, YYYY",
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::TaggedSymbol
              )
            MM_DD_YYYY_HH_MM_SS_A =
              T.let(
                :"MM/DD/YYYY hh:mm:ss a",
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::DateFormat::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Simple string option
          module Option
            extend SignwellSDK::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  String,
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Option::UnionMember1
                )
              end

            class UnionMember1 < SignwellSDK::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Option::UnionMember1,
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
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Option::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # Text fields only: optional validation for field values. Valid values: numbers,
          # letters, email_address, us_phone_number, us_zip_code, us_ssn, us_age,
          # alphanumeric, us_bank_routing_number, us_bank_account.
          module Validation
            extend SignwellSDK::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NO_TEXT_VALIDATION =
              T.let(
                :no_text_validation,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            NUMBERS =
              T.let(
                :numbers,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            LETTERS =
              T.let(
                :letters,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            EMAIL_ADDRESS =
              T.let(
                :email_address,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            US_PHONE_NUMBER =
              T.let(
                :us_phone_number,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            US_ZIP_CODE =
              T.let(
                :us_zip_code,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            US_SSN =
              T.let(
                :us_ssn,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            US_AGE =
              T.let(
                :us_age,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            ALPHANUMERIC =
              T.let(
                :alphanumeric,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            US_BANK_ROUTING_NUMBER =
              T.let(
                :us_bank_routing_number,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )
            US_BANK_ACCOUNT_NUMBER =
              T.let(
                :us_bank_account_number,
                SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SignwellSDK::V1::DocumentTemplateUpdateParams::Field::Validation::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
