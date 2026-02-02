# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#create_from_template
      class DocumentCreateFromTemplateResponse < SignwellSDK::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute test_mode
        #
        #   @return [Boolean]
        required :test_mode, SignwellSDK::Internal::Type::Boolean

        # @!attribute allow_decline
        #
        #   @return [Boolean, nil]
        optional :allow_decline, SignwellSDK::Internal::Type::Boolean, nil?: true

        # @!attribute allow_reassign
        #
        #   @return [Boolean, nil]
        optional :allow_reassign, SignwellSDK::Internal::Type::Boolean, nil?: true

        # @!attribute api_application_id
        #
        #   @return [String, nil]
        optional :api_application_id, String, nil?: true

        # @!attribute apply_signing_order
        #
        #   @return [Boolean, nil]
        optional :apply_signing_order, SignwellSDK::Internal::Type::Boolean

        # @!attribute archived
        #
        #   @return [Boolean, nil]
        optional :archived, SignwellSDK::Internal::Type::Boolean

        # @!attribute attachment_requests
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::AttachmentRequest>, nil]
        optional :attachment_requests,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::AttachmentRequest] }

        # @!attribute copied_contacts
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::CopiedContact>, nil]
        optional :copied_contacts,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::CopiedContact] }

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time

        # @!attribute custom_requester_email
        #
        #   @return [String, nil]
        optional :custom_requester_email, String, nil?: true

        # @!attribute custom_requester_name
        #
        #   @return [String, nil]
        optional :custom_requester_name, String, nil?: true

        # @!attribute decline_redirect_url
        #
        #   @return [String, nil]
        optional :decline_redirect_url, String, nil?: true

        # @!attribute embedded
        #
        #   @return [Boolean, nil]
        optional :embedded, SignwellSDK::Internal::Type::Boolean

        # @!attribute embedded_edit_url
        #
        #   @return [String, nil]
        optional :embedded_edit_url, String

        # @!attribute expires_in
        #
        #   @return [Integer, nil]
        optional :expires_in, Integer

        # @!attribute fields
        #
        #   @return [Array<Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field>>, nil]
        optional :fields,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field]] }

        # @!attribute files
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::File>, nil]
        optional :files,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::File] }

        # @!attribute labels
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Label>, nil]
        optional :labels,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Label] }

        # @!attribute language
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute metadata
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, SignwellSDK::Internal::Type::HashOf[String]

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute recipients
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Recipient>, nil]
        optional :recipients,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Recipient] }

        # @!attribute redirect_url
        #
        #   @return [String, nil]
        optional :redirect_url, String, nil?: true

        # @!attribute reminders
        #
        #   @return [Boolean, nil]
        optional :reminders, SignwellSDK::Internal::Type::Boolean

        # @!attribute requester_email_address
        #
        #   @return [String, nil]
        optional :requester_email_address, String

        # @!attribute status
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute subject
        #
        #   @return [String, nil]
        optional :subject, String

        # @!attribute template_id
        #
        #   @return [String, nil]
        optional :template_id, String

        # @!attribute template_ids
        #
        #   @return [Array<String>, nil]
        optional :template_ids, SignwellSDK::Internal::Type::ArrayOf[String]

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time

        # @!method initialize(id:, test_mode:, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, archived: nil, attachment_requests: nil, copied_contacts: nil, created_at: nil, custom_requester_email: nil, custom_requester_name: nil, decline_redirect_url: nil, embedded: nil, embedded_edit_url: nil, expires_in: nil, fields: nil, files: nil, labels: nil, language: nil, message: nil, metadata: nil, name: nil, recipients: nil, redirect_url: nil, reminders: nil, requester_email_address: nil, status: nil, subject: nil, template_id: nil, template_ids: nil, updated_at: nil)
        #   @param id [String]
        #   @param test_mode [Boolean]
        #   @param allow_decline [Boolean, nil]
        #   @param allow_reassign [Boolean, nil]
        #   @param api_application_id [String, nil]
        #   @param apply_signing_order [Boolean]
        #   @param archived [Boolean]
        #   @param attachment_requests [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::AttachmentRequest>]
        #   @param copied_contacts [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::CopiedContact>]
        #   @param created_at [Time]
        #   @param custom_requester_email [String, nil]
        #   @param custom_requester_name [String, nil]
        #   @param decline_redirect_url [String, nil]
        #   @param embedded [Boolean]
        #   @param embedded_edit_url [String]
        #   @param expires_in [Integer]
        #   @param fields [Array<Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field>>]
        #   @param files [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::File>]
        #   @param labels [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Label>]
        #   @param language [String]
        #   @param message [String]
        #   @param metadata [Hash{Symbol=>String}]
        #   @param name [String]
        #   @param recipients [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Recipient>]
        #   @param redirect_url [String, nil]
        #   @param reminders [Boolean]
        #   @param requester_email_address [String]
        #   @param status [String]
        #   @param subject [String]
        #   @param template_id [String]
        #   @param template_ids [Array<String>]
        #   @param updated_at [Time]

        class AttachmentRequest < SignwellSDK::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute recipient_id
          #
          #   @return [String]
          required :recipient_id, String

          # @!attribute required
          #
          #   @return [Boolean, nil]
          optional :required, SignwellSDK::Internal::Type::Boolean

          # @!method initialize(name:, recipient_id:, required: nil)
          #   @param name [String]
          #   @param recipient_id [String]
          #   @param required [Boolean]
        end

        class CopiedContact < SignwellSDK::Internal::Type::BaseModel
          # @!attribute email
          #
          #   @return [String]
          required :email, String

          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(email:, id: nil, name: nil)
          #   @param email [String]
          #   @param id [String]
          #   @param name [String]
        end

        class Field < SignwellSDK::Internal::Type::BaseModel
          # @!attribute page
          #
          #   @return [Integer]
          required :page, Integer

          # @!attribute x
          #
          #   @return [Float]
          required :x, Float

          # @!attribute y_
          #
          #   @return [Float]
          required :y_, Float, api_name: :y

          # @!attribute allow_other
          #   Whether "Other" option is allowed
          #
          #   @return [Boolean, nil]
          optional :allow_other, SignwellSDK::Internal::Type::Boolean

          # @!attribute api_id
          #
          #   @return [String, nil]
          optional :api_id, String

          # @!attribute date_format
          #
          #   @return [String, nil]
          optional :date_format, String

          # @!attribute default_option
          #   Default selected option
          #
          #   @return [String, nil]
          optional :default_option, String

          # @!attribute fixed_width
          #
          #   @return [Boolean, nil]
          optional :fixed_width, SignwellSDK::Internal::Type::Boolean

          # @!attribute height
          #
          #   @return [String, nil]
          optional :height, String

          # @!attribute label
          #
          #   @return [String, nil]
          optional :label, String

          # @!attribute lock_sign_date
          #
          #   @return [Boolean, nil]
          optional :lock_sign_date, SignwellSDK::Internal::Type::Boolean

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!attribute options
          #   Dropdown options (for dropdown/select fields)
          #
          #   @return [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field::Option>, nil]
          optional :options,
                   -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field::Option] }

          # @!attribute placeholder_name
          #
          #   @return [String, nil]
          optional :placeholder_name, String

          # @!attribute recipient
          #
          #   @return [SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field::Recipient, nil]
          optional :recipient, -> { SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field::Recipient }

          # @!attribute recipient_id
          #
          #   @return [String, nil]
          optional :recipient_id, String, nil?: true

          # @!attribute required
          #
          #   @return [Boolean, nil]
          optional :required, SignwellSDK::Internal::Type::Boolean

          # @!attribute signing_elements_group_id
          #
          #   @return [String, nil]
          optional :signing_elements_group_id, String

          # @!attribute type
          #
          #   @return [String, nil]
          optional :type, String

          # @!attribute validation
          #
          #   @return [String, nil]
          optional :validation, String

          # @!attribute value
          #
          #   @return [String, Boolean, Float, nil]
          optional :value,
                   union: -> { SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field::Value },
                   nil?: true

          # @!attribute width
          #
          #   @return [String, nil]
          optional :width, String

          # @!method initialize(page:, x:, y_:, allow_other: nil, api_id: nil, date_format: nil, default_option: nil, fixed_width: nil, height: nil, label: nil, lock_sign_date: nil, name: nil, options: nil, placeholder_name: nil, recipient: nil, recipient_id: nil, required: nil, signing_elements_group_id: nil, type: nil, validation: nil, value: nil, width: nil)
          #   @param page [Integer]
          #
          #   @param x [Float]
          #
          #   @param y_ [Float]
          #
          #   @param allow_other [Boolean] Whether "Other" option is allowed
          #
          #   @param api_id [String]
          #
          #   @param date_format [String]
          #
          #   @param default_option [String] Default selected option
          #
          #   @param fixed_width [Boolean]
          #
          #   @param height [String]
          #
          #   @param label [String]
          #
          #   @param lock_sign_date [Boolean]
          #
          #   @param name [String, nil]
          #
          #   @param options [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field::Option>] Dropdown options (for dropdown/select fields)
          #
          #   @param placeholder_name [String]
          #
          #   @param recipient [SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field::Recipient]
          #
          #   @param recipient_id [String, nil]
          #
          #   @param required [Boolean]
          #
          #   @param signing_elements_group_id [String]
          #
          #   @param type [String]
          #
          #   @param validation [String]
          #
          #   @param value [String, Boolean, Float, nil]
          #
          #   @param width [String]

          class Option < SignwellSDK::Internal::Type::BaseModel
            # @!attribute api_id
            #
            #   @return [String, nil]
            optional :api_id, String

            # @!attribute is_other
            #
            #   @return [Boolean, nil]
            optional :is_other, SignwellSDK::Internal::Type::Boolean

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String

            # @!method initialize(api_id: nil, is_other: nil, name: nil)
            #   @param api_id [String]
            #   @param is_other [Boolean]
            #   @param name [String]
          end

          # @see SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field#recipient
          class Recipient < SignwellSDK::Internal::Type::BaseModel
            # @!attribute email
            #
            #   @return [String]
            required :email, String

            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute role
            #
            #   @return [String, nil]
            optional :role, String

            # @!method initialize(email:, name:, role: nil)
            #   @param email [String]
            #   @param name [String]
            #   @param role [String]
          end

          # @see SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field#value
          module Value
            extend SignwellSDK::Internal::Type::Union

            variant String

            variant SignwellSDK::Internal::Type::Boolean

            variant Float

            # @!method self.variants
            #   @return [Array(String, Boolean, Float)]
          end
        end

        class File < SignwellSDK::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute pages_number
          #
          #   @return [Integer]
          required :pages_number, Integer

          # @!method initialize(name:, pages_number:)
          #   @param name [String]
          #   @param pages_number [Integer]
        end

        class Label < SignwellSDK::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(id: nil, name: nil)
          #   @param id [String]
          #   @param name [String]
        end

        class Recipient < SignwellSDK::Internal::Type::BaseModel
          # @!attribute email
          #
          #   @return [String]
          required :email, String

          # @!attribute attachment_requests
          #
          #   @return [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Recipient::AttachmentRequest>, nil]
          optional :attachment_requests,
                   -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Recipient::AttachmentRequest] }

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute passcode
          #
          #   @return [String, nil]
          optional :passcode, String, nil?: true

          # @!attribute role
          #
          #   @return [String, nil]
          optional :role, String

          # @!attribute status
          #
          #   @return [String, nil]
          optional :status, String

          # @!method initialize(email:, attachment_requests: nil, name: nil, passcode: nil, role: nil, status: nil)
          #   @param email [String]
          #   @param attachment_requests [Array<SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Recipient::AttachmentRequest>]
          #   @param name [String]
          #   @param passcode [String, nil]
          #   @param role [String]
          #   @param status [String]

          class AttachmentRequest < SignwellSDK::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute required
            #
            #   @return [Boolean]
            required :required, SignwellSDK::Internal::Type::Boolean

            # @!attribute url
            #
            #   @return [String, nil]
            optional :url, String

            # @!method initialize(name:, required:, url: nil)
            #   @param name [String]
            #   @param required [Boolean]
            #   @param url [String]
          end
        end
      end
    end
  end
end
