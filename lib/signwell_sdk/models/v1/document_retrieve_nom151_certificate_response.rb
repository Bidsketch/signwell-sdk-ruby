# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # NOM-151 certificate data returned when object_only=true
      #
      # @see SignwellSDK::Resources::V1::Documents#retrieve_nom151_certificate
      module DocumentRetrieveNom151CertificateResponse
        extend SignwellSDK::Internal::Type::Union

        # NOM-151 certificate data returned when object_only=true
        variant -> { SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse }

        # NOM-151 download URL returned when url_only=true
        variant -> { SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151URLResponse }

        variant StringIO

        class Nom151CertificateResponse < SignwellSDK::Internal::Type::BaseModel
          # @!attribute nom151
          #
          #   @return [SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse::Nom151]
          required :nom151,
                   -> { SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse::Nom151 }

          # @!method initialize(nom151:)
          #   NOM-151 certificate data returned when object_only=true
          #
          #   @param nom151 [SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse::Nom151]

          # @see SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse#nom151
          class Nom151 < SignwellSDK::Internal::Type::BaseModel
            # @!attribute constancia
            #   Base64-encoded certificate file
            #
            #   @return [String]
            required :constancia, String

            # @!attribute folio
            #   Certificate number / Folio
            #
            #   @return [String]
            required :folio, String

            # @!attribute hash_
            #   Document digest (SHA-256 hash)
            #
            #   @return [String]
            required :hash_, String, api_name: :hash

            # @!attribute issued_at
            #   Certificate issuance timestamp
            #
            #   @return [Time]
            required :issued_at, Time, api_name: :issuedAt

            # @!attribute provider
            #   Certificate provider (e.g., SeguriData)
            #
            #   @return [String]
            required :provider, String

            # @!attribute status
            #   Certificate status (pending, issued, failed)
            #
            #   @return [String]
            required :status, String

            # @!attribute transaction_id
            #   RSA signature / Transaction ID
            #
            #   @return [String]
            required :transaction_id, String, api_name: :transactionId

            # @!attribute validation_url
            #   URL to validate the certificate
            #
            #   @return [String]
            required :validation_url, String, api_name: :validationUrl

            # @!method initialize(constancia:, folio:, hash_:, issued_at:, provider:, status:, transaction_id:, validation_url:)
            #   @param constancia [String] Base64-encoded certificate file
            #
            #   @param folio [String] Certificate number / Folio
            #
            #   @param hash_ [String] Document digest (SHA-256 hash)
            #
            #   @param issued_at [Time] Certificate issuance timestamp
            #
            #   @param provider [String] Certificate provider (e.g., SeguriData)
            #
            #   @param status [String] Certificate status (pending, issued, failed)
            #
            #   @param transaction_id [String] RSA signature / Transaction ID
            #
            #   @param validation_url [String] URL to validate the certificate
          end
        end

        class Nom151URLResponse < SignwellSDK::Internal::Type::BaseModel
          # @!attribute file_url
          #   Public URL to download the certificate ZIP file
          #
          #   @return [String]
          required :file_url, String

          # @!method initialize(file_url:)
          #   NOM-151 download URL returned when url_only=true
          #
          #   @param file_url [String] Public URL to download the certificate ZIP file
        end

        # @!method self.variants
        #   @return [Array(SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse, SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151URLResponse, StringIO)]
      end
    end
  end
end
