# frozen_string_literal: true

module SignwellSDK
  module Models
    module V1
      # @see SignwellSDK::Resources::V1::Documents#remind
      class DocumentRemindParams < SignwellSDK::Internal::Type::BaseModel
        extend SignwellSDK::Internal::Type::RequestParameters::Converter
        include SignwellSDK::Internal::Type::RequestParameters

        # @!attribute recipients
        #   Optional list if recipients within the document to send a reminder email to. If
        #   none are specified, all recipients that have not signed yet will receive a
        #   reminder email.
        #
        #   @return [Array<SignwellSDK::Models::V1::DocumentRemindParams::Recipient>, nil]
        optional :recipients,
                 -> { SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentRemindParams::Recipient] }

        # @!method initialize(recipients: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SignwellSDK::Models::V1::DocumentRemindParams} for more details.
        #
        #   @param recipients [Array<SignwellSDK::Models::V1::DocumentRemindParams::Recipient>] Optional list if recipients within the document to send a reminder email to. If
        #
        #   @param request_options [SignwellSDK::RequestOptions, Hash{Symbol=>Object}]

        class Recipient < SignwellSDK::Internal::Type::BaseModel
          # @!attribute email
          #   Recipient's email address.
          #
          #   @return [String, nil]
          optional :email, String

          # @!attribute name
          #   Recipient's name (required if multiple recipients share the same email).
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(email: nil, name: nil)
          #   @param email [String] Recipient's email address.
          #
          #   @param name [String] Recipient's name (required if multiple recipients share the same email).
        end
      end
    end
  end
end
