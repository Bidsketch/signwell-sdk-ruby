# typed: strong

module SignwellSDK
  module Models
    module V1
      class BulkSendRetrieveCsvTemplateParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::BulkSendRetrieveCsvTemplateParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Specify one or more templates to generate a single blank CSV file that will
        # contain available columns for your recipient data. The template_ids[] parameter
        # is an array of template IDs
        # (e.g.,`/?template_ids[]=5a67dbd7-928a-4ea0-a7e2-e476a0eb045f&template_ids[]=d7315111-c671-4b15-8354-c9a19bbaefa0`).
        # Each ID should be a separate parameter in the query string.
        sig { returns(T::Array[String]) }
        attr_accessor :template_ids

        # A RFC 4648 base64 string of the template CSV file to be validated.
        sig { returns(T.nilable(String)) }
        attr_reader :base64

        sig { params(base64: String).void }
        attr_writer :base64

        sig do
          params(
            template_ids: T::Array[String],
            base64: String,
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
              template_ids: T::Array[String],
              base64: String,
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
