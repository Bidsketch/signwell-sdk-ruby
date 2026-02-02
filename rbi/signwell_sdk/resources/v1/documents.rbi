# typed: strong

module SignwellSDK
  module Resources
    class V1
      class Documents
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

        # @api private
        sig { params(client: SignwellSDK::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
