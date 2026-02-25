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
puts '  07 - Error Handling'
puts '=' * 60
puts

document_api = SignWell::Resources::DocumentApi.new

# 1. NotFoundError - request a non-existent document
puts '-> Triggering NotFoundError (non-existent document)...'
begin
  document_api.get_document('non-existent-id-12345')
  puts '   [ERROR] Expected NotFoundError but request succeeded'
rescue SignWell::Errors::NotFoundError => e
  puts '   [OK] Caught NotFoundError'
  puts "   Code: #{e.code}"
  puts "   Message: #{e.message.to_s[0..100]}"
end

sleep(1)

# 2. BadRequestError - create webhook with invalid data
puts '-> Triggering BadRequestError (missing callback_url)...'
begin
  webhook_api = SignWell::Resources::WebhooksApi.new
  request = SignWell::CreateWebhookRequest.new(callback_url: '')
  webhook_api.create_webhook(request)
  puts '   [ERROR] Expected BadRequestError but request succeeded'
rescue SignWell::Errors::BadRequestError => e
  puts '   [OK] Caught BadRequestError'
  puts "   Code: #{e.code}"
  puts "   Message: #{e.message.to_s[0..100]}"
rescue SignWell::Errors::UnprocessableEntityError => e
  puts '   [OK] Caught UnprocessableEntityError'
  puts "   Code: #{e.code}"
  puts "   Message: #{e.message.to_s[0..100]}"
end

sleep(1)

# 3. AuthenticationError - use a bad API key
puts '-> Triggering AuthenticationError (invalid API key)...'
begin
  # Temporarily create a client with a bad key
  bad_config = SignWell::Configuration.new
  bad_config.api_key['X-Api-Key'] = 'invalid-api-key-12345'
  bad_config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')
  bad_client = SignWell::ApiClient.new(bad_config)
  bad_api = SignWell::Resources::BulkSendApi.new(bad_client)
  bad_api.list_bulk_sends
  puts '   [ERROR] Expected AuthenticationError but request succeeded'
rescue SignWell::Errors::AuthenticationError => e
  puts '   [OK] Caught AuthenticationError'
  puts "   Code: #{e.code}"
  puts "   Message: #{e.message.to_s[0..100]}"
end

sleep(1)

# 4. Generic error handling with base class
puts '-> Demonstrating generic ApiError catch-all...'
begin
  document_api.get_document('another-fake-id')
rescue SignWell::Errors::ApiError => e
  puts '   [OK] Caught via base ApiError class'
  puts "   Error class: #{e.class.name}"
  puts "   Code: #{e.code}"
  puts "   Message: #{e.message.to_s[0..100]}"
end

sleep(1)

# 5. Plan limit errors - API returns 401 when plan limits are exceeded
# This is a common scenario: the API key is valid but the account has
# reached its document/template limit. The error comes back as a 401
# (AuthenticationError) with a descriptive message about the limit.
puts '-> Demonstrating plan limit error handling...'
puts '   Plan limit errors use HTTP 401 but indicate a billing issue, not bad credentials.'
puts '   You can distinguish them by checking the error message:'
puts
puts '   begin'
puts "     api.create_document(request)"
puts '   rescue SignWell::Errors::AuthenticationError => e'
puts "     if e.message.include?('document limit')"
puts "       # Handle plan limit - prompt user to upgrade"
puts '     else'
puts '       # Handle actual auth failure - check API key'
puts '     end'
puts '   end'

puts
puts 'Error hierarchy:'
puts '  SignWell::Errors::ApiError (base)'
puts '    SignWell::Errors::ApiConnectionError'
puts '    SignWell::Errors::ApiTimeoutError'
puts '    SignWell::Errors::ApiStatusError'
puts '      SignWell::Errors::BadRequestError (400)'
puts '      SignWell::Errors::AuthenticationError (401)'
puts '      SignWell::Errors::PermissionDeniedError (403)'
puts '      SignWell::Errors::NotFoundError (404)'
puts '      SignWell::Errors::ConflictError (409)'
puts '      SignWell::Errors::UnprocessableEntityError (422)'
puts '      SignWell::Errors::RateLimitError (429)'
puts '      SignWell::Errors::InternalServerError (5xx)'
