# typed: strong

module SignwellSDK
  module Models
    module V1
      class BulkSendValidateCsvParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::V1::BulkSendValidateCsvParams,
              SignwellSDK::Internal::AnyHash
            )
          end

        # A RFC 4648 base64 string of the template CSV file to be validated.
        sig { returns(String) }
        attr_accessor :bulk_send_csv

        # Specify one or more templates to generate a single blank CSV file that will
        # contain available columns for your recipient data. The template_ids[] parameter
        # is an array of template IDs
        # (e.g.,`/?template_ids[]=5a67dbd7-928a-4ea0-a7e2-e476a0eb045f&template_ids[]=d7315111-c671-4b15-8354-c9a19bbaefa0`).
        # Each ID should be a separate parameter in the query string.
        sig { returns(T::Array[String]) }
        attr_accessor :template_ids

        sig do
          params(
            bulk_send_csv: String,
            template_ids: T::Array[String],
            request_options: SignwellSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
              bulk_send_csv: String,
              template_ids: T::Array[String],
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
