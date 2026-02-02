# typed: strong

module SignwellSDK
  module Models
    module V1
      # NOM-151 certificate data returned when object_only=true
      module DocumentRetrieveNom151CertificateResponse
        extend SignwellSDK::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse,
              SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151URLResponse,
              StringIO
            )
          end

        class Nom151CertificateResponse < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse,
                SignwellSDK::Internal::AnyHash
              )
            end

          sig do
            returns(
              SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse::Nom151
            )
          end
          attr_reader :nom151

          sig do
            params(
              nom151:
                SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse::Nom151::OrHash
            ).void
          end
          attr_writer :nom151

          # NOM-151 certificate data returned when object_only=true
          sig do
            params(
              nom151:
                SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse::Nom151::OrHash
            ).returns(T.attached_class)
          end
          def self.new(nom151:)
          end

          sig do
            override.returns(
              {
                nom151:
                  SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse::Nom151
              }
            )
          end
          def to_hash
          end

          class Nom151 < SignwellSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse::Nom151,
                  SignwellSDK::Internal::AnyHash
                )
              end

            # Base64-encoded certificate file
            sig { returns(String) }
            attr_accessor :constancia

            # Certificate number / Folio
            sig { returns(String) }
            attr_accessor :folio

            # Document digest (SHA-256 hash)
            sig { returns(String) }
            attr_accessor :hash_

            # Certificate issuance timestamp
            sig { returns(Time) }
            attr_accessor :issued_at

            # Certificate provider (e.g., SeguriData)
            sig { returns(String) }
            attr_accessor :provider

            # Certificate status (pending, issued, failed)
            sig { returns(String) }
            attr_accessor :status

            # RSA signature / Transaction ID
            sig { returns(String) }
            attr_accessor :transaction_id

            # URL to validate the certificate
            sig { returns(String) }
            attr_accessor :validation_url

            sig do
              params(
                constancia: String,
                folio: String,
                hash_: String,
                issued_at: Time,
                provider: String,
                status: String,
                transaction_id: String,
                validation_url: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Base64-encoded certificate file
              constancia:,
              # Certificate number / Folio
              folio:,
              # Document digest (SHA-256 hash)
              hash_:,
              # Certificate issuance timestamp
              issued_at:,
              # Certificate provider (e.g., SeguriData)
              provider:,
              # Certificate status (pending, issued, failed)
              status:,
              # RSA signature / Transaction ID
              transaction_id:,
              # URL to validate the certificate
              validation_url:
            )
            end

            sig do
              override.returns(
                {
                  constancia: String,
                  folio: String,
                  hash_: String,
                  issued_at: Time,
                  provider: String,
                  status: String,
                  transaction_id: String,
                  validation_url: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class Nom151URLResponse < SignwellSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151URLResponse,
                SignwellSDK::Internal::AnyHash
              )
            end

          # Public URL to download the certificate ZIP file
          sig { returns(String) }
          attr_accessor :file_url

          # NOM-151 download URL returned when url_only=true
          sig { params(file_url: String).returns(T.attached_class) }
          def self.new(
            # Public URL to download the certificate ZIP file
            file_url:
          )
          end

          sig { override.returns({ file_url: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
