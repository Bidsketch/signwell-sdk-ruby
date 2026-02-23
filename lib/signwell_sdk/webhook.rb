# frozen_string_literal: true

require 'openssl'

module SignWell
  # Webhook signature verification for SignWell events.
  #
  # SignWell sends a HMAC-SHA256 signature with every webhook event so you can
  # verify it came from SignWell and was not tampered with. The signature is
  # computed from the event type and timestamp, using your webhook's secret ID
  # as the key.
  #
  # @example Verify a webhook in a Rails controller
  #   class WebhooksController < ApplicationController
  #     skip_before_action :verify_authenticity_token
  #
  #     def create
  #       event = JSON.parse(request.body.read)
  #
  #       unless SignWell::Webhook.verify_event(event: event, webhook_id: ENV['SIGNWELL_WEBHOOK_ID'])
  #         head :unauthorized
  #         return
  #       end
  #
  #       # Process the verified event
  #       case event['type']
  #       when 'document_completed'
  #         # handle completed document
  #       end
  #
  #       head :ok
  #     end
  #   end
  #
  # @example Verify a webhook in a Sinatra app
  #   post '/webhooks/signwell' do
  #     event = JSON.parse(request.body.read)
  #
  #     halt 401 unless SignWell::Webhook.verify_event(event: event, webhook_id: ENV['SIGNWELL_WEBHOOK_ID'])
  #
  #     # Process the verified event
  #     status 200
  #   end
  #
  # @see https://developers.signwell.com/reference/webhooks SignWell Webhooks Documentation
  module Webhook
    # Verifies the authenticity of a SignWell webhook event using HMAC-SHA256.
    #
    # Computes +HMAC-SHA256(webhook_id, "type@time")+ and compares it to the
    # +hash+ field in the event payload using a constant-time comparison.
    #
    # @param event [Hash] Parsed webhook JSON payload. Must contain:
    #   - +'type'+ (String) - the event type, e.g. +"document_completed"+
    #   - +'time'+ (String) - ISO 8601 timestamp of the event
    #   - +'hash'+ (String) - HMAC-SHA256 hex digest to verify against
    # @param webhook_id [String] Your webhook's secret ID (found in your
    #   SignWell dashboard under API > Webhooks). Used as the HMAC key.
    # @return [Boolean] +true+ if the signature is valid, +false+ otherwise
    # @raise [NoMethodError] if +event+ is missing required keys
    def self.verify_event(event:, webhook_id:)
      data = "#{event['type']}@#{event['time']}"
      expected = event['hash']
      calculated = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('SHA256'), webhook_id, data)
      secure_compare(calculated, expected)
    end

    # @api private
    # Constant-time string comparison to prevent timing attacks.
    def self.secure_compare(a, b)
      return false unless a.bytesize == b.bytesize

      OpenSSL.fixed_length_secure_compare(a, b)
    end
  end
end
