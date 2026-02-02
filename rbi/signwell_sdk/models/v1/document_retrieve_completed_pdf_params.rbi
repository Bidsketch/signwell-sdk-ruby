# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentRetrieveCompletedPdfParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::DocumentRetrieveCompletedPdfParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Whether to include the audit page as part of the document. Defaults to `true`
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :audit_page

        sig { params(audit_page: T::Boolean).void }
        attr_writer :audit_page

        # Format of the file to be downloaded. Supported formats are 'pdf' and 'zip'.
        sig do
          returns(
            T.nilable(
              SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::OrSymbol
            )
          )
        end
        attr_reader :file_format

        sig do
          params(
            file_format:
              SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::OrSymbol
          ).void
        end
        attr_writer :file_format

        # Whether to return the URL of the completed PDF or the actual PDF content.
        # Defaults to `false`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :url_only

        sig { params(url_only: T::Boolean).void }
        attr_writer :url_only

        sig do
          params(
            audit_page: T::Boolean,
            file_format:
              SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::OrSymbol,
            url_only: T::Boolean,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
              audit_page: T::Boolean,
              file_format:
                SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::OrSymbol,
              url_only: T::Boolean,
              request_options: SignwellSDK::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Format of the file to be downloaded. Supported formats are 'pdf' and 'zip'.
        module FileFormat
          extend SignwellSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PDF =
            T.let(
              :pdf,
              SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::TaggedSymbol
            )
          ZIP =
            T.let(
              :zip,
              SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
