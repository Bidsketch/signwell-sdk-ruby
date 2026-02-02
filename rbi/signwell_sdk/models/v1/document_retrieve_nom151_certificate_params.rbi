# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentRetrieveNom151CertificateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::DocumentRetrieveNom151CertificateParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # If true, returns raw NOM-151 constancia certificate object as JSON instead of a
        # zip file or URL.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :object_only

        sig { params(object_only: T::Boolean).void }
        attr_writer :object_only

        # If true, returns JSON with download URL instead of downloading the file
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :url_only

        sig { params(url_only: T::Boolean).void }
        attr_writer :url_only

        sig do
          params(
            object_only: T::Boolean,
            url_only: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # If true, returns raw NOM-151 constancia certificate object as JSON instead of a
          # zip file or URL.
          object_only: nil,
          # If true, returns JSON with download URL instead of downloading the file
          url_only: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              object_only: T::Boolean,
              url_only: T::Boolean,
              request_options: SignwellSDK::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
