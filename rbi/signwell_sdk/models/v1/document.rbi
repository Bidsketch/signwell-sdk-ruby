# typed: strong

module SignwellSDK
  module Models
    module V1
      class Document < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SignwellSDK::V1::Document, SignwellSDK::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Boolean) }
        attr_accessor :test_mode

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

        sig do
          returns(
            T.nilable(T::Array[SignwellSDK::V1::Document::AttachmentRequest])
          )
        end
        attr_reader :attachment_requests

        sig do
          params(
            attachment_requests:
              T::Array[SignwellSDK::V1::Document::AttachmentRequest::OrHash]
          ).void
        end
        attr_writer :attachment_requests

        sig do
          returns(T.nilable(T::Array[SignwellSDK::V1::Document::CheckboxGroup]))
        end
        attr_reader :checkbox_groups

        sig do
          params(
            checkbox_groups:
              T::Array[SignwellSDK::V1::Document::CheckboxGroup::OrHash]
          ).void
        end
        attr_writer :checkbox_groups

        sig do
          returns(T.nilable(T::Array[SignwellSDK::V1::Document::CopiedContact]))
        end
        attr_reader :copied_contacts

        sig do
          params(
            copied_contacts:
              T::Array[SignwellSDK::V1::Document::CopiedContact::OrHash]
          ).void
        end
        attr_writer :copied_contacts

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

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :embedded

        sig { params(embedded: T::Boolean).void }
        attr_writer :embedded

        sig { returns(T.nilable(String)) }
        attr_reader :embedded_edit_url

        sig { params(embedded_edit_url: String).void }
        attr_writer :embedded_edit_url

        sig { returns(T.nilable(String)) }
        attr_accessor :embedded_preview_url

        sig { returns(T.nilable(Integer)) }
        attr_reader :expires_in

        sig { params(expires_in: Integer).void }
        attr_writer :expires_in

        sig do
          returns(
            T.nilable(T::Array[T::Array[SignwellSDK::V1::Document::Field]])
          )
        end
        attr_reader :fields

        sig do
          params(
            fields: T::Array[T::Array[SignwellSDK::V1::Document::Field::OrHash]]
          ).void
        end
        attr_writer :fields

        sig { returns(T.nilable(T::Array[SignwellSDK::V1::Document::File])) }
        attr_reader :files

        sig do
          params(files: T::Array[SignwellSDK::V1::Document::File::OrHash]).void
        end
        attr_writer :files

        sig { returns(T.nilable(T::Array[SignwellSDK::V1::Document::Label])) }
        attr_reader :labels

        sig do
          params(
            labels: T::Array[SignwellSDK::V1::Document::Label::OrHash]
          ).void
        end
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
          returns(T.nilable(T::Array[SignwellSDK::V1::Document::Recipient]))
        end
        attr_reader :recipients

        sig do
          params(
            recipients: T::Array[SignwellSDK::V1::Document::Recipient::OrHash]
          ).void
        end
        attr_writer :recipients

        sig { returns(T.nilable(String)) }
        attr_accessor :redirect_url

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :reminders

        sig { params(reminders: T::Boolean).void }
        attr_writer :reminders

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

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
        attr_writer :updated_at

        sig do
          params(
            id: String,
            test_mode: T::Boolean,
            allow_decline: T.nilable(T::Boolean),
            allow_reassign: T.nilable(T::Boolean),
            api_application_id: T.nilable(String),
            apply_signing_order: T::Boolean,
            archived: T::Boolean,
            attachment_requests:
              T::Array[SignwellSDK::V1::Document::AttachmentRequest::OrHash],
            checkbox_groups:
              T::Array[SignwellSDK::V1::Document::CheckboxGroup::OrHash],
            copied_contacts:
              T::Array[SignwellSDK::V1::Document::CopiedContact::OrHash],
            created_at: Time,
            custom_requester_email: T.nilable(String),
            custom_requester_name: T.nilable(String),
            decline_redirect_url: T.nilable(String),
            embedded: T::Boolean,
            embedded_edit_url: String,
            embedded_preview_url: T.nilable(String),
            expires_in: Integer,
            fields:
              T::Array[T::Array[SignwellSDK::V1::Document::Field::OrHash]],
            files: T::Array[SignwellSDK::V1::Document::File::OrHash],
            labels: T::Array[SignwellSDK::V1::Document::Label::OrHash],
            language: String,
            message: String,
            metadata: T.nilable(T::Hash[Symbol, String]),
            name: String,
            recipients: T::Array[SignwellSDK::V1::Document::Recipient::OrHash],
            redirect_url: T.nilable(String),
            reminders: T::Boolean,
            requester_email_address: String,
            status: String,
            subject: String,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          test_mode:,
          allow_decline: nil,
          allow_reassign: nil,
          api_application_id: nil,
          apply_signing_order: nil,
          archived: nil,
          attachment_requests: nil,
          checkbox_groups: nil,
          copied_contacts: nil,
          created_at: nil,
          custom_requester_email: nil,
          custom_requester_name: nil,
          decline_redirect_url: nil,
          embedded: nil,
          embedded_edit_url: nil,
          embedded_preview_url: nil,
          expires_in: nil,
          fields: nil,
          files: nil,
          labels: nil,
          language: nil,
          message: nil,
          metadata: nil,
          name: nil,
          recipients: nil,
          redirect_url: nil,
          reminders: nil,
          requester_email_address: nil,
          status: nil,
          subject: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              test_mode: T::Boolean,
              allow_decline: T.nilable(T::Boolean),
              allow_reassign: T.nilable(T::Boolean),
              api_application_id: T.nilable(String),
              apply_signing_order: T::Boolean,
              archived: T::Boolean,
              attachment_requests:
                T::Array[SignwellSDK::V1::Document::AttachmentRequest],
              checkbox_groups:
                T::Array[SignwellSDK::V1::Document::CheckboxGroup],
              copied_contacts:
                T::Array[SignwellSDK::V1::Document::CopiedContact],
              created_at: Time,
              custom_requester_email: T.nilable(String),
              custom_requester_name: T.nilable(String),
              decline_redirect_url: T.nilable(String),
              embedded: T::Boolean,
              embedded_edit_url: String,
              embedded_preview_url: T.nilable(String),
              expires_in: Integer,
              fields: T::Array[T::Array[SignwellSDK::V1::Document::Field]],
              files: T::Array[SignwellSDK::V1::Document::File],
              labels: T::Array[SignwellSDK::V1::Document::Label],
              language: String,
              message: String,
              metadata: T.nilable(T::Hash[Symbol, String]),
              name: String,
              recipients: T::Array[SignwellSDK::V1::Document::Recipient],
              redirect_url: T.nilable(String),
              reminders: T::Boolean,
              requester_email_address: String,
              status: String,
              subject: String,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        class AttachmentRequest < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::Document::AttachmentRequest,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig { returns(String) }
          attr_accessor :recipient_id

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :required

          sig { params(required: T::Boolean).void }
          attr_writer :required

          sig do
            params(
              name: String,
              recipient_id: String,
              required: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(name:, recipient_id:, required: nil)
          end

          sig do
            override.returns(
              { name: String, recipient_id: String, required: T::Boolean }
            )
          end
          def to_hash
          end
        end

        class CheckboxGroup < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::Document::CheckboxGroup,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(T::Array[String]) }
          attr_accessor :checkbox_ids

          sig { returns(T::Boolean) }
          attr_accessor :required

          sig { returns(T.nilable(String)) }
          attr_accessor :group_name

          sig { returns(T.nilable(Integer)) }
          attr_reader :min_value

          sig { params(min_value: Integer).void }
          attr_writer :min_value

          sig { returns(T.nilable(String)) }
          attr_accessor :recipient_id

          sig { returns(T.nilable(String)) }
          attr_accessor :validation

          sig do
            params(
              id: String,
              checkbox_ids: T::Array[String],
              required: T::Boolean,
              group_name: T.nilable(String),
              min_value: Integer,
              recipient_id: T.nilable(String),
              validation: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            checkbox_ids:,
            required:,
            group_name: nil,
            min_value: nil,
            recipient_id: nil,
            validation: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                checkbox_ids: T::Array[String],
                required: T::Boolean,
                group_name: T.nilable(String),
                min_value: Integer,
                recipient_id: T.nilable(String),
                validation: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class CopiedContact < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::Document::CopiedContact,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :email

          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            params(email: String, id: String, name: String).returns(
              T.attached_class
            )
          end
          def self.new(email:, id: nil, name: nil)
          end

          sig { override.returns({ email: String, id: String, name: String }) }
          def to_hash
          end
        end

        class Field < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::Document::Field,
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

          sig { returns(T.nilable(String)) }
          attr_reader :date_format

          sig { params(date_format: String).void }
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
              T.nilable(T::Array[SignwellSDK::V1::Document::Field::Option])
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                T::Array[SignwellSDK::V1::Document::Field::Option::OrHash]
            ).void
          end
          attr_writer :options

          sig { returns(T.nilable(String)) }
          attr_reader :placeholder_name

          sig { params(placeholder_name: String).void }
          attr_writer :placeholder_name

          sig do
            returns(T.nilable(SignwellSDK::V1::Document::Field::Recipient))
          end
          attr_reader :recipient

          sig do
            params(
              recipient: SignwellSDK::V1::Document::Field::Recipient::OrHash
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

          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          sig { returns(T.nilable(String)) }
          attr_reader :validation

          sig { params(validation: String).void }
          attr_writer :validation

          sig do
            returns(
              T.nilable(SignwellSDK::V1::Document::Field::Value::Variants)
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
              date_format: String,
              default_option: String,
              fixed_width: T::Boolean,
              height: String,
              label: String,
              lock_sign_date: T::Boolean,
              name: T.nilable(String),
              options:
                T::Array[SignwellSDK::V1::Document::Field::Option::OrHash],
              placeholder_name: String,
              recipient: SignwellSDK::V1::Document::Field::Recipient::OrHash,
              recipient_id: T.nilable(String),
              required: T::Boolean,
              signing_elements_group_id: String,
              type: String,
              validation: String,
              value:
                T.nilable(SignwellSDK::V1::Document::Field::Value::Variants),
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
            type: nil,
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
                date_format: String,
                default_option: String,
                fixed_width: T::Boolean,
                height: String,
                label: String,
                lock_sign_date: T::Boolean,
                name: T.nilable(String),
                options: T::Array[SignwellSDK::V1::Document::Field::Option],
                placeholder_name: String,
                recipient: SignwellSDK::V1::Document::Field::Recipient,
                recipient_id: T.nilable(String),
                required: T::Boolean,
                signing_elements_group_id: String,
                type: String,
                validation: String,
                value:
                  T.nilable(SignwellSDK::V1::Document::Field::Value::Variants),
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
                  SignwellSDK::V1::Document::Field::Option,
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
                  SignwellSDK::V1::Document::Field::Recipient,
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
                T::Array[SignwellSDK::V1::Document::Field::Value::Variants]
              )
            end
            def self.variants
            end
          end
        end

        class File < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::Document::File,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig { returns(Integer) }
          attr_accessor :pages_number

          sig do
            params(name: String, pages_number: Integer).returns(
              T.attached_class
            )
          end
          def self.new(name:, pages_number:)
          end

          sig { override.returns({ name: String, pages_number: Integer }) }
          def to_hash
          end
        end

        class Label < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::Document::Label,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { params(id: String, name: String).returns(T.attached_class) }
          def self.new(id: nil, name: nil)
          end

          sig { override.returns({ id: String, name: String }) }
          def to_hash
          end
        end

        class Recipient < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::V1::Document::Recipient,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :email

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig do
            returns(
              T.nilable(
                T::Array[
                  SignwellSDK::V1::Document::Recipient::AttachmentRequest
                ]
              )
            )
          end
          attr_reader :attachment_requests

          sig do
            params(
              attachment_requests:
                T::Array[
                  SignwellSDK::V1::Document::Recipient::AttachmentRequest::OrHash
                ]
            ).void
          end
          attr_writer :attachment_requests

          sig { returns(T.nilable(String)) }
          attr_reader :body

          sig { params(body: String).void }
          attr_writer :body

          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :bounced

          sig { returns(T.nilable(String)) }
          attr_accessor :bounced_details

          sig { returns(T.nilable(String)) }
          attr_accessor :message

          sig { returns(T.nilable(String)) }
          attr_accessor :passcode

          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :send_email

          sig { returns(T.nilable(Integer)) }
          attr_accessor :send_email_delay

          sig { returns(T.nilable(Integer)) }
          attr_reader :signing_order

          sig { params(signing_order: Integer).void }
          attr_writer :signing_order

          sig { returns(T.nilable(String)) }
          attr_reader :signing_url

          sig { params(signing_url: String).void }
          attr_writer :signing_url

          sig { returns(T.nilable(String)) }
          attr_reader :status

          sig { params(status: String).void }
          attr_writer :status

          sig { returns(T.nilable(String)) }
          attr_accessor :subject

          sig do
            params(
              email: String,
              name: String,
              id: String,
              attachment_requests:
                T::Array[
                  SignwellSDK::V1::Document::Recipient::AttachmentRequest::OrHash
                ],
              body: String,
              bounced: T.nilable(T::Boolean),
              bounced_details: T.nilable(String),
              message: T.nilable(String),
              passcode: T.nilable(String),
              send_email: T.nilable(T::Boolean),
              send_email_delay: T.nilable(Integer),
              signing_order: Integer,
              signing_url: String,
              status: String,
              subject: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            email:,
            name:,
            id: nil,
            attachment_requests: nil,
            body: nil,
            bounced: nil,
            bounced_details: nil,
            message: nil,
            passcode: nil,
            send_email: nil,
            send_email_delay: nil,
            signing_order: nil,
            signing_url: nil,
            status: nil,
            subject: nil
          )
          end

          sig do
            override.returns(
              {
                email: String,
                name: String,
                id: String,
                attachment_requests:
                  T::Array[
                    SignwellSDK::V1::Document::Recipient::AttachmentRequest
                  ],
                body: String,
                bounced: T.nilable(T::Boolean),
                bounced_details: T.nilable(String),
                message: T.nilable(String),
                passcode: T.nilable(String),
                send_email: T.nilable(T::Boolean),
                send_email_delay: T.nilable(Integer),
                signing_order: Integer,
                signing_url: String,
                status: String,
                subject: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class AttachmentRequest < SignwellSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  SignwellSDK::V1::Document::Recipient::AttachmentRequest,
                  SignwellSDK::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :name

            sig { returns(T::Boolean) }
            attr_accessor :required

            sig { returns(T.nilable(String)) }
            attr_reader :url

            sig { params(url: String).void }
            attr_writer :url

            sig do
              params(name: String, required: T::Boolean, url: String).returns(
                T.attached_class
              )
            end
            def self.new(name:, required:, url: nil)
            end

            sig do
              override.returns(
                { name: String, required: T::Boolean, url: String }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
