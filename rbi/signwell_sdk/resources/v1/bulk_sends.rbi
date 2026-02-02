# typed: strong

module SignwellSDK
  module Resources
    class V1
      class BulkSends
        # Creates a bulk send, and it validates the CSV file before creating the bulk
        # send.
        sig do
          params(
            bulk_send_csv: String,
            template_ids: T::Array[String],
            api_application_id: String,
            apply_signing_order: T::Boolean,
            custom_requester_email: String,
            custom_requester_name: String,
            message: String,
            name: String,
            skip_row_errors: T::Boolean,
            subject: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def create(
          # A RFC 4648 base64 string of the template CSV file to be validated.
          bulk_send_csv:,
          # Unique identifiers for a list of templates.
          template_ids:,
          # Unique identifier for API Application settings to use. API Applications are
          # optional and mainly used when isolating OAuth apps or for more control over
          # embedded API settings
          api_application_id: nil,
          # When set to `true` recipients will sign one at a time in the order of the
          # `recipients` collection of this request.
          apply_signing_order: nil,
          # Sets the custom requester email for the document. When set, this is the email
          # used for all email communications, signing notifications, and in the audit file.
          custom_requester_email: nil,
          # Sets the custom requester name for the document. When set, this is the name used
          # for all email communications, signing notifications, and in the audit file.
          custom_requester_name: nil,
          # Email message for the signature request that recipients will see. Defaults to
          # the default system message or a template message.
          message: nil,
          # The name of the Bulk Send. Will be used as the document name for each of the
          # documents.
          name: nil,
          # Whether to skip errors in the rows. Defaults to `false`.
          skip_row_errors: nil,
          # Email subject for the signature request that recipients will see. Defaults to
          # the default system subject or a template subject.
          subject: nil,
          request_options: {}
        )
        end

        # Returns information about the Bulk Send.
        sig do
          params(
            id: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def retrieve(
          # Unique identifier for a bulk send.
          id,
          request_options: {}
        )
        end

        # Returns information about the Bulk Send.
        sig do
          params(
            api_application_id: String,
            limit: Integer,
            page: Integer,
            user_email: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def list(
          # Unique identifier for API Application settings to use. API Applications are
          # optional and mainly used when isolating OAuth apps or for more control over
          # embedded API settings
          api_application_id: nil,
          # The number of documents to fetch. Defaults to 10, max is 50.
          limit: nil,
          # The page number for pagination. Defaults to the first page.
          page: nil,
          # The email address of the user that sent the Bulk Send. Must have the `admin` or
          # `manager` role to view Bulk Sends of other users. Defaults to the user that the
          # API key belongs to.
          user_email: nil,
          request_options: {}
        )
        end

        # Fetches a CSV template that corresponds to the provided document template IDs.
        # CSV templates are blank CSV files that have columns containing required and
        # optional data that can be sent when creating a bulk send. Fields can be
        # referenced by the field label. Example: [placeholder name]\_[field label] could
        # be something like customer_address or signer_company_name (if 'Customer' and
        # 'Signer' were placeholder names for templates set up in SignWell).
        sig do
          params(
            template_ids: T::Array[String],
            base64: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(StringIO)
        end
        def retrieve_csv_template(
          # Specify one or more templates to generate a single blank CSV file that will
          # contain available columns for your recipient data. The template_ids[] parameter
          # is an array of template IDs
          # (e.g.,`/?template_ids[]=5a67dbd7-928a-4ea0-a7e2-e476a0eb045f&template_ids[]=d7315111-c671-4b15-8354-c9a19bbaefa0`).
          # Each ID should be a separate parameter in the query string.
          template_ids:,
          # A RFC 4648 base64 string of the template CSV file to be validated.
          base64: nil,
          request_options: {}
        )
        end

        # Returns information about the Bulk Send.
        sig do
          params(
            id: String,
            limit: Integer,
            page: Integer,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def retrieve_documents(
          # Unique identifier for a bulk send.
          id,
          # The number of documents to fetch. Defaults to 10, max is 50.
          limit: nil,
          # The page number for pagination. Defaults to the first page.
          page: nil,
          request_options: {}
        )
        end

        # Validates a Bulk Send CSV file before creating the Bulk Send. It will check the
        # structure of the CSV and the data it contains, and return any errors found.
        sig do
          params(
            bulk_send_csv: String,
            template_ids: T::Array[String],
            request_options: SignwellSDK::RequestOptions::OrHash
          ).void
        end
        def validate_csv(
          # A RFC 4648 base64 string of the template CSV file to be validated.
          bulk_send_csv:,
          # Specify one or more templates to generate a single blank CSV file that will
          # contain available columns for your recipient data. The template_ids[] parameter
          # is an array of template IDs
          # (e.g.,`/?template_ids[]=5a67dbd7-928a-4ea0-a7e2-e476a0eb045f&template_ids[]=d7315111-c671-4b15-8354-c9a19bbaefa0`).
          # Each ID should be a separate parameter in the query string.
          template_ids:,
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
