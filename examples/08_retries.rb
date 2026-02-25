# frozen_string_literal: true

require 'dotenv/load'
require 'signwell_sdk'
require 'faraday/retry'
require 'json'

puts
puts '=' * 60
puts '  08 - Retry Configuration'
puts '=' * 60
puts

# The SDK uses Faraday as its HTTP client. You can configure automatic
# retries using the faraday-retry middleware. This is useful for handling
# transient errors like rate limits (429), timeouts, and server errors (5xx).
#
# Install the gem: gem install faraday-retry

# --- Scenario 1: Trigger a real 429 rate limit and retry automatically ---
#
# The SignWell API enforces rate limits and returns 429 Too Many Requests
# with X-RateLimit-* headers when exceeded. We'll flood the API to trigger
# a 429, then show how the retry middleware handles it automatically.

puts '-> Scenario 1: Trigger a real 429 rate limit and retry automatically'
puts '   Flooding the API with rapid requests to hit the rate limit...'
puts

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
  config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')

  config.set_faraday_middleware(:request, :retry,
                                max: 5,
                                interval: 2,
                                backoff_factor: 2,
                                methods: %i[get post put patch delete],
                                retry_statuses: [429],
                                retry_block: lambda { |env:, options:, retry_count:, exception:, will_retry_in:|
                                  puts "   [RETRY] Attempt ##{retry_count} for #{env.method.upcase} #{env.url.path}"
                                  puts "   [RETRY] Status: #{env.status} - retrying in #{will_retry_in.round(1)}s..."
                                })
end

api = SignWell::Resources::MeApi.new
rate_limited = false
request_count = 0

# Send rapid requests until we hit the rate limit
# The API typically allows ~120 requests per minute
begin
  200.times do
    request_count += 1
    api.get_me
  end
rescue SignWell::Errors::RateLimitError => e
  # If we get here, all retries were exhausted
  rate_limited = true
  puts "   [RATE LIMITED] Hit 429 after #{request_count} requests (retries exhausted)"
  puts "   Code: #{e.code}"
  puts "   Message: #{e.message.to_s[0..150]}"
rescue SignWell::Errors::AuthenticationError => e
  puts "   [ERROR] Authentication failed (#{e.code}): #{e.message}"
end

unless rate_limited
  puts "   Sent #{request_count} requests. The retry middleware handled any 429s transparently."
end

sleep(2)

# --- Scenario 2: Without retries (to show the raw 429) ---
puts
puts '-> Scenario 2: Same flood WITHOUT retry middleware (to show the raw 429)'
puts

no_retry_config = SignWell::Configuration.new
no_retry_config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
no_retry_config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')
# No retry middleware - fresh configuration without any middleware

no_retry_client = SignWell::ApiClient.new(no_retry_config)
api_no_retry = SignWell::Resources::MeApi.new(no_retry_client)
request_count = 0

begin
  200.times do
    request_count += 1
    api_no_retry.get_me
  end
  puts "   Sent #{request_count} requests without hitting the rate limit."
rescue SignWell::Errors::RateLimitError => e
  puts "   [RATE LIMITED] Hit 429 after #{request_count} requests (no retries)"
  puts "   Code: #{e.code}"
  puts "   Message: #{e.message.to_s[0..150]}"
  puts '   Without retry middleware, the error propagates immediately.'
rescue SignWell::Errors::AuthenticationError => e
  puts "   [ERROR] Authentication failed (#{e.code}): #{e.message}"
end

sleep(2)

# --- Scenario 3: Retry on connection failures and timeouts ---
puts
puts '-> Scenario 3: Retry on connection failures and timeouts'
puts '   Configures retries for Faraday::ConnectionFailed and Faraday::TimeoutError.'
puts

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
  config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')
  config.timeout = 30

  config.set_faraday_middleware(:request, :retry,
                                max: 3,
                                interval: 1,
                                backoff_factor: 2,
                                methods: %i[get],
                                exceptions: [
                                  Faraday::ConnectionFailed,
                                  Faraday::TimeoutError
                                ],
                                retry_block: lambda { |env:, retry_count:, exception:, **|
                                  puts "   [RETRY] Attempt ##{retry_count}: #{exception.class}"
                                })
end

api = SignWell::Resources::MeApi.new

begin
  response = api.get_me
  puts '   [OK] Request succeeded'
  puts "   Account: #{response.user&.name} (#{response.user&.email})"
rescue SignWell::Errors::ApiConnectionError => e
  puts "   [ERROR] Connection failed after retries: #{e.message}"
rescue SignWell::Errors::ApiTimeoutError => e
  puts "   [ERROR] Timeout after retries: #{e.message}"
rescue SignWell::Errors::AuthenticationError => e
  puts "   [ERROR] Authentication failed (#{e.code}): #{e.message}"
end

sleep(1)

# --- Scenario 4: Recommended production configuration ---
puts
puts '-> Scenario 4: Recommended production configuration'
puts '   Retries 429, 500, 502, 503, 504 with exponential backoff and logging.'
puts

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
  config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')

  config.set_faraday_middleware(:request, :retry,
                                max: 3,
                                interval: 1,
                                interval_randomness: 0.5,
                                backoff_factor: 2,
                                methods: %i[get post put patch delete],
                                retry_statuses: [429, 500, 502, 503, 504],
                                exceptions: [
                                  Faraday::ConnectionFailed,
                                  Faraday::TimeoutError
                                ],
                                retry_block: lambda { |env:, retry_count:, exception:, will_retry_in:, **|
                                  reason = exception ? exception.class.name : "HTTP #{env.status}"
                                  puts "   [RETRY] ##{retry_count} #{env.method.upcase} #{env.url.path} - #{reason} (retry in #{will_retry_in.round(1)}s)"
                                })
end

api = SignWell::Resources::MeApi.new

begin
  response = api.get_me
  puts '   [OK] Request succeeded'
  puts "   Account: #{response.user&.name} (#{response.user&.email})"
rescue SignWell::Errors::RateLimitError => e
  puts "   [ERROR] Rate limit exceeded after retries (#{e.code}): #{e.message}"
rescue SignWell::Errors::InternalServerError => e
  puts "   [ERROR] Server error after retries (#{e.code}): #{e.message}"
rescue SignWell::Errors::ApiConnectionError => e
  puts "   [ERROR] Connection failed after retries: #{e.message}"
rescue SignWell::Errors::ApiTimeoutError => e
  puts "   [ERROR] Timeout after retries: #{e.message}"
rescue SignWell::Errors::AuthenticationError => e
  puts "   [ERROR] Authentication failed (#{e.code}): #{e.message}"
end

puts
puts 'Retry configuration reference:'
puts '  config.set_faraday_middleware(:request, :retry, options)'
puts
puts '  Key options:'
puts '    max:                  Maximum number of retries (default: 2)'
puts '    interval:             Pause between retries in seconds (default: 0)'
puts '    interval_randomness:  Random factor for interval jitter (0.0-1.0)'
puts '    backoff_factor:       Multiplier for interval on each retry'
puts '    methods:              HTTP methods to retry (e.g. [:get, :post])'
puts '    retry_statuses:       HTTP status codes that trigger a retry (e.g. [429, 503])'
puts '    exceptions:           Exception classes that trigger a retry'
puts '    retry_block:          Lambda called on each retry for logging/monitoring'
puts
puts '  SignWell API rate limit headers:'
puts '    X-RateLimit-Limit:     Max requests allowed per window'
puts '    X-RateLimit-Remaining: Requests remaining in current window'
puts '    X-RateLimit-Reset:     Timestamp when the window resets'
