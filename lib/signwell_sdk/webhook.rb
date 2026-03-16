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
  # @example Verify a webhook in a Rails controller (using verify_event!)
  #   class WebhooksController < ApplicationController
  #     skip_before_action :verify_authenticity_token
  #
  #     def create
  #       payload = JSON.parse(request.body.read)
  #       event = payload['event']
  #
  #       SignWell::Webhook.verify_event!(event: event, webhook_id: ENV['SIGNWELL_WEBHOOK_ID'])
  #
  #       # Process the verified event
  #       case event['type']
  #       when 'document_completed'
  #         # handle completed document
  #       end
  #
  #       head :ok
  #     rescue ArgumentError
  #       head :unauthorized
  #     end
  #   end
  #
  # @example Verify a webhook in a Sinatra app (using verify_event)
  #   post '/webhooks/signwell' do
  #     payload = JSON.parse(request.body.read)
  #     event = payload['event']
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
    # Returns +false+ for missing or invalid arguments instead of raising.
    #
    # @param event [Hash] The +event+ object from the webhook payload.
    #   Must contain +'type'+, +'time'+, and +'hash'+ keys.
    # @param webhook_id [String] Your webhook's secret ID.
    # @return [Boolean] +true+ if the signature is valid, +false+ otherwise
    # @see #verify_event! Bang version that raises on invalid input
    def self.verify_event(event:, webhook_id:)
      verify_event!(event: event, webhook_id: webhook_id)
    rescue ArgumentError
      false
    end

    # Verifies the authenticity of a SignWell webhook event using HMAC-SHA256.
    # Raises +ArgumentError+ with a descriptive message when input is invalid.
    #
    # Computes +HMAC-SHA256(webhook_id, "type@time")+ and compares it to the
    # +hash+ field in the event payload using a constant-time comparison.
    #
    # @param event [Hash] The +event+ object from the webhook payload.
    #   Must contain:
    #   - +'type'+ (String) - the event type, e.g. +"document_completed"+
    #   - +'time'+ (String, Integer) - timestamp of the event
    #   - +'hash'+ (String) - HMAC-SHA256 hex digest to verify against
    # @param webhook_id [String] Your webhook's secret ID (found in your
    #   SignWell dashboard under API > Webhooks). Used as the HMAC key.
    # @return [Boolean] +true+ if the signature is valid, +false+ otherwise
    # @raise [ArgumentError] if +webhook_id+ is missing or +event+ is missing
    #   required keys
    def self.verify_event!(event:, webhook_id:)
      raise ArgumentError, 'webhook_id must be a non-empty string' unless webhook_id.is_a?(String) && !webhook_id.empty?
      raise ArgumentError, 'event must be a Hash' unless event.is_a?(Hash)

      type = event['type']
      time = event['time']
      hash = event['hash']

      missing = []
      missing << 'type' unless type
      missing << 'time' unless time
      missing << 'hash' unless hash
      unless missing.empty?
        raise ArgumentError,
              "event is missing required keys: #{missing.join(', ')}. " \
              'Make sure you pass payload["event"], not the full webhook payload'
      end

      data = "#{type}@#{time}"
      calculated = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('SHA256'), webhook_id, data)
      secure_compare(calculated, hash)
    end

    # @api private
    # Constant-time string comparison to prevent timing attacks.
    def self.secure_compare(a, b)
      return false unless a.bytesize == b.bytesize

      OpenSSL.fixed_length_secure_compare(a, b)
    end
  end
end
