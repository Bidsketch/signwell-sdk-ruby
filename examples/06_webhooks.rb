# frozen_string_literal: true

require 'dotenv/load'
require 'signwell_sdk'
require 'json'

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
  config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')
end

puts
puts '=' * 60
puts '  06 - Webhooks API'
puts '=' * 60
puts

api = SignWell::Resources::WebhooksApi.new
webhook_id = nil

begin
  # Clean up any leftover webhooks from previous runs
  existing = api.list_webhooks
  if existing.is_a?(Array)
    existing.each do |hook|
      url = hook&.callback_url
      next unless url&.start_with?('https://example.com/webhooks/signwell-sdk-test')

      api.delete_webhook(hook.id) if hook.id
    end
  end

  # Create a webhook
  puts '-> Creating webhook...'
  callback_url = "https://example.com/webhooks/signwell-sdk-test-#{Time.now.to_i}"
  request = SignWell::CreateWebhookRequest.new(
    callback_url: callback_url
  )
  response = api.create_webhook(request)
  webhook_id = response&.id
  puts '   [OK] Webhook created'
  puts '   Webhook:'
  puts JSON.pretty_generate(response.to_hash).gsub(/^/, '   ')

  sleep(1)

  # List webhooks
  puts '-> Listing webhooks...'
  webhooks = api.list_webhooks
  puts '   [OK] Webhooks listed'
  puts '   Webhooks:'
  if webhooks.is_a?(Array)
    webhooks.each do |hook|
      puts "   - #{hook.id}: #{hook.callback_url}"
    end
  else
    puts JSON.pretty_generate(webhooks.to_hash).gsub(/^/, '   ')
  end
rescue SignWell::Errors::AuthenticationError => e
  puts "   [ERROR] Authentication failed (#{e.code}): #{e.message}"
rescue SignWell::Errors::BadRequestError => e
  puts "   [ERROR] Bad request (#{e.code}): #{e.message}"
rescue SignWell::Errors::UnprocessableEntityError => e
  puts "   [ERROR] Validation failed (#{e.code}): #{e.message}"
rescue SignWell::Errors::NotFoundError => e
  puts "   [ERROR] Not found (#{e.code}): #{e.message}"
rescue SignWell::Errors::RateLimitError => e
  puts "   [ERROR] Rate limit exceeded (#{e.code}): #{e.message}"
rescue SignWell::Errors::InternalServerError => e
  puts "   [ERROR] Server error (#{e.code}): #{e.message}"
ensure
  if webhook_id
    sleep(1)
    puts '-> Deleting webhook...'
    api.delete_webhook(webhook_id)
    puts '   [OK] Webhook deleted'
  else
    puts '   [ERROR] Could not determine webhook ID for cleanup - check webhooks manually'
  end
end
