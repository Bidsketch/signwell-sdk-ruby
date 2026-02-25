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
puts '  01 - Me API'
puts '=' * 60
puts

api = SignWell::Resources::MeApi.new

puts '-> Getting account info...'
begin
  response = api.get_me
  puts '   [OK] Retrieved account info'
  puts '   Account:'
  puts JSON.pretty_generate(response.to_hash).gsub(/^/, '   ')
rescue SignWell::Errors::AuthenticationError => e
  puts "   [ERROR] Authentication failed (#{e.code}): #{e.message}"
rescue SignWell::Errors::RateLimitError => e
  puts "   [ERROR] Rate limit exceeded (#{e.code}): #{e.message}"
rescue SignWell::Errors::InternalServerError => e
  puts "   [ERROR] Server error (#{e.code}): #{e.message}"
end
