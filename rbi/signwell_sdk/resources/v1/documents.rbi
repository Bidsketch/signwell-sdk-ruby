# typed: strong

module SignwellSDK
  module Resources
    class V1
      class Documents
        # Creates and optionally sends a new document for signing. If `draft` is set to
        # true the document will not be sent.
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
          ).returns(SignwellSDK::V1::Document)
        end
        def create(
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

        # Returns a document and all associated document data. Supply the unique document
        # ID from either a document creation request or Document page URL.
        sig do
          params(
            id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::V1::Document)
        end
        def retrieve(
          # Unique identifier for a document.
          id,
          request_options: {}
        )
        end

        # Returns a paginated list of documents for the authenticated account.
        sig do
          params(
            limit: Integer,
            page: Integer,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::Models::V1::DocumentListResponse)
        end
        def list(
          # The number of documents to fetch. Defaults to 10, max is 50.
          limit: nil,
          # The page number for pagination. Defaults to the first page.
          page: nil,
          request_options: {}
        )
        end

        # Deletes a document. Deleting a document will also cancel document signing (if in
        # progress). Supply the unique document ID from either a Create Document request
        # or document page URL.
        sig do
          params(
            id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Unique identifier for a document.
          id,
          request_options: {}
        )
        end

        # Creates and optionally sends a new document for signing. If `draft` is set to
        # true the document will not be sent.
        sig do
          params(
            recipients:
              T::Array[
                SignwellSDK::V1::DocumentCreateFromTemplateParams::Recipient::OrHash
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
                T::Array[
                  SignwellSDK::V1::DocumentCreateFromTemplateParams::Field::OrHash
                ]
              ],
            files:
              T::Array[
                SignwellSDK::V1::DocumentCreateFromTemplateParams::File::OrHash
              ],
            labels: T::Array[SignwellSDK::V1::Label::OrHash],
            language: String,
            message: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            redirect_url: String,
            reminders: T::Boolean,
            subject: String,
            template_fields:
              T::Array[
                SignwellSDK::V1::DocumentCreateFromTemplateParams::TemplateField::OrHash
              ],
            template_id: String,
            template_ids: T::Array[String],
            test_mode: T::Boolean,
            text_tags: T::Boolean,
            with_signature_page: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse)
        end
        def create_from_template(
          # Document recipients are people that must complete and/or sign a document.
          # Recipients of the document must be assigned to a placeholder of the template.
          # Recipients will inherit all placeholder fields and settings.
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
          # Fields to be added to any appended files (not existing files). Document fields
          # placed on a document for collecting data or signatures from recipients. Field
          # data should be sent as a 2-dimensional JSON array. One array of fields is needed
          # for each file in the files array. An array of fields can be empty if you have a
          # file that does not contain any fields.
          fields: nil,
          files: nil,
          # Labels can be used to organize documents in a way that can make it easy to find
          # using the document search in SignWell. A document can have multiple labels.
          # Updating labels on a document will replace any existing labels for that
          # document.
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
          # Fields of your template(s) that you can prepopulate with values. Signature and
          # Initials fields cannot be signed through the API.
          template_fields: nil,
          # Use when you have to create a document from a single template. Either
          # :template_id or :template_ids must be present in the request, not both.
          template_id: nil,
          # Use when you have to create a document from multiple templates. Either
          # :template_id or :template_ids must be present in the request, not both.
          template_ids: nil,
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

        # Sends a reminder email to recipients that have not signed yet.
        sig do
          params(
            id: String,
            recipients:
              T::Array[
                SignwellSDK::V1::DocumentRemindParams::Recipient::OrHash
              ],
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def remind(
          # Unique identifier for a document.
          id,
          # Optional list if recipients within the document to send a reminder email to. If
          # none are specified, all recipients that have not signed yet will receive a
          # reminder email.
          recipients: nil,
          request_options: {}
        )
        end

        # Gets a completed document PDF or ZIP file. Supply the unique document ID from
        # either a document creation request or document page URL.
        sig do
          params(
            id: String,
            audit_page: T::Boolean,
            file_format:
              SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::OrSymbol,
            url_only: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(
            SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfResponse::Variants
          )
        end
        def retrieve_completed_pdf(
          # Unique identifier for a completed document.
          id,
          # Whether to include the audit page as part of the document. Defaults to `true`
          audit_page: nil,
          # Format of the file to be downloaded. Supported formats are 'pdf' and 'zip'.
          file_format: nil,
          # Whether to return the URL of the completed PDF or the actual PDF content.
          # Defaults to `false`.
          url_only: nil,
          request_options: {}
        )
        end

        # Download NOM-151 certificate for a completed document. Returns a ZIP file,
        # download URL, or raw certificate data based on query parameters.
        sig do
          params(
            id: String,
            object_only: T::Boolean,
            url_only: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(
            SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Variants
          )
        end
        def retrieve_nom151_certificate(
          # Unique identifier for a completed document.
          id,
          # If true, returns raw NOM-151 constancia certificate object as JSON instead of a
          # zip file or URL.
          object_only: nil,
          # If true, returns JSON with download URL instead of downloading the file
          url_only: nil,
          request_options: {}
        )
        end

        # Updates a draft document and sends it to be signed by recipients.
        sig do
          params(
            id: String,
            allow_decline: T::Boolean,
            allow_reassign: T::Boolean,
            api_application_id: String,
            apply_signing_order: T::Boolean,
            checkbox_groups: T::Array[SignwellSDK::V1::CheckboxGroup::OrHash],
            custom_requester_email: String,
            custom_requester_name: String,
            decline_redirect_url: String,
            embedded_signing: T::Boolean,
            embedded_signing_notifications: T::Boolean,
            expires_in: Integer,
            labels: T::Array[SignwellSDK::V1::Label::OrHash],
            message: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            redirect_url: String,
            reminders: T::Boolean,
            subject: String,
            test_mode: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(SignwellSDK::V1::Document)
        end
        def send_(
          # Unique identifier for a document.
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
          # Sets the custom requester email for the document. When set, this is the email
          # used for all email communications, signing notifications, and in the audit file.
          custom_requester_email: nil,
          # Sets the custom requester name for the document. When set, this is the name used
          # for all email communications, signing notifications, and in the audit file.
          custom_requester_name: nil,
          # A URL that recipients are redirected to if the document is declined.
          decline_redirect_url: nil,
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
