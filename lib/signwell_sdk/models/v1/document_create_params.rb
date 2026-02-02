# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#create
      class DocumentCreateParams < SignwellSDK::Internal::Type::BaseModel
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

        # @!attribute recipients
        #   Document recipients are people that must complete and/or sign a document.
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentCreateParams::Recipient>]
        required :recipients,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentCreateParams::Recipient] }

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
        #   @return [Array<SignwellSDK::Models::V1::AttachmentRequest>, nil]
        optional :attachment_requests,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::AttachmentRequest] }

        # @!attribute checkbox_groups
        #   Checkbox fields that are placed on a document can be grouped with selection
        #   requirements. At least 2 checkbox fields in an array of fields must be assigned
        #   to the same recipient.
        #
        #   @return [Array<SignwellSDK::Models::V1::CheckboxGroup>, nil]
        optional :checkbox_groups, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::CheckboxGroup] }

        # @!attribute copied_contacts
        #   Copied contacts are emailed the final document once it has been completed by all
        #   recipients.
        #
        #   @return [Array<SignwellSDK::Models::V1::CopiedContact>, nil]
        optional :copied_contacts, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::CopiedContact] }

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

        # @!attribute decline_redirect_url
        #   A URL that recipients are redirected to if the document is declined.
        #
        #   @return [String, nil]
        optional :decline_redirect_url, String

        # @!attribute draft
        #   Whether the document can still be updated before sending a signature request. If
        #   set to `false` the document is sent for signing as part of this request.
        #   Defaults to `false`.
        #
        #   @return [Boolean, nil]
        optional :draft, SignwellSDK::Internal::Type::Boolean

        # @!attribute embedded_signing
        #   When set to `true` it enables embedded signing in your website/web application.
        #   Embedded functionality works with an iFrame and email authentication is
        #   disabled. :embedded_signinig defaults to `false`.
        #
        #   @return [Boolean, nil]
        optional :embedded_signing, SignwellSDK::Internal::Type::Boolean

        # @!attribute embedded_signing_notifications
        #   On embedding signing, document owners (and CC'd contacts) do not get a
        #   notification email when documents have been completed. Setting this param to
        #   `true` will send out those final completed notifications. Default is `false`
        #
        #   @return [Boolean, nil]
        optional :embedded_signing_notifications, SignwellSDK::Internal::Type::Boolean

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
        #   @return [Array<Array<SignwellSDK::Models::V1::DocumentCreateParams::Field>>, nil]
        optional :fields,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentCreateParams::Field]] }

        # @!attribute labels
        #   Labels can be used to organize documents in a way that can make it easy to find
        #   using the document search in SignWell. A document can have multiple labels.
        #
        #   @return [Array<SignwellSDK::Models::V1::Label>, nil]
        optional :labels, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Label] }

        # @!attribute language
        #   Sets the language for all recipients on the document and updates all recipient
        #   side interactions including the document email and the document itself. Accepted
        #   languages: English, Français, Español, Deutsch, Polski, Português, Dansk,
        #   Nederlands, Italiano, Русский, Svenska, العربية, Ελληνικά, Türkçe, Slovenčina.
        #   Defaults to English. Language should be sent in ISO 639-1 format: en, fr, es,
        #   de, pl, pt, da, nl, it, ru, sv, ar, el, tr, sk.
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
        #   The name of the document.
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

        # @!attribute test_mode
        #   Set to `true` to enable Test Mode. Documents created with Test Mode do not count
        #   towards API billing and are not legally binding. Defaults to `false`
        #
        #   @return [Boolean, nil]
        optional :test_mode, SignwellSDK::Internal::Type::Boolean

        # @!attribute text_tags
        #   An alternative way (if you can’t use the recommended way) of placing fields in
        #   specific locations of your document by using special text tags. Useful when
        #   changing the content of your files changes the location of fields. See API
        #   documentation for “Text Tags” for details. Defaults to false.
        #
        #   @return [Boolean, nil]
        optional :text_tags, SignwellSDK::Internal::Type::Boolean

        # @!attribute with_signature_page
        #   When set to `true` the document will have a signature page added to the end, and
        #   all signers will be required to add their signature on that page.
        #
        #   @return [Boolean, nil]
        optional :with_signature_page, SignwellSDK::Internal::Type::Boolean

        # @!method initialize(files:, recipients:, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, attachment_requests: nil, checkbox_groups: nil, copied_contacts: nil, custom_requester_email: nil, custom_requester_name: nil, decline_redirect_url: nil, draft: nil, embedded_signing: nil, embedded_signing_notifications: nil, expires_in: nil, fields: nil, labels: nil, language: nil, message: nil, metadata: nil, name: nil, redirect_url: nil, reminders: nil, subject: nil, test_mode: nil, text_tags: nil, with_signature_page: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::DocumentCreateParams} for more details.
        #
        #   @param files [Array<SignwellSDK::Models::V1::DocumentFile>] Document files can be uploaded by specifying a file URL or base64 string. Either
        #
        #   @param recipients [Array<SignwellSDK::Models::V1::DocumentCreateParams::Recipient>] Document recipients are people that must complete and/or sign a document.
        #
        #   @param allow_decline [Boolean] Whether to allow recipients the option to decline signing a document. If multipl
        #
        #   @param allow_reassign [Boolean] In some cases a signer is not the right person to sign and may need to reassign
        #
        #   @param api_application_id [String] Unique identifier for API Application settings to use. API Applications are opti
        #
        #   @param apply_signing_order [Boolean] When set to `true` recipients will sign one at a time in the order of the `recip
        #
        #   @param attachment_requests [Array<SignwellSDK::Models::V1::AttachmentRequest>] Attachments that a recipient must upload to complete the signing process. Attach
        #
        #   @param checkbox_groups [Array<SignwellSDK::Models::V1::CheckboxGroup>] Checkbox fields that are placed on a document can be grouped with selection requ
        #
        #   @param copied_contacts [Array<SignwellSDK::Models::V1::CopiedContact>] Copied contacts are emailed the final document once it has been completed by all
        #
        #   @param custom_requester_email [String] Sets the custom requester email for the document. When set, this is the email us
        #
        #   @param custom_requester_name [String] Sets the custom requester name for the document. When set, this is the name used
        #
        #   @param decline_redirect_url [String] A URL that recipients are redirected to if the document is declined.
        #
        #   @param draft [Boolean] Whether the document can still be updated before sending a signature request. If
        #
        #   @param embedded_signing [Boolean] When set to `true` it enables embedded signing in your website/web application.
        #
        #   @param embedded_signing_notifications [Boolean] On embedding signing, document owners (and CC'd contacts) do not get a notificat
        #
        #   @param expires_in [Integer] Number of days before the signature request expires. Defaults to the account exp
        #
        #   @param fields [Array<Array<SignwellSDK::Models::V1::DocumentCreateParams::Field>>] Document fields placed on a document for collecting data or signatures from reci
        #
        #   @param labels [Array<SignwellSDK::Models::V1::Label>] Labels can be used to organize documents in a way that can make it easy to find
        #
        #   @param language [String] Sets the language for all recipients on the document and updates all recipient s
        #
        #   @param message [String] Email message for the signature request that recipients will see. Defaults to th
        #
        #   @param metadata [Hash{Symbol=>String}] Optional key-value data that can be associated with the document. If set, will b
        #
        #   @param name [String] The name of the document.
        #
        #   @param redirect_url [String] A URL that recipients are redirected to after successfully signing a document.
        #
        #   @param reminders [Boolean] Whether to send signing reminders to recipients. Reminders are sent on day 3, da
        #
        #   @param subject [String] Email subject for the signature request that recipients will see. Defaults to th
        #
        #   @param test_mode [Boolean] Set to `true` to enable Test Mode. Documents created with Test Mode do not count
        #
        #   @param text_tags [Boolean] An alternative way (if you can’t use the recommended way) of placing fields in s
        #
        #   @param with_signature_page [Boolean] When set to `true` the document will have a signature page added to the end, and
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]

        class Recipient < SignwellSDK::Internal::Type::BaseModel
          # @!attribute id
          #   A unique identifier that you will give to each recipient. We recommend numbering
          #   sequentially from 1 to X. IDs are required for associating recipients to fields
          #   and more.
          #
          #   @return [String]
          required :id, String

          # @!attribute email
          #   Email address for the recipient.
          #
          #   @return [String]
          required :email, String

          # @!attribute message
          #   Email message for the signature request that the recipient will see. Overrides
          #   the general message for the document.
          #
          #   @return [String, nil]
          optional :message, String

          # @!attribute name
          #   Name of the recipient.
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute passcode
          #   If set, signers assigned with a passcode will be required to enter the passcode
          #   before they’re able to view and complete the document.
          #
          #   @return [String, nil]
          optional :passcode, String

          # @!attribute send_email
          #   Applies on when `embedded_signing` is `true`. By default, recipients are not
          #   notified through email to sign when doing embedded signing. Setting this to
          #   `true` will send a notification email to the recipient. Default is `false`.
          #
          #   @return [Boolean, nil]
          optional :send_email, SignwellSDK::Internal::Type::Boolean

          # @!attribute send_email_delay
          #   If `send_email` is `true` recipients will receive a new document notification
          #   immediately. In the case of embedded signing, you can delay this notification to
          #   only send if the document is not completed within a few minutes. The email
          #   notification will not go out if the document is completed before the delay time
          #   is over. Valid values are in minutes ranging from `0` to `60`. Defaults to `0`.
          #
          #   @return [Integer, nil]
          optional :send_email_delay, Integer

          # @!attribute subject
          #   Email subject for the signature request that the recipient will see. Overrides
          #   the general subject for the document.
          #
          #   @return [String, nil]
          optional :subject, String

          # @!method initialize(id:, email:, message: nil, name: nil, passcode: nil, send_email: nil, send_email_delay: nil, subject: nil)
          #   Some parameter documentations has been truncated, see
          #   {SignwellSDK::Models::V1::DocumentCreateParams::Recipient} for more details.
          #
          #   @param id [String] A unique identifier that you will give to each recipient. We recommend numbering
          #
          #   @param email [String] Email address for the recipient.
          #
          #   @param message [String] Email message for the signature request that the recipient will see. Overrides t
          #
          #   @param name [String] Name of the recipient.
          #
          #   @param passcode [String] If set, signers assigned with a passcode will be required to enter the passcode
          #
          #   @param send_email [Boolean] Applies on when `embedded_signing` is `true`. By default, recipients are not not
          #
          #   @param send_email_delay [Integer] If `send_email` is `true` recipients will receive a new document notification im
          #
          #   @param subject [String] Email subject for the signature request that the recipient will see. Overrides t
        end

        class Field < SignwellSDK::Internal::Type::BaseModel
          # @!attribute page
          #   The page number within the file. If the page does not exist within the file then
          #   the field won't be created.
          #
          #   @return [Integer]
          required :page, Integer

          # @!attribute recipient_id
          #   Unique identifier of the recipient assigned to the field. Recipients assigned to
          #   fields will be the only ones that will see and be able to complete those fields.
          #
          #   @return [String]
          required :recipient_id, String

          # @!attribute type
          #   Field type of the field. Valid field types: initials, signatures, checkbox,
          #   date, and text. To autofill fields with contact data, use an autofill field
          #   type. To group checkbox fields, enter an api_id for each checkbox and add the
          #   checkbox_groups parameter.
          #
          #   @return [Symbol, SignwellSDK::Models::V1::DocumentCreateParams::Field::Type]
          required :type, enum: -> { SignwellSDK::V1::DocumentCreateParams::Field::Type }

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
          #   @return [Symbol, SignwellSDK::Models::V1::DocumentCreateParams::Field::DateFormat, nil]
          optional :date_format, enum: -> { SignwellSDK::V1::DocumentCreateParams::Field::DateFormat }

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
          #   @return [Array<String, SignwellSDK::Models::V1::DocumentCreateParams::Field::Option::DetailedOption>, nil]
          optional :options,
                   -> { SignwellSDK::Internal::Type::ArrayOf[union: SignwellSDK::V1::DocumentCreateParams::Field::Option] }

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
          #   @return [Symbol, SignwellSDK::Models::V1::DocumentCreateParams::Field::Validation, nil]
          optional :validation, enum: -> { SignwellSDK::V1::DocumentCreateParams::Field::Validation }

          # @!attribute value
          #   Varies according to the field type. Text fields accept strings or numbers. Date
          #   fields accept Iso8601 date strings. CheckBoxes accept booleans. Signature and
          #   Initials fields can't be signed through API requests. Autofill text fields
          #   accept strings or numbers.
          #
          #   @return [String, Boolean, Float, nil]
          optional :value, union: -> { SignwellSDK::V1::DocumentCreateParams::Field::Value }

          # @!attribute width
          #   Width of the field (in pixels). For text fields, width will auto-grow unless
          #   `fixed_width` is true.
          #
          #   @return [Float, nil]
          optional :width, Float

          # @!method initialize(page:, recipient_id:, type:, x:, y_:, allow_other: nil, api_id: nil, date_format: nil, default_option: nil, fixed_width: nil, height: nil, label: nil, lock_sign_date: nil, name: nil, options: nil, required: nil, validation: nil, value: nil, width: nil)
          #   Some parameter documentations has been truncated, see
          #   {SignwellSDK::Models::V1::DocumentCreateParams::Field} for more details.
          #
          #   @param page [Integer] The page number within the file. If the page does not exist within the file then
          #
          #   @param recipient_id [String] Unique identifier of the recipient assigned to the field. Recipients assigned to
          #
          #   @param type [Symbol, SignwellSDK::Models::V1::DocumentCreateParams::Field::Type] Field type of the field. Valid field types: initials, signatures, checkbox, date
          #
          #   @param x [Float] Horizontal value in the coordinates of the field (in pixels). Coordinates are sp
          #
          #   @param y_ [Float] Vertical value in the coordinates of the field (in pixels). Coordinates are spec
          #
          #   @param allow_other [Boolean] Whether to allow "Other" option with text input (for dropdown/select fields only
          #
          #   @param api_id [String] Unique identifier of the field. Useful when needing to reference specific field
          #
          #   @param date_format [Symbol, SignwellSDK::Models::V1::DocumentCreateParams::Field::DateFormat] Date fields only: date format to use for the field. Valid values: MM/DD/YYYY, DD
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
          #   @param options [Array<String, SignwellSDK::Models::V1::DocumentCreateParams::Field::Option::DetailedOption>] Array of dropdown options (for dropdown/select fields only)
          #
          #   @param required [Boolean] Whether the field must be completed by the recipient. Defaults to `true` except
          #
          #   @param validation [Symbol, SignwellSDK::Models::V1::DocumentCreateParams::Field::Validation] Text fields only: optional validation for field values. Valid values: numbers, l
          #
          #   @param value [String, Boolean, Float] Varies according to the field type. Text fields accept strings or numbers. Date
          #
          #   @param width [Float] Width of the field (in pixels). For text fields, width will auto-grow unless `fi

          # Field type of the field. Valid field types: initials, signatures, checkbox,
          # date, and text. To autofill fields with contact data, use an autofill field
          # type. To group checkbox fields, enter an api_id for each checkbox and add the
          # checkbox_groups parameter.
          #
          # @see SignwellSDK::Models::V1::DocumentCreateParams::Field#type
          module Type
            extend SignwellSDK::Internal::Type::Enum

            INITIALS = :initials
            SIGNATURE = :signature
            CHECKBOX = :checkbox
            DATE = :date
            SELECT = :select
            TEXT = :text
            DROPDOWN = :dropdown
            AUTOFILL_COMPANY = :autofill_company
            AUTOFILL_EMAIL = :autofill_email
            AUTOFILL_FIRST_NAME = :autofill_first_name
            AUTOFILL_LAST_NAME = :autofill_last_name
            AUTOFILL_NAME = :autofill_name
            AUTOFILL_PHONE = :autofill_phone
            AUTOFILL_TITLE = :autofill_title
            AUTOFILL_DATE_SIGNED = :autofill_date_signed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Date fields only: date format to use for the field. Valid values: MM/DD/YYYY,
          # DD/MM/YYYY, YYYY/MM/DD, Month DD, YYYY, and MM/DD/YYYY hh:mm:ss a. Defaults to
          # MM/DD/YYYY.
          #
          # @see SignwellSDK::Models::V1::DocumentCreateParams::Field#date_format
          module DateFormat
            extend SignwellSDK::Internal::Type::Enum

            MM_DD_YYYY = :"MM/DD/YYYY"
            DD_MM_YYYY = :"DD/MM/YYYY"
            YYYY_MM_DD = :"YYYY/MM/DD"
            MONTH_DD_YYYY = :"Month DD, YYYY"
            MM_DD_YYYY_HH_MM_SS_A = :"MM/DD/YYYY hh:mm:ss a"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # A dropdown option - either a simple string or a detailed object with name and
          # optional api_id
          module Option
            extend SignwellSDK::Internal::Type::Union

            # Simple string option
            variant String

            # Detailed option object
            variant -> { SignwellSDK::V1::DocumentCreateParams::Field::Option::DetailedOption }

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
            #   @return [Array(String, SignwellSDK::Models::V1::DocumentCreateParams::Field::Option::DetailedOption)]
          end

          # Text fields only: optional validation for field values. Valid values: numbers,
          # letters, email_address, us_phone_number, us_zip_code, us_ssn, us_age,
          # alphanumeric, us_bank_routing_number, us_bank_account.
          #
          # @see SignwellSDK::Models::V1::DocumentCreateParams::Field#validation
          module Validation
            extend SignwellSDK::Internal::Type::Enum

            NO_TEXT_VALIDATION = :no_text_validation
            NUMBERS = :numbers
            LETTERS = :letters
            EMAIL_ADDRESS = :email_address
            US_PHONE_NUMBER = :us_phone_number
            US_ZIP_CODE = :us_zip_code
            US_SSN = :us_ssn
            US_AGE = :us_age
            ALPHANUMERIC = :alphanumeric
            US_BANK_ROUTING_NUMBER = :us_bank_routing_number
            US_BANK_ACCOUNT_NUMBER = :us_bank_account_number

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Varies according to the field type. Text fields accept strings or numbers. Date
          # fields accept Iso8601 date strings. CheckBoxes accept booleans. Signature and
          # Initials fields can't be signed through API requests. Autofill text fields
          # accept strings or numbers.
          #
          # @see SignwellSDK::Models::V1::DocumentCreateParams::Field#value
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
