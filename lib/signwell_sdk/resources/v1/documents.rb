# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      class Documents
        # Returns a paginated list of documents for the authenticated account.
        #
        # @overload list(limit: nil, page: nil, request_options: {})
        #
        # @param limit [Integer] The number of documents to fetch. Defaults to 10, max is 50.
        #
        # @param page [Integer] The page number for pagination. Defaults to the first page.
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentListResponse]
        #
        # @see SignwellSDK::Models::V1::DocumentListParams
        def list(params = {})
          parsed, options = SignwellSDK::V1::DocumentListParams.dump_request(params)
          @client.request(
            method: :get,
            path: "api/v1/documents",
            query: parsed,
            model: SignwellSDK::Models::V1::DocumentListResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentRemindParams} for more details.
        #
        # Sends a reminder email to recipients that have not signed yet.
        #
        # @overload remind(id, recipients: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a document.
        #
        # @param recipients [Array<SignwellSDK::Models::V1::DocumentRemindParams::Recipient>] Optional list if recipients within the document to send a reminder email to. If
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SignwellSDK::Models::V1::DocumentRemindParams
        def remind(id, params = {})
          parsed, options = SignwellSDK::V1::DocumentRemindParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["api/v1/documents/%1$s/remind", id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateParams} for more
        # details.
        #
        # Download NOM-151 certificate for a completed document. Returns a ZIP file,
        # download URL, or raw certificate data based on query parameters.
        #
        # @overload retrieve_nom151_certificate(id, object_only: nil, url_only: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a completed document.
        #
        # @param object_only [Boolean] If true, returns raw NOM-151 constancia certificate object as JSON instead of a
        #
        # @param url_only [Boolean] If true, returns JSON with download URL instead of downloading the file
        #
        # @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse, SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151URLResponse, StringIO]
        #
        # @see SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateParams
        def retrieve_nom151_certificate(id, params = {})
          parsed, options = SignwellSDK::V1::DocumentRetrieveNom151CertificateParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["api/v1/documents/%1$s/nom151_certificate", id],
            query: parsed,
            model: SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [SignwellSDK::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
