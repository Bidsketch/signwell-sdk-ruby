# typed: strong

module SignwellSDK
  module Resources
    class V1
      class DocumentTemplates
        # Creates a new template.
        sig do
          params(
            files: T::Array[SignwellSDK::V1::File::OrHash],
            placeholders:
              T::Array[
                SignwellSDK::V1::DocumentTemplateCreateParams::Placeholder::OrHash
              ],
            allow_decline: T::Boolean,
            allow_reassign: T::Boolean,
            api_application_id: String,
            apply_signing_order: T::Boolean,
            attachment_requests:
              T::Array[
                SignwellSDK::V1::DocumentTemplateCreateParams::AttachmentRequest::OrHash
              ],
            checkbox_groups:
              T::Array[SignwellSDK::V1::TemplateCheckboxGroup::OrHash],
            copied_placeholders:
              T::Array[
                SignwellSDK::V1::DocumentTemplateCreateParams::CopiedPlaceholder::OrHash
              ],
            decline_redirect_url: String,
            draft: T::Boolean,
            expires_in: Integer,
            fields:
              T::Array[
                T::Array[
                  SignwellSDK::V1::DocumentTemplateCreateParams::Field::OrHash
                ]
              ],
            labels: T::Array[SignwellSDK::V1::Label::OrHash],
            language: String,
            message: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            redirect_url: String,
            reminders: T::Boolean,
            subject: String,
            text_tags: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::V1::DocumentTemplate)
        end
        def create(
          # Document files can be uploaded by specifying a file URL or base64 string. Either
          # `file_url` or `file_base64` must be present (not both). Valid file types are:
          # .pdf, .doc, .docx, .pages, .ppt, .pptx, .key, .xls, .xlsx, .numbers, .jpg,
          # .jpeg, .png, .tiff, .tif, .webp, .html, and .htm
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

        # Returns a template and all associated template data. Supply the unique template
        # ID from either a Create Template request or template page URL.
        sig do
          params(
            id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::V1::DocumentTemplate)
        end
        def retrieve(
          # Unique identifier for a template.
          id,
          request_options: {}
        )
        end

        # Updates an existing template.
        sig do
          params(
            id: String,
            allow_decline: T::Boolean,
            allow_reassign: T::Boolean,
            api_application_id: String,
            apply_signing_order: T::Boolean,
            checkbox_groups:
              T::Array[SignwellSDK::V1::TemplateCheckboxGroup::OrHash],
            decline_redirect_url: String,
            draft: T::Boolean,
            expires_in: Integer,
            labels: T::Array[SignwellSDK::V1::Label::OrHash],
            message: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            redirect_url: String,
            reminders: T::Boolean,
            subject: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::V1::DocumentTemplate)
        end
        def update(
          # Unique identifier for a template.
          id,
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
          request_options: {}
        )
        end

        # Returns a paginated list of templates for the authenticated account.
        sig do
          params(
            limit: Integer,
            page: Integer,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::Models::V1::DocumentTemplateListResponse)
        end
        def list(
          # The number of documents to fetch. Defaults to 10, max is 50.
          limit: nil,
          # The page number for pagination. Defaults to the first page.
          page: nil,
          request_options: {}
        )
        end

        # Deletes a template. Supply the unique template ID from either a Create Template
        # request or template page URL.
        sig do
          params(
            id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Unique identifier for a template.
          id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: SignwellSDK::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
