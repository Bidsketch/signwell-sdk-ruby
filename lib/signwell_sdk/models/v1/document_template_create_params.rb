# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::DocumentTemplates#create
      class DocumentTemplateCreateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute files
        #   Document files can be uploaded by specifying a file URL or base64 string. Either
        #   `file_url` or `file_base64` must be present (not both). Valid file types are:
        #   .pdf, .doc, .docx, .pages, .ppt, .pptx, .key, .xls, .xlsx, .numbers, .jpg,
        #   .jpeg, .png, .tiff, .tif, .webp, .html, and .htm
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentFile>]
        required :files, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentFile] }

        # @!attribute placeholders
        #   Placeholders are generally job roles that must complete and/or sign the
        #   document. For example, a placeholder might be “Client” or “Legal Department”.
        #   When a document is created from the template, you assign a person to each
        #   placeholder.
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::Placeholder>]
        required :placeholders,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplateCreateParams::Placeholder] }

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

        # @!attribute attachment_requests
        #   Attachments that a recipient must upload to complete the signing process.
        #   Attachment requests are shown after all document fields have been completed.
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::AttachmentRequest>, nil]
        optional :attachment_requests,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplateCreateParams::AttachmentRequest] }

        # @!attribute checkbox_groups
        #   Checkbox fields that are placed on a document can be grouped with selection
        #   requirements. At least 2 checkbox fields in an array of fields must be assigned
        #   to the same recipient.
        #
        #   @return [Array<SignwellSDK::Models::V1::TemplateCheckboxGroup>, nil]
        optional :checkbox_groups,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::TemplateCheckboxGroup] }

        # @!attribute copied_placeholders
        #   Copied placeholders are emailed the final document once it has been completed by
        #   all recipients.
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::CopiedPlaceholder>, nil]
        optional :copied_placeholders,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplateCreateParams::CopiedPlaceholder] }

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

        # @!attribute fields
        #   Document fields placed on a document for collecting data or signatures from
        #   recipients. At least one field must be present in the Create Document request if
        #   `draft` is `false` (unless adding a signature page by using
        #   `with_signature_page`). Field data should be sent as a 2-dimensional JSON array.
        #   One array of fields is needed for each file in the files array. An array of
        #   fields can be empty if you have a file that does not contain any fields.
        #
        #   @return [Array<Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::Field>>, nil]
        optional :fields,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplateCreateParams::Field]] }

        # @!attribute labels
        #   Labels can be used to organize documents in a way that can make it easy to find
        #   using the document search in SignWell. A document can have multiple labels.
        #
        #   @return [Array<SignwellSDK::Models::V1::Label>, nil]
        optional :labels, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Label] }

        # @!attribute language
        #   Sets the language for the template and documents created from the template for
        #   all recipient side interactions including the document email and the document
        #   itself. Accepted languages: English, Français, Español, Deutsch, Polski,
        #   Português, Dansk, Nederlands, Italiano, Русский, Svenska, العربية, Ελληνικά,
        #   Türkçe, Slovenčina. Language should be sent in ISO 639-1 format: en, fr, es, de,
        #   pl, pt, da, nl, it, ru, sv, ar, el, tr, sk.
        #
        #   @return [String, nil]
        optional :language, String

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

        # @!attribute text_tags
        #   An alternative way (if you can’t use the recommended way) of placing fields in
        #   specific locations of your document by using special text tags. Useful when
        #   changing the content of your files changes the location of fields. See API
        #   documentation for “Text Tags” for details. Defaults to false.
        #
        #   @return [Boolean, nil]
        optional :text_tags, SignwellSDK::Internal::Type::Boolean

        # @!method initialize(files:, placeholders:, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, attachment_requests: nil, checkbox_groups: nil, copied_placeholders: nil, decline_redirect_url: nil, draft: nil, expires_in: nil, fields: nil, labels: nil, language: nil, message: nil, metadata: nil, name: nil, redirect_url: nil, reminders: nil, subject: nil, text_tags: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::DocumentTemplateCreateParams} for more details.
        #
        #   @param files [Array<SignwellSDK::Models::V1::DocumentFile>] Document files can be uploaded by specifying a file URL or base64 string. Either
        #
        #   @param placeholders [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::Placeholder>] Placeholders are generally job roles that must complete and/or sign the document
        #
        #   @param allow_decline [Boolean] Whether to allow recipients the option to decline signing a document. If multipl
        #
        #   @param allow_reassign [Boolean] In some cases a signer is not the right person to sign and may need to reassign
        #
        #   @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        #   @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        #   @param attachment_requests [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::AttachmentRequest>] Attachments that a recipient must upload to complete the signing process. Attach
        #
        #   @param checkbox_groups [Array<SignwellSDK::Models::V1::TemplateCheckboxGroup>] Checkbox fields that are placed on a document can be grouped with selection requ
        #
        #   @param copied_placeholders [Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::CopiedPlaceholder>] Copied placeholders are emailed the final document once it has been completed by
        #
        #   @param decline_redirect_url [String] A URL that recipients are redirected to if the document is declined.
        #
        #   @param draft [Boolean] Whether the template can still be updated before it is ready for usage. If set t
        #
        #   @param expires_in [Integer] Number of days before the signature request expires. Defaults to the account exp
        #
        #   @param fields [Array<Array<SignwellSDK::Models::V1::DocumentTemplateCreateParams::Field>>] Document fields placed on a document for collecting data or signatures from reci
        #
        #   @param labels [Array<SignwellSDK::Models::V1::Label>] Labels can be used to organize documents in a way that can make it easy to find
        #
        #   @param language [String] Sets the language for the template and documents created from the template for a
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
        #   @param text_tags [Boolean] An alternative way (if you can’t use the recommended way) of placing fields in s
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]

        class Placeholder < SignwellSDK::Internal::Type::BaseModel
          # @!attribute id
          #   A unique identifier that you will give to each placeholder. We recommend
          #   numbering sequentially from 1 to X. IDs are required for associating recipients
          #   to fields and more.
          #
          #   @return [String]
          required :id, String

          # @!attribute name
          #   Name of the placeholder.
          #
          #   @return [String]
          required :name, String

          # @!attribute preassigned_recipient_email
          #   In some cases, it may be necessary to pre-fill the name and email for a
          #   placeholder because it will always be the same person for all documents created
          #   from this template. This sets the email.
          #
          #   @return [String, nil]
          optional :preassigned_recipient_email, String

          # @!attribute preassigned_recipient_name
          #   In some cases, it may be necessary to pre-fill the name and email for a
          #   placeholder because it will always be the same person for all documents created
          #   from this template. This sets the name.
          #
          #   @return [String, nil]
          optional :preassigned_recipient_name, String

          # @!method initialize(id:, name:, preassigned_recipient_email: nil, preassigned_recipient_name: nil)
          #   Some parameter documentations has been truncated, see
          #   {SignwellSDK::Models::V1::DocumentTemplateCreateParams::Placeholder} for more
          #   details.
          #
          #   @param id [String] A unique identifier that you will give to each placeholder. We recommend numberi
          #
          #   @param name [String] Name of the placeholder.
          #
          #   @param preassigned_recipient_email [String] In some cases, it may be necessary to pre-fill the name and email for a placehol
          #
          #   @param preassigned_recipient_name [String] In some cases, it may be necessary to pre-fill the name and email for a placehol
        end

        class AttachmentRequest < SignwellSDK::Internal::Type::BaseModel
          # @!attribute name
          #   Name of the requested attachment.
          #
          #   @return [String]
          required :name, String

          # @!attribute placeholder_id
          #   Unique identifier of the recipient that will view the attachment request.
          #
          #   @return [String]
          required :placeholder_id, String

          # @!attribute required
          #   Whether the recipient will need to upload the attachment to successfully
          #   complete/sign the document. Defaults to `true`.
          #
          #   @return [Boolean, nil]
          optional :required, SignwellSDK::Internal::Type::Boolean

          # @!method initialize(name:, placeholder_id:, required: nil)
          #   Some parameter documentations has been truncated, see
          #   {SignwellSDK::Models::V1::DocumentTemplateCreateParams::AttachmentRequest} for
          #   more details.
          #
          #   @param name [String] Name of the requested attachment.
          #
          #   @param placeholder_id [String] Unique identifier of the recipient that will view the attachment request.
          #
          #   @param required [Boolean] Whether the recipient will need to upload the attachment to successfully complet
        end

        class CopiedPlaceholder < SignwellSDK::Internal::Type::BaseModel
          # @!attribute name
          #   Name of the placeholder.
          #
          #   @return [String]
          required :name, String

          # @!attribute preassigned_recipient_email
          #   In some cases, it may be necessary to pre-fill the name and email for a
          #   placeholder because it will always be the same person for all documents created
          #   from this template. This sets the email.
          #
          #   @return [String, nil]
          optional :preassigned_recipient_email, String

          # @!attribute preassigned_recipient_name
          #   In some cases, it may be necessary to pre-fill the name and email for a
          #   placeholder because it will always be the same person for all documents created
          #   from this template. This sets the name.
          #
          #   @return [String, nil]
          optional :preassigned_recipient_name, String

          # @!method initialize(name:, preassigned_recipient_email: nil, preassigned_recipient_name: nil)
          #   Some parameter documentations has been truncated, see
          #   {SignwellSDK::Models::V1::DocumentTemplateCreateParams::CopiedPlaceholder} for
          #   more details.
          #
          #   @param name [String] Name of the placeholder.
          #
          #   @param preassigned_recipient_email [String] In some cases, it may be necessary to pre-fill the name and email for a placehol
          #
          #   @param preassigned_recipient_name [String] In some cases, it may be necessary to pre-fill the name and email for a placehol
        end

        class Field < SignwellSDK::Internal::Type::BaseModel
          # @!attribute page
          #   The page number within the file. If the page does not exist within the file then
          #   the field won't be created.
          #
          #   @return [Integer]
          required :page, Integer

          # @!attribute placeholder_id
          #   Unique identifier of the placeholder assigned to the field.
          #
          #   @return [String]
          required :placeholder_id, String

          # @!attribute type
          #   Field type of the field. Valid field types: initials, signatures, checkbox,
          #   date, and text. To autofill fields with contact data, use an autofill field
          #   type. To group checkbox fields, enter an api_id for each checkbox and add the
          #   checkbox_groups parameter.
          #
          #   @return [Symbol, SignwellSDK::Models::FieldType]
          required :type, enum: -> { SignwellSDK::FieldType }

          # @!attribute x
          #   Horizontal value in the coordinates of the field (in pixels). Coordinates are
          #   specific to the page where fields are located.
          #
          #   @return [Float]
          required :x, Float

          # @!attribute y_
          #   Vertical value in the coordinates of the field (in pixels). Coordinates are
          #   specific to the page where fields are located.
          #
          #   @return [Float]
          required :y_, Float, api_name: :y

          # @!attribute allow_other
          #   Whether to allow "Other" option with text input (for dropdown/select fields
          #   only)
          #
          #   @return [Boolean, nil]
          optional :allow_other, SignwellSDK::Internal::Type::Boolean

          # @!attribute api_id
          #   Unique identifier of the field. Useful when needing to reference specific field
          #   values or update a document and its fields.
          #
          #   @return [String, nil]
          optional :api_id, String

          # @!attribute date_format
          #   Date fields only: date format to use for the field. Valid values: MM/DD/YYYY,
          #   DD/MM/YYYY, YYYY/MM/DD, Month DD, YYYY, and MM/DD/YYYY hh:mm:ss a. Defaults to
          #   MM/DD/YYYY.
          #
          #   @return [Symbol, SignwellSDK::Models::DateFormat, nil]
          optional :date_format, enum: -> { SignwellSDK::DateFormat }

          # @!attribute default_option
          #   Default selected option (for dropdown/select fields only)
          #
          #   @return [String, nil]
          optional :default_option, String

          # @!attribute fixed_width
          #   Text fields only: whether the field width will stay fixed and text will display
          #   in multiple lines, rather than one long line. If set to `false` the field width
          #   will automatically grow horizontally to fit text on one line. Defaults to
          #   `false`.
          #
          #   @return [Boolean, nil]
          optional :fixed_width, SignwellSDK::Internal::Type::Boolean

          # @!attribute height
          #   Height of the field (in pixels). Maximum height varies by field type:
          #   Signature/Initials (200px), others (74px). When using text tags if the height is
          #   greater than the maximum height, the height will be set to the maximum height.
          #
          #   @return [Float, nil]
          optional :height, Float

          # @!attribute label
          #   Text and Date fields only: label that is displayed when the field is empty.
          #
          #   @return [String, nil]
          optional :label, String

          # @!attribute lock_sign_date
          #   Date fields only: makes fields readonly and automatically populates with the
          #   date the recipient signed. Defaults to `false`.
          #
          #   @return [Boolean, nil]
          optional :lock_sign_date, SignwellSDK::Internal::Type::Boolean

          # @!attribute name
          #   Checkbox fields only. At least 2 checkbox fields in an array of fields must be
          #   assigned to the same recipient and grouped with selection requirements.
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute options
          #   Array of dropdown options (for dropdown/select fields only)
          #
          #   @return [Array<String, SignwellSDK::Models::V1::DocumentTemplateCreateParams::Field::Option::DetailedOption>, nil]
          optional :options,
                   -> { SignwellSDK::Internal::Type::ArrayOf[union: SignwellSDK::V1::DocumentTemplateCreateParams::Field::Option] }

          # @!attribute required
          #   Whether the field must be completed by the recipient. Defaults to `true` except
          #   for checkbox type fields.
          #
          #   @return [Boolean, nil]
          optional :required, SignwellSDK::Internal::Type::Boolean

          # @!attribute validation
          #   Text fields only: optional validation for field values. Valid values: numbers,
          #   letters, email_address, us_phone_number, us_zip_code, us_ssn, us_age,
          #   alphanumeric, us_bank_routing_number, us_bank_account.
          #
          #   @return [Symbol, SignwellSDK::Models::TextValidation, nil]
          optional :validation, enum: -> { SignwellSDK::TextValidation }

          # @!attribute value
          #   Varies according to the field type. Text fields accept strings or numbers. Date
          #   fields accept Iso8601 date strings. CheckBoxes accept booleans. Signature and
          #   Initials fields can't be signed through API requests. Autofill text fields
          #   accept strings or numbers.
          #
          #   @return [String, Boolean, Float, nil]
          optional :value, union: -> { SignwellSDK::V1::DocumentTemplateCreateParams::Field::Value }

          # @!attribute width
          #   Width of the field (in pixels). For text fields, width will auto-grow unless
          #   `fixed_width` is true.
          #
          #   @return [Float, nil]
          optional :width, Float

          # @!method initialize(page:, placeholder_id:, type:, x:, y_:, allow_other: nil, api_id: nil, date_format: nil, default_option: nil, fixed_width: nil, height: nil, label: nil, lock_sign_date: nil, name: nil, options: nil, required: nil, validation: nil, value: nil, width: nil)
          #   Some parameter documentations has been truncated, see
          #   {SignwellSDK::Models::V1::DocumentTemplateCreateParams::Field} for more details.
          #
          #   @param page [Integer] The page number within the file. If the page does not exist within the file then
          #
          #   @param placeholder_id [String] Unique identifier of the placeholder assigned to the field.
          #
          #   @param type [Symbol, SignwellSDK::Models::FieldType] Field type of the field. Valid field types: initials, signatures, checkbox, date
          #
          #   @param x [Float] Horizontal value in the coordinates of the field (in pixels). Coordinates are sp
          #
          #   @param y_ [Float] Vertical value in the coordinates of the field (in pixels). Coordinates are spec
          #
          #   @param allow_other [Boolean] Whether to allow "Other" option with text input (for dropdown/select fields only
          #
          #   @param api_id [String] Unique identifier of the field. Useful when needing to reference specific field
          #
          #   @param date_format [Symbol, SignwellSDK::Models::DateFormat] Date fields only: date format to use for the field. Valid values: MM/DD/YYYY, DD
          #
          #   @param default_option [String] Default selected option (for dropdown/select fields only)
          #
          #   @param fixed_width [Boolean] Text fields only: whether the field width will stay fixed and text will display
          #
          #   @param height [Float] Height of the field (in pixels). Maximum height varies by field type: Signature/
          #
          #   @param label [String] Text and Date fields only: label that is displayed when the field is empty.
          #
          #   @param lock_sign_date [Boolean] Date fields only: makes fields readonly and automatically populates with the dat
          #
          #   @param name [String] Checkbox fields only. At least 2 checkbox fields in an array of fields must be a
          #
          #   @param options [Array<String, SignwellSDK::Models::V1::DocumentTemplateCreateParams::Field::Option::DetailedOption>] Array of dropdown options (for dropdown/select fields only)
          #
          #   @param required [Boolean] Whether the field must be completed by the recipient. Defaults to `true` except
          #
          #   @param validation [Symbol, SignwellSDK::Models::TextValidation] Text fields only: optional validation for field values. Valid values: numbers, l
          #
          #   @param value [String, Boolean, Float] Varies according to the field type. Text fields accept strings or numbers. Date
          #
          #   @param width [Float] Width of the field (in pixels). For text fields, width will auto-grow unless `fi

          # A dropdown option - either a simple string or a detailed object with name and
          # optional api_id
          module Option
            extend SignwellSDK::Internal::Type::Union

            # Simple string option
            variant String

            # Detailed option object
            variant -> { SignwellSDK::V1::DocumentTemplateCreateParams::Field::Option::DetailedOption }

            class DetailedOption < SignwellSDK::Internal::Type::BaseModel
              # @!attribute name
              #   Option display name
              #
              #   @return [String]
              required :name, String

              # @!attribute api_id
              #   Unique identifier for the option
              #
              #   @return [String, nil]
              optional :api_id, String

              # @!attribute is_other
              #   Whether this is the special "Other" option
              #
              #   @return [Boolean, nil]
              optional :is_other, SignwellSDK::Internal::Type::Boolean

              # @!method initialize(name:, api_id: nil, is_other: nil)
              #   Detailed option object
              #
              #   @param name [String] Option display name
              #
              #   @param api_id [String] Unique identifier for the option
              #
              #   @param is_other [Boolean] Whether this is the special "Other" option
            end

            # @!method self.variants
            #   @return [Array(String, SignwellSDK::Models::V1::DocumentTemplateCreateParams::Field::Option::DetailedOption)]
          end

          # Varies according to the field type. Text fields accept strings or numbers. Date
          # fields accept Iso8601 date strings. CheckBoxes accept booleans. Signature and
          # Initials fields can't be signed through API requests. Autofill text fields
          # accept strings or numbers.
          #
          # @see SignwellSDK::Models::V1::DocumentTemplateCreateParams::Field#value
          module Value
            extend SignwellSDK::Internal::Type::Union

            variant String

            variant SignwellSDK::Internal::Type::Boolean

            variant Float

            # @!method self.variants
            #   @return [Array(String, Boolean, Float)]
          end
        end
      end
    end
  end
end
