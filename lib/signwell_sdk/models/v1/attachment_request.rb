# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      class AttachmentRequest < SignwellSDK::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the requested attachment.
        #
        #   @return [String]
        required :name, String

        # @!attribute recipient_id
        #   Unique identifier of the recipient that will view the attachment request.
        #
        #   @return [String]
        required :recipient_id, String

        # @!attribute required
        #   Whether the recipient will need to upload the attachment to successfully
        #   complete/sign the document. Defaults to `true`.
        #
        #   @return [Boolean, nil]
        optional :required, SignwellSDK::Internal::Type::Boolean

        # @!method initialize(name:, recipient_id:, required: nil)
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::AttachmentRequest} for more details.
        #
        #   @param name [String] Name of the requested attachment.
        #
        #   @param recipient_id [String] Unique identifier of the recipient that will view the attachment request.
        #
        #   @param required [Boolean] Whether the recipient will need to upload the attachment to successfully complet
      end
    end
  end
end
