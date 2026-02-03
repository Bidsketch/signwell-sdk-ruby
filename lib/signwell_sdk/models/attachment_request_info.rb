# frozen_string_literal: true

module SignwellSDK
  module Models
    class AttachmentRequestInfo < SignwellSDK::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the attachment request
      #
      #   @return [String]
      required :name, String

      # @!attribute required
      #   Whether the attachment is required
      #
      #   @return [Boolean]
      required :required, SignwellSDK::Internal::Type::Boolean

      # @!attribute url
      #   URL of the uploaded attachment (when available)
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(name:, required:, url: nil)
      #   Attachment request information
      #
      #   @param name [String] Name of the attachment request
      #
      #   @param required [Boolean] Whether the attachment is required
      #
      #   @param url [String] URL of the uploaded attachment (when available)
    end
  end
end
