# frozen_string_literal: true

require 'openssl'
require 'spec_helper'

RSpec.describe SignWell::Webhook do
  def signed_event(webhook_id:, type: 'document_completed', time: '1710000000')
    signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('SHA256'), webhook_id, "#{type}@#{time}")
    { 'type' => type, 'time' => time, 'hash' => signature }
  end

  describe '.verify_event' do
    it 'verifies a valid SignWell webhook event' do
      event = signed_event(webhook_id: 'whk_123')

      expect(described_class.verify_event(event: event, webhook_id: 'whk_123')).to eq(true)
      expect(described_class.verify_event!(event: event, webhook_id: 'whk_123')).to eq(true)
    end

    it 'supports symbol-keyed event hashes' do
      event = signed_event(webhook_id: 'whk_123').transform_keys(&:to_sym)

      expect(described_class.verify_event(event: event, webhook_id: 'whk_123')).to eq(true)
    end

    it 'returns false for invalid signatures' do
      expect(described_class.verify_event(
               event: { type: 'document_completed', time: '1710000000', hash: '0' * 64 },
               webhook_id: 'whk_123'
             )).to eq(false)
      expect do
        described_class.verify_event!(
          event: { type: 'document_completed', time: '1710000000', hash: '0' * 64 },
          webhook_id: 'whk_123'
        )
      end.to raise_error(ArgumentError, /signature is invalid/)
    end

    it 'raises useful errors for malformed events' do
      expect do
        described_class.verify_event!(
          event: { type: 'document_completed', time: '1710000000', hash: 123 },
          webhook_id: 'whk_123'
        )
      end.to raise_error(ArgumentError, /event\.hash must be a string/)

      expect do
        described_class.verify_event!(event: { event: { type: 'document_completed' } }, webhook_id: 'whk_123')
      end.to raise_error(ArgumentError, /payload\["event"\]/)
    end

    it 'optionally enforces timestamp freshness' do
      event = signed_event(webhook_id: 'whk_123')

      expect(described_class.verify_event(
               event: event,
               webhook_id: 'whk_123',
               tolerance_seconds: 60,
               now: -> { 1_710_000_030 }
             )).to eq(true)

      expect(described_class.verify_event(
               event: event,
               webhook_id: 'whk_123',
               tolerance_seconds: 60,
               now: -> { 1_710_000_100 }
             )).to eq(false)
      expect do
        described_class.verify_event!(
          event: event,
          webhook_id: 'whk_123',
          tolerance_seconds: 60,
          now: -> { 1_710_000_100 }
        )
      end.to raise_error(ArgumentError, /outside the allowed tolerance/)
    end
  end

  describe '.verify_event_once' do
    it 'rejects replayed webhook events with a replay store' do
      event = signed_event(webhook_id: 'whk_123', time: '1710000000')
      replay_store = described_class::MemoryReplayStore.new(now: -> { 1_710_000_000 })

      expect(described_class.verify_event_once!(
               event: event,
               webhook_id: 'whk_123',
               tolerance_seconds: 60,
               now: -> { 1_710_000_000 },
               replay_store: replay_store
             )).to eq(true)

      expect do
        described_class.verify_event_once!(
          event: event,
          webhook_id: 'whk_123',
          tolerance_seconds: 60,
          now: -> { 1_710_000_000 },
          replay_store: replay_store
        )
      end.to raise_error(ArgumentError, /already been processed/)
      expect(described_class.verify_event_once(
               event: event,
               webhook_id: 'whk_123',
               tolerance_seconds: 60,
               now: -> { 1_710_000_000 },
               replay_store: replay_store
             )).to eq(false)
    end

    it 'does not store invalid signatures in the replay store' do
      replay_store = described_class::MemoryReplayStore.new(now: -> { 1_710_000_000 })
      invalid_event = { type: 'document_completed', time: '1710000000', hash: '0' * 64 }
      valid_event = signed_event(webhook_id: 'whk_123', time: '1710000000')

      expect(described_class.verify_event_once(
               event: invalid_event,
               webhook_id: 'whk_123',
               tolerance_seconds: 60,
               now: -> { 1_710_000_000 },
               replay_store: replay_store
             )).to eq(false)
      expect(described_class.verify_event_once(
               event: valid_event,
               webhook_id: 'whk_123',
               tolerance_seconds: 60,
               now: -> { 1_710_000_000 },
               replay_store: replay_store
             )).to eq(true)
    end

    it 'expires entries from the in-memory replay store' do
      current_time = 1_710_000_000
      event = signed_event(webhook_id: 'whk_123', time: current_time.to_s)
      replay_store = described_class::MemoryReplayStore.new(now: -> { current_time })

      expect(described_class.verify_event_once(
               event: event,
               webhook_id: 'whk_123',
               tolerance_seconds: 60,
               now: -> { current_time },
               replay_store: replay_store
             )).to eq(true)

      current_time += 61
      expect(described_class.verify_event_once(
               event: event,
               webhook_id: 'whk_123',
               tolerance_seconds: 120,
               now: -> { current_time },
               replay_store: replay_store
             )).to eq(true)
    end

    it 'builds a stable replay key' do
      expect(described_class.replay_key(
               type: 'document_completed',
               time: 1_710_000_000,
               hash: 'a' * 64
             )).to eq("signwell:document_completed:1710000000:#{'a' * 64}")
    end
  end
end
