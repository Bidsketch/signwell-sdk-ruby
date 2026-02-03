# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentTemplate < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::DocumentTemplate,
              SignwellSDK::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :allow_decline

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :allow_reassign

        sig { returns(T.nilable(String)) }
        attr_accessor :api_application_id

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :apply_signing_order

        sig { params(apply_signing_order: T::Boolean).void }
        attr_writer :apply_signing_order

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :archived

        sig { params(archived: T::Boolean).void }
        attr_writer :archived

        sig { returns(T.nilable(T::Array[SignwellSDK::CheckboxGroupInfo])) }
        attr_reader :checkbox_groups

        sig do
          params(
            checkbox_groups: T::Array[SignwellSDK::CheckboxGroupInfo::OrHash]
          ).void
        end
        attr_writer :checkbox_groups

        sig do
          returns(
            T.nilable(
              T::Array[SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder]
            )
          )
        end
        attr_reader :copied_placeholders

        sig do
          params(
            copied_placeholders:
              T::Array[
                SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder::OrHash
              ]
          ).void
        end
        attr_writer :copied_placeholders

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig { returns(T.nilable(String)) }
        attr_accessor :custom_requester_email

        sig { returns(T.nilable(String)) }
        attr_accessor :custom_requester_name

        sig { returns(T.nilable(String)) }
        attr_accessor :decline_redirect_url

        sig { returns(T.nilable(Integer)) }
        attr_accessor :expires_in

        sig do
          returns(
            T.nilable(
              T::Array[T::Array[SignwellSDK::V1::DocumentTemplate::Field]]
            )
          )
        end
        attr_reader :fields

        sig do
          params(
            fields:
              T::Array[
                T::Array[SignwellSDK::V1::DocumentTemplate::Field::OrHash]
              ]
          ).void
        end
        attr_writer :fields

        sig { returns(T.nilable(T::Array[SignwellSDK::FileInfo])) }
        attr_reader :files

        sig { params(files: T::Array[SignwellSDK::FileInfo::OrHash]).void }
        attr_writer :files

        sig { returns(T.nilable(T::Array[SignwellSDK::LabelInfo])) }
        attr_reader :labels

        sig { params(labels: T::Array[SignwellSDK::LabelInfo::OrHash]).void }
        attr_writer :labels

        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_accessor :metadata

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig do
          returns(
            T.nilable(T::Array[SignwellSDK::V1::DocumentTemplate::Placeholder])
          )
        end
        attr_reader :placeholders

        sig do
          params(
            placeholders:
              T::Array[SignwellSDK::V1::DocumentTemplate::Placeholder::OrHash]
          ).void
        end
        attr_writer :placeholders

        sig { returns(T.nilable(String)) }
        attr_accessor :redirect_url

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :reminders

        sig { returns(T.nilable(String)) }
        attr_reader :requester_email_address

        sig { params(requester_email_address: String).void }
        attr_writer :requester_email_address

        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        sig { returns(T.nilable(String)) }
        attr_reader :subject

        sig { params(subject: String).void }
        attr_writer :subject

        sig { returns(T.nilable(String)) }
        attr_reader :template_link

        sig { params(template_link: String).void }
        attr_writer :template_link

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
        attr_writer :updated_at

        sig do
          params(
            id: String,
            allow_decline: T.nilable(T::Boolean),
            allow_reassign: T.nilable(T::Boolean),
            api_application_id: T.nilable(String),
            apply_signing_order: T::Boolean,
            archived: T::Boolean,
            checkbox_groups: T::Array[SignwellSDK::CheckboxGroupInfo::OrHash],
            copied_placeholders:
              T::Array[
                SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder::OrHash
              ],
            created_at: Time,
            custom_requester_email: T.nilable(String),
            custom_requester_name: T.nilable(String),
            decline_redirect_url: T.nilable(String),
            expires_in: T.nilable(Integer),
            fields:
              T::Array[
                T::Array[SignwellSDK::V1::DocumentTemplate::Field::OrHash]
              ],
            files: T::Array[SignwellSDK::FileInfo::OrHash],
            labels: T::Array[SignwellSDK::LabelInfo::OrHash],
            language: String,
            message: String,
            metadata: T.nilable(T::Hash[Symbol, String]),
            name: String,
            placeholders:
              T::Array[SignwellSDK::V1::DocumentTemplate::Placeholder::OrHash],
            redirect_url: T.nilable(String),
            reminders: T.nilable(T::Boolean),
            requester_email_address: String,
            status: String,
            subject: String,
            template_link: String,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          allow_decline: nil,
          allow_reassign: nil,
          api_application_id: nil,
          apply_signing_order: nil,
          archived: nil,
          checkbox_groups: nil,
          copied_placeholders: nil,
          created_at: nil,
          custom_requester_email: nil,
          custom_requester_name: nil,
          decline_redirect_url: nil,
          expires_in: nil,
          fields: nil,
          files: nil,
          labels: nil,
          language: nil,
          message: nil,
          metadata: nil,
          name: nil,
          placeholders: nil,
          redirect_url: nil,
          reminders: nil,
          requester_email_address: nil,
          status: nil,
          subject: nil,
          template_link: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              allow_decline: T.nilable(T::Boolean),
              allow_reassign: T.nilable(T::Boolean),
              api_application_id: T.nilable(String),
              apply_signing_order: T::Boolean,
              archived: T::Boolean,
              checkbox_groups: T::Array[SignwellSDK::CheckboxGroupInfo],
              copied_placeholders:
                T::Array[SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder],
              created_at: Time,
              custom_requester_email: T.nilable(String),
              custom_requester_name: T.nilable(String),
              decline_redirect_url: T.nilable(String),
              expires_in: T.nilable(Integer),
              fields:
                T::Array[T::Array[SignwellSDK::V1::DocumentTemplate::Field]],
              files: T::Array[SignwellSDK::FileInfo],
              labels: T::Array[SignwellSDK::LabelInfo],
              language: String,
              message: String,
              metadata: T.nilable(T::Hash[Symbol, String]),
              name: String,
              placeholders:
                T::Array[SignwellSDK::V1::DocumentTemplate::Placeholder],
              redirect_url: T.nilable(String),
              reminders: T.nilable(T::Boolean),
              requester_email_address: String,
              status: String,
              subject: String,
              template_link: String,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        class CopiedPlaceholder < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig { returns(T.nilable(String)) }
          attr_accessor :message

          sig { returns(T.nilable(String)) }
          attr_reader :placeholder_id

          sig { params(placeholder_id: String).void }
          attr_writer :placeholder_id

          sig { returns(T.nilable(String)) }
          attr_reader :preassigned_recipient_email

          sig { params(preassigned_recipient_email: String).void }
          attr_writer :preassigned_recipient_email

          sig { returns(T.nilable(String)) }
          attr_reader :preassigned_recipient_name

          sig { params(preassigned_recipient_name: String).void }
          attr_writer :preassigned_recipient_name

          sig { returns(T.nilable(String)) }
          attr_accessor :subject

          sig do
            params(
              name: String,
              id: String,
              message: T.nilable(String),
              placeholder_id: String,
              preassigned_recipient_email: String,
              preassigned_recipient_name: String,
              subject: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            name:,
            id: nil,
            message: nil,
            placeholder_id: nil,
            preassigned_recipient_email: nil,
            preassigned_recipient_name: nil,
            subject: nil
          )
          end

          sig do
            override.returns(
              {
                name: String,
                id: String,
                message: T.nilable(String),
                placeholder_id: String,
                preassigned_recipient_email: String,
                preassigned_recipient_name: String,
                subject: T.nilable(String)
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
                SignwellSDK::V1::DocumentTemplate::Field,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :page

          sig { returns(Float) }
          attr_accessor :x

          sig { returns(Float) }
          attr_accessor :y_

          # Whether "Other" option is allowed
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :allow_other

          sig { params(allow_other: T::Boolean).void }
          attr_writer :allow_other

          sig { returns(T.nilable(String)) }
          attr_reader :api_id

          sig { params(api_id: String).void }
          attr_writer :api_id

          # Date format for date fields. Valid values: MM/DD/YYYY, DD/MM/YYYY, YYYY/MM/DD,
          # Month DD, YYYY, MM/DD/YYYY hh:mm:ss a. Default: MM/DD/YYYY
          sig { returns(T.nilable(SignwellSDK::DateFormat::TaggedSymbol)) }
          attr_reader :date_format

          sig { params(date_format: SignwellSDK::DateFormat::OrSymbol).void }
          attr_writer :date_format

          # Default selected option
          sig { returns(T.nilable(String)) }
          attr_reader :default_option

          sig { params(default_option: String).void }
          attr_writer :default_option

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :fixed_width

          sig { params(fixed_width: T::Boolean).void }
          attr_writer :fixed_width

          sig { returns(T.nilable(String)) }
          attr_reader :height

          sig { params(height: String).void }
          attr_writer :height

          sig { returns(T.nilable(String)) }
          attr_reader :label

          sig { params(label: String).void }
          attr_writer :label

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :lock_sign_date

          sig { params(lock_sign_date: T::Boolean).void }
          attr_writer :lock_sign_date

          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Dropdown options (for dropdown/select fields)
          sig do
            returns(
              T.nilable(
                T::Array[SignwellSDK::V1::DocumentTemplate::Field::Option]
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                T::Array[
                  SignwellSDK::V1::DocumentTemplate::Field::Option::OrHash
                ]
            ).void
          end
          attr_writer :options

          sig { returns(T.nilable(String)) }
          attr_reader :placeholder_name

          sig { params(placeholder_name: String).void }
          attr_writer :placeholder_name

          sig do
            returns(
              T.nilable(SignwellSDK::V1::DocumentTemplate::Field::Recipient)
            )
          end
          attr_reader :recipient

          sig do
            params(
              recipient:
                SignwellSDK::V1::DocumentTemplate::Field::Recipient::OrHash
            ).void
          end
          attr_writer :recipient

          sig { returns(T.nilable(String)) }
          attr_accessor :recipient_id

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :required

          sig { params(required: T::Boolean).void }
          attr_writer :required

          sig { returns(T.nilable(String)) }
          attr_reader :signing_elements_group_id

          sig { params(signing_elements_group_id: String).void }
          attr_writer :signing_elements_group_id

          # Type of signing field
          sig { returns(T.nilable(SignwellSDK::FieldType::TaggedSymbol)) }
          attr_reader :type

          sig { params(type: SignwellSDK::FieldType::OrSymbol).void }
          attr_writer :type

          # Validation rule for text fields
          sig { returns(T.nilable(SignwellSDK::TextValidation::TaggedSymbol)) }
          attr_reader :validation

          sig { params(validation: SignwellSDK::TextValidation::OrSymbol).void }
          attr_writer :validation

          sig do
            returns(
              T.nilable(
                SignwellSDK::V1::DocumentTemplate::Field::Value::Variants
              )
            )
          end
          attr_accessor :value

          sig { returns(T.nilable(String)) }
          attr_reader :width

          sig { params(width: String).void }
          attr_writer :width

          sig do
            params(
              page: Integer,
              x: Float,
              y_: Float,
              allow_other: T::Boolean,
              api_id: String,
              date_format: SignwellSDK::DateFormat::OrSymbol,
              default_option: String,
              fixed_width: T::Boolean,
              height: String,
              label: String,
              lock_sign_date: T::Boolean,
              name: T.nilable(String),
              options:
                T::Array[
                  SignwellSDK::V1::DocumentTemplate::Field::Option::OrHash
                ],
              placeholder_name: String,
              recipient:
                SignwellSDK::V1::DocumentTemplate::Field::Recipient::OrHash,
              recipient_id: T.nilable(String),
              required: T::Boolean,
              signing_elements_group_id: String,
              type: SignwellSDK::FieldType::OrSymbol,
              validation: SignwellSDK::TextValidation::OrSymbol,
              value:
                T.nilable(
                  SignwellSDK::V1::DocumentTemplate::Field::Value::Variants
                ),
              width: String
            ).returns(T.attached_class)
          end
          def self.new(
            page:,
            x:,
            y_:,
            # Whether "Other" option is allowed
            allow_other: nil,
            api_id: nil,
            # Date format for date fields. Valid values: MM/DD/YYYY, DD/MM/YYYY, YYYY/MM/DD,
            # Month DD, YYYY, MM/DD/YYYY hh:mm:ss a. Default: MM/DD/YYYY
            date_format: nil,
            # Default selected option
            default_option: nil,
            fixed_width: nil,
            height: nil,
            label: nil,
            lock_sign_date: nil,
            name: nil,
            # Dropdown options (for dropdown/select fields)
            options: nil,
            placeholder_name: nil,
            recipient: nil,
            recipient_id: nil,
            required: nil,
            signing_elements_group_id: nil,
            # Type of signing field
            type: nil,
            # Validation rule for text fields
            validation: nil,
            value: nil,
            width: nil
          )
          end

          sig do
            override.returns(
              {
                page: Integer,
                x: Float,
                y_: Float,
                allow_other: T::Boolean,
                api_id: String,
                date_format: SignwellSDK::DateFormat::TaggedSymbol,
                default_option: String,
                fixed_width: T::Boolean,
                height: String,
                label: String,
                lock_sign_date: T::Boolean,
                name: T.nilable(String),
                options:
                  T::Array[SignwellSDK::V1::DocumentTemplate::Field::Option],
                placeholder_name: String,
                recipient: SignwellSDK::V1::DocumentTemplate::Field::Recipient,
                recipient_id: T.nilable(String),
                required: T::Boolean,
                signing_elements_group_id: String,
                type: SignwellSDK::FieldType::TaggedSymbol,
                validation: SignwellSDK::TextValidation::TaggedSymbol,
                value:
                  T.nilable(
                    SignwellSDK::V1::DocumentTemplate::Field::Value::Variants
                  ),
                width: String
              }
            )
          end
          def to_hash
          end

          class Option < SignwellSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  SignwellSDK::V1::DocumentTemplate::Field::Option,
                  SignwellSDK::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :api_id

            sig { params(api_id: String).void }
            attr_writer :api_id

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :is_other

            sig { params(is_other: T::Boolean).void }
            attr_writer :is_other

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig do
              params(
                api_id: String,
                is_other: T::Boolean,
                name: String
              ).returns(T.attached_class)
            end
            def self.new(api_id: nil, is_other: nil, name: nil)
            end

            sig do
              override.returns(
                { api_id: String, is_other: T::Boolean, name: String }
              )
            end
            def to_hash
            end
          end

          class Recipient < SignwellSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  SignwellSDK::V1::DocumentTemplate::Field::Recipient,
                  SignwellSDK::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :email

            sig { returns(String) }
            attr_accessor :name

            sig do
              params(email: String, name: String).returns(T.attached_class)
            end
            def self.new(email:, name:)
            end

            sig { override.returns({ email: String, name: String }) }
            def to_hash
            end
          end

          module Value
            extend SignwellSDK::Internal::Type::Union

            Variants = T.type_alias { T.any(String, T::Boolean, Float) }

            sig do
              override.returns(
                T::Array[
                  SignwellSDK::V1::DocumentTemplate::Field::Value::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        class Placeholder < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::DocumentTemplate::Placeholder,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig do
            returns(T.nilable(T::Array[SignwellSDK::AttachmentRequestInfo]))
          end
          attr_reader :attachment_requests

          sig do
            params(
              attachment_requests:
                T::Array[SignwellSDK::AttachmentRequestInfo::OrHash]
            ).void
          end
          attr_writer :attachment_requests

          sig { returns(T.nilable(String)) }
          attr_accessor :message

          sig { returns(T.nilable(String)) }
          attr_reader :preassigned_recipient_email

          sig { params(preassigned_recipient_email: String).void }
          attr_writer :preassigned_recipient_email

          sig { returns(T.nilable(String)) }
          attr_reader :preassigned_recipient_name

          sig { params(preassigned_recipient_name: String).void }
          attr_writer :preassigned_recipient_name

          sig { returns(T.nilable(Integer)) }
          attr_reader :signing_order

          sig { params(signing_order: Integer).void }
          attr_writer :signing_order

          sig { returns(T.nilable(String)) }
          attr_accessor :subject

          sig do
            params(
              name: String,
              id: String,
              attachment_requests:
                T::Array[SignwellSDK::AttachmentRequestInfo::OrHash],
              message: T.nilable(String),
              preassigned_recipient_email: String,
              preassigned_recipient_name: String,
              signing_order: Integer,
              subject: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            name:,
            id: nil,
            attachment_requests: nil,
            message: nil,
            preassigned_recipient_email: nil,
            preassigned_recipient_name: nil,
            signing_order: nil,
            subject: nil
          )
          end

          sig do
            override.returns(
              {
                name: String,
                id: String,
                attachment_requests:
                  T::Array[SignwellSDK::AttachmentRequestInfo],
                message: T.nilable(String),
                preassigned_recipient_email: String,
                preassigned_recipient_name: String,
                signing_order: Integer,
                subject: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
