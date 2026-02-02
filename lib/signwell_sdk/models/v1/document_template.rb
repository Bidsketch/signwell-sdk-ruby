# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::DocumentTemplates#create
      class DocumentTemplate < SignwellSDK::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

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

        # @!attribute checkbox_groups
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentTemplate::CheckboxGroup>, nil]
        optional :checkbox_groups,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::CheckboxGroup] }

        # @!attribute copied_placeholders
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentTemplate::CopiedPlaceholder>, nil]
        optional :copied_placeholders,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder] }

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

        # @!attribute expires_in
        #
        #   @return [Integer, nil]
        optional :expires_in, Integer, nil?: true

        # @!attribute fields
        #
        #   @return [Array<Array<SignwellSDK::Models::V1::DocumentTemplate::Field>>, nil]
        optional :fields,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Field]] }

        # @!attribute files
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentTemplate::File>, nil]
        optional :files, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::File] }

        # @!attribute labels
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentTemplate::Label>, nil]
        optional :labels, -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Label] }

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
        optional :metadata, SignwellSDK::Internal::Type::HashOf[String], nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute placeholders
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentTemplate::Placeholder>, nil]
        optional :placeholders,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Placeholder] }

        # @!attribute redirect_url
        #
        #   @return [String, nil]
        optional :redirect_url, String, nil?: true

        # @!attribute reminders
        #
        #   @return [Boolean, nil]
        optional :reminders, SignwellSDK::Internal::Type::Boolean, nil?: true

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

        # @!attribute template_link
        #
        #   @return [String, nil]
        optional :template_link, String

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time

        # @!method initialize(id:, allow_decline: nil, allow_reassign: nil, api_application_id: nil, apply_signing_order: nil, archived: nil, checkbox_groups: nil, copied_placeholders: nil, created_at: nil, custom_requester_email: nil, custom_requester_name: nil, decline_redirect_url: nil, expires_in: nil, fields: nil, files: nil, labels: nil, language: nil, message: nil, metadata: nil, name: nil, placeholders: nil, redirect_url: nil, reminders: nil, requester_email_address: nil, status: nil, subject: nil, template_link: nil, updated_at: nil)
        #   @param id [String]
        #   @param allow_decline [Boolean, nil]
        #   @param allow_reassign [Boolean, nil]
        #   @param api_application_id [String, nil]
        #   @param apply_signing_order [Boolean]
        #   @param archived [Boolean]
        #   @param checkbox_groups [Array<SignwellSDK::Models::V1::DocumentTemplate::CheckboxGroup>]
        #   @param copied_placeholders [Array<SignwellSDK::Models::V1::DocumentTemplate::CopiedPlaceholder>]
        #   @param created_at [Time]
        #   @param custom_requester_email [String, nil]
        #   @param custom_requester_name [String, nil]
        #   @param decline_redirect_url [String, nil]
        #   @param expires_in [Integer, nil]
        #   @param fields [Array<Array<SignwellSDK::Models::V1::DocumentTemplate::Field>>]
        #   @param files [Array<SignwellSDK::Models::V1::DocumentTemplate::File>]
        #   @param labels [Array<SignwellSDK::Models::V1::DocumentTemplate::Label>]
        #   @param language [String]
        #   @param message [String]
        #   @param metadata [Hash{Symbol=>String}, nil]
        #   @param name [String]
        #   @param placeholders [Array<SignwellSDK::Models::V1::DocumentTemplate::Placeholder>]
        #   @param redirect_url [String, nil]
        #   @param reminders [Boolean, nil]
        #   @param requester_email_address [String]
        #   @param status [String]
        #   @param subject [String]
        #   @param template_link [String]
        #   @param updated_at [Time]

        class CheckboxGroup < SignwellSDK::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute checkbox_ids
          #
          #   @return [Array<String>]
          required :checkbox_ids, SignwellSDK::Internal::Type::ArrayOf[String]

          # @!attribute required
          #
          #   @return [Boolean]
          required :required, SignwellSDK::Internal::Type::Boolean

          # @!attribute group_name
          #
          #   @return [String, nil]
          optional :group_name, String, nil?: true

          # @!attribute min_value
          #
          #   @return [Integer, nil]
          optional :min_value, Integer

          # @!attribute recipient_id
          #
          #   @return [String, nil]
          optional :recipient_id, String, nil?: true

          # @!attribute validation
          #
          #   @return [String, nil]
          optional :validation, String, nil?: true

          # @!method initialize(id:, checkbox_ids:, required:, group_name: nil, min_value: nil, recipient_id: nil, validation: nil)
          #   @param id [String]
          #   @param checkbox_ids [Array<String>]
          #   @param required [Boolean]
          #   @param group_name [String, nil]
          #   @param min_value [Integer]
          #   @param recipient_id [String, nil]
          #   @param validation [String, nil]
        end

        class CopiedPlaceholder < SignwellSDK::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute message
          #
          #   @return [String, nil]
          optional :message, String, nil?: true

          # @!attribute placeholder_id
          #
          #   @return [String, nil]
          optional :placeholder_id, String

          # @!attribute preassigned_recipient_email
          #
          #   @return [String, nil]
          optional :preassigned_recipient_email, String

          # @!attribute preassigned_recipient_name
          #
          #   @return [String, nil]
          optional :preassigned_recipient_name, String

          # @!attribute subject
          #
          #   @return [String, nil]
          optional :subject, String, nil?: true

          # @!method initialize(name:, id: nil, message: nil, placeholder_id: nil, preassigned_recipient_email: nil, preassigned_recipient_name: nil, subject: nil)
          #   @param name [String]
          #   @param id [String]
          #   @param message [String, nil]
          #   @param placeholder_id [String]
          #   @param preassigned_recipient_email [String]
          #   @param preassigned_recipient_name [String]
          #   @param subject [String, nil]
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
          #   @return [Array<SignwellSDK::Models::V1::DocumentTemplate::Field::Option>, nil]
          optional :options,
                   -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Field::Option] }

          # @!attribute placeholder_name
          #
          #   @return [String, nil]
          optional :placeholder_name, String

          # @!attribute recipient
          #
          #   @return [SignwellSDK::Models::V1::DocumentTemplate::Field::Recipient, nil]
          optional :recipient, -> { SignwellSDK::V1::DocumentTemplate::Field::Recipient }

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
          optional :value, union: -> { SignwellSDK::V1::DocumentTemplate::Field::Value }, nil?: true

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
          #   @param options [Array<SignwellSDK::Models::V1::DocumentTemplate::Field::Option>] Dropdown options (for dropdown/select fields)
          #
          #   @param placeholder_name [String]
          #
          #   @param recipient [SignwellSDK::Models::V1::DocumentTemplate::Field::Recipient]
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

          # @see SignwellSDK::Models::V1::DocumentTemplate::Field#recipient
          class Recipient < SignwellSDK::Internal::Type::BaseModel
            # @!attribute email
            #
            #   @return [String]
            required :email, String

            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!method initialize(email:, name:)
            #   @param email [String]
            #   @param name [String]
          end

          # @see SignwellSDK::Models::V1::DocumentTemplate::Field#value
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

        class Placeholder < SignwellSDK::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute attachment_requests
          #
          #   @return [Array<SignwellSDK::Models::V1::DocumentTemplate::Placeholder::AttachmentRequest>, nil]
          optional :attachment_requests,
                   -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Placeholder::AttachmentRequest] }

          # @!attribute message
          #
          #   @return [String, nil]
          optional :message, String, nil?: true

          # @!attribute preassigned_recipient_email
          #
          #   @return [String, nil]
          optional :preassigned_recipient_email, String

          # @!attribute preassigned_recipient_name
          #
          #   @return [String, nil]
          optional :preassigned_recipient_name, String

          # @!attribute signing_order
          #
          #   @return [Integer, nil]
          optional :signing_order, Integer

          # @!attribute subject
          #
          #   @return [String, nil]
          optional :subject, String, nil?: true

          # @!method initialize(name:, id: nil, attachment_requests: nil, message: nil, preassigned_recipient_email: nil, preassigned_recipient_name: nil, signing_order: nil, subject: nil)
          #   @param name [String]
          #   @param id [String]
          #   @param attachment_requests [Array<SignwellSDK::Models::V1::DocumentTemplate::Placeholder::AttachmentRequest>]
          #   @param message [String, nil]
          #   @param preassigned_recipient_email [String]
          #   @param preassigned_recipient_name [String]
          #   @param signing_order [Integer]
          #   @param subject [String, nil]

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
