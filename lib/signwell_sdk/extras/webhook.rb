# frozen_string_literal: true
# Source: signwell-sdk-generator/extras/ruby/overlay/lib/signwell_sdk/extras/webhook.rb
# Do not edit the generated SDK copy directly.

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
    # Small replay store for local development and single-process apps.
    #
    # Production apps should use a shared atomic store such as Redis or a
    # database table with a uniqueness constraint.
    class MemoryReplayStore
      def initialize(max_entries: 10_000, now: -> { Time.now.to_i })
        raise ArgumentError, 'max_entries must be a positive integer' unless max_entries.is_a?(Integer) && max_entries.positive?

        @max_entries = max_entries
        @now = now
        @entries = {}
      end

      def add(key, expires_at_unix_seconds)
        current_time = @now.call.to_f
        @entries.delete_if { |_entry_key, expires_at| expires_at < current_time }

        return false if @entries.key?(key)

        @entries.shift while @entries.length >= @max_entries
        @entries[key] = expires_at_unix_seconds.to_f
        true
      end
    end

    # Verifies the authenticity of a SignWell webhook event using HMAC-SHA256.
    # Returns +false+ for missing or invalid arguments instead of raising.
    #
    # @param event [Hash] The +event+ object from the webhook payload.
    #   Must contain +'type'+, +'time'+, and +'hash'+ keys.
    # @param webhook_id [String] Your webhook's secret ID.
    # @param tolerance_seconds [Numeric, nil] Optional timestamp freshness window.
    # @param now [#call] Optional clock returning current Unix seconds.
    # @return [Boolean] +true+ if the signature is valid, +false+ otherwise
    # @see #verify_event! Bang version that raises on invalid input
    def self.verify_event(event:, webhook_id:, tolerance_seconds: nil, now: -> { Time.now.to_i })
      verify_event!(event: event, webhook_id: webhook_id, tolerance_seconds: tolerance_seconds, now: now)
    rescue ArgumentError
      false
    end

    # Verifies a webhook event once, using an application-provided replay store.
    # Returns +false+ for invalid signatures, stale timestamps, or duplicates.
    #
    # @param event [Hash] The +event+ object from the webhook payload.
    # @param webhook_id [String] Your webhook's secret ID.
    # @param replay_store [#add] Store with atomic +add(key, expires_at)+.
    # @param tolerance_seconds [Numeric] Timestamp freshness and replay expiry window.
    # @param now [#call] Optional clock returning current Unix seconds.
    # @return [Boolean] +true+ if valid and not replayed.
    def self.verify_event_once(event:, webhook_id:, replay_store:, tolerance_seconds:, now: -> { Time.now.to_i })
      verify_event_once!(
        event: event,
        webhook_id: webhook_id,
        replay_store: replay_store,
        tolerance_seconds: tolerance_seconds,
        now: now
      )
    rescue ArgumentError
      false
    end

    # Verifies a webhook event once and raises on invalid input, invalid
    # signatures, stale timestamps, or duplicates.
    #
    # @return [Boolean] +true+ when the event is valid and stored.
    # @raise [ArgumentError] when verification or replay storage fails.
    def self.verify_event_once!(event:, webhook_id:, replay_store:, tolerance_seconds:, now: -> { Time.now.to_i })
      raise ArgumentError, 'tolerance_seconds is required for replay protection' if tolerance_seconds.nil?
      unless replay_store.respond_to?(:add)
        raise ArgumentError, 'replay_store with an atomic add method is required'
      end

      parsed = verify_event_data!(
        event: event,
        webhook_id: webhook_id,
        tolerance_seconds: tolerance_seconds,
        now: now
      )
      expires_at = parsed[:time].to_f + tolerance_seconds.to_f
      stored = replay_store.add(replay_key(event), expires_at)
      raise ArgumentError, 'webhook event has already been processed' unless stored

      true
    end

    # Builds the replay-store key used by +verify_event_once!+.
    #
    # @param event [Hash] The +event+ object from the webhook payload.
    # @return [String] Stable replay key.
    # @raise [ArgumentError] if required event keys are missing or malformed.
    def self.replay_key(event)
      parsed = parse_event!(event)

      "signwell:#{parsed[:type]}:#{parsed[:time]}:#{parsed[:hash]}"
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
    def self.verify_event!(event:, webhook_id:, tolerance_seconds: nil, now: -> { Time.now.to_i })
      verify_event_data!(
        event: event,
        webhook_id: webhook_id,
        tolerance_seconds: tolerance_seconds,
        now: now
      )
      true
    end

    # @api private
    def self.verify_event_data!(event:, webhook_id:, tolerance_seconds:, now:)
      raise ArgumentError, 'webhook_id must be a non-empty string' unless webhook_id.is_a?(String) && !webhook_id.empty?

      parsed = parse_event!(event)
      verify_fresh_timestamp!(parsed[:time], tolerance_seconds, now) unless tolerance_seconds.nil?

      data = "#{parsed[:type]}@#{parsed[:time]}"
      calculated = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('SHA256'), webhook_id, data)
      raise ArgumentError, 'webhook signature is invalid' unless secure_compare(calculated, parsed[:hash])

      parsed
    end

    # @api private
    def self.parse_event!(event)
      raise ArgumentError, 'event must be a Hash' unless event.is_a?(Hash)

      type = event_value(event, :type)
      time = event_value(event, :time)
      hash = event_value(event, :hash)

      missing = [
        ['type', type],
        ['time', time],
        ['hash', hash]
      ].select { |_key, value| value.nil? || value == '' }
      unless missing.empty?
        raise ArgumentError,
              "event is missing required keys: #{missing.map(&:first).join(', ')}. " \
              'Make sure you pass payload["event"], not the full webhook payload'
      end

      raise ArgumentError, 'event.hash must be a string' unless hash.is_a?(String)

      { type: type, time: time, hash: hash }
    end

    # @api private
    def self.verify_fresh_timestamp!(time, tolerance_seconds, now)
      unless tolerance_seconds.is_a?(Numeric) && tolerance_seconds.finite? && tolerance_seconds >= 0
        raise ArgumentError, 'tolerance_seconds must be a non-negative number'
      end

      begin
        timestamp = Float(time)
        current_time = Float(now.call)
      rescue TypeError, ArgumentError
        raise ArgumentError, 'event.time must be a Unix timestamp when tolerance_seconds is provided'
      end
      raise ArgumentError, 'event.time must be a Unix timestamp when tolerance_seconds is provided' unless timestamp.finite?

      if (current_time - timestamp).abs > tolerance_seconds
        raise ArgumentError, 'webhook timestamp is outside the allowed tolerance'
      end
    end

    # @api private
    # Constant-time string comparison to prevent timing attacks.
    def self.secure_compare(a, b)
      return false unless a.bytesize == b.bytesize

      OpenSSL.fixed_length_secure_compare(a, b)
    end

    def self.event_value(event, key)
      return event[key.to_s] if event.key?(key.to_s)
      return event[key.to_sym] if event.key?(key.to_sym)

      nil
    end

    private_class_method :verify_event_data!, :parse_event!, :verify_fresh_timestamp!, :secure_compare, :event_value
  end
end
