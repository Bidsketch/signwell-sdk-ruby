# frozen_string_literal: true

# Webhook Signature Validation
#
# When SignWell sends a webhook to your endpoint, each payload includes
# an `event.hash` field with an HMAC-SHA256 signature. Use SignWell::Webhook.verify_event
# to validate the signature before processing the event.
#
# The webhook payload has this structure:
#   { "event": { "type": "...", "time": ..., "hash": "..." }, "data": { ... } }
#
# You must pass `payload['event']` (not the full payload) to verify_event.
#
# Your webhook ID is available in the SignWell dashboard (Settings > Webhooks).

require 'signwell_sdk'
require 'sinatra'
require 'json'

post '/webhooks/signwell' do
  payload = JSON.parse(request.body.read)
  event = payload['event']

  unless SignWell::Webhook.verify_event(event: event, webhook_id: ENV['SIGNWELL_WEBHOOK_ID'])
    halt 401, 'Invalid signature'
  end

  case event['type']
  when 'document_completed'
    puts "Document #{payload.dig('data', 'id')} completed"
  when 'document_declined'
    puts "Document #{payload.dig('data', 'id')} declined"
  end

  status 200
end
