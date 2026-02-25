# frozen_string_literal: true

require 'dotenv/load'
require 'signwell_sdk'
require 'json'

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
  config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')
end

SAMPLE_PDF_URL = 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'

puts
puts '=' * 60
puts '  03 - Template API'
puts '=' * 60
puts

api = SignWell::Resources::TemplateApi.new
template_id = nil

begin
  # Create a template
  puts '-> Creating template...'
  request = SignWell::DocumentTemplateRequest.new(
    name: 'SDK Example - Contract Template',
    subject: 'Please sign this contract',
    message: 'Hi, please review and sign.',
    files: [
      SignWell::FilesInner.new(file_url: SAMPLE_PDF_URL, name: 'contract.pdf')
    ],
    placeholders: [
      SignWell::PlaceholdersInner.new(id: '1', name: 'Client')
    ],
    fields: [
      [
        SignWell::TemplateFieldsInnerInner.new(
          x: 20,
          y: 60,
          page: 1,
          placeholder_id: '1',
          type: 'signature',
          required: true
        )
      ]
    ],
    draft: false
  )
  template = api.create_template(request)
  template_id = template.id
  puts '   [OK] Template created'
  puts "   ID: #{template.id}"
  puts "   Name: #{template.name}"

  sleep(1)

  # Get the template
  puts '-> Getting template...'
  template = api.get_template(template_id)
  puts '   [OK] Template retrieved'
  puts "   ID: #{template.id}"
  puts "   Name: #{template.name}"
  puts "   Placeholders: #{template.placeholders&.map(&:name)&.join(', ')}"

  sleep(1)

  # Update the template
  puts '-> Updating template name and subject...'
  update_request = SignWell::DocumentTemplateUpdateRequest.new(
    name: 'SDK Example - Updated Contract',
    subject: 'Updated: Please sign this contract'
  )
  template = api.update_template(template_id, update_request)
  puts '   [OK] Template updated'
  puts "   New Name: #{template.name}"
  puts "   New Subject: #{template.subject}"
rescue SignWell::Errors::AuthenticationError => e
  puts "   [ERROR] Authentication failed (#{e.code}): #{e.message}"
rescue SignWell::Errors::NotFoundError => e
  puts "   [ERROR] Not found (#{e.code}): #{e.message}"
rescue SignWell::Errors::BadRequestError => e
  puts "   [ERROR] Bad request (#{e.code}): #{e.message}"
rescue SignWell::Errors::UnprocessableEntityError => e
  puts "   [ERROR] Validation failed (#{e.code}): #{e.message}"
rescue SignWell::Errors::RateLimitError => e
  puts "   [ERROR] Rate limit exceeded (#{e.code}): #{e.message}"
rescue SignWell::Errors::InternalServerError => e
  puts "   [ERROR] Server error (#{e.code}): #{e.message}"
ensure
  # Clean up
  if template_id
    sleep(1)
    puts '-> Deleting template...'
    api.delete_template(template_id)
    puts '   [OK] Template deleted'
  end
end
