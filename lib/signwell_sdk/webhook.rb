# frozen_string_literal: true

require 'openssl'

module SignWell
  module Webhook
    # Verifies the authenticity of a SignWell webhook event using HMAC-SHA256.
    #
    # @param event [Hash] Parsed webhook payload with 'type', 'time', and 'hash' keys
    # @param webhook_id [String] Your webhook's secret ID used as the HMAC key
    # @return [Boolean] true if the event signature is valid
    def self.verify_event(event:, webhook_id:)
      data = "#{event['type']}@#{event['time']}"
      expected = event['hash']
      calculated = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('SHA256'), webhook_id, data)
      secure_compare(calculated, expected)
    end

    # Constant-time string comparison to prevent timing attacks.
    def self.secure_compare(a, b)
      return false unless a.bytesize == b.bytesize

      OpenSSL.fixed_length_secure_compare(a, b)
    end
  end
end
