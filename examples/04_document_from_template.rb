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
puts '  04 - Document from Template'
puts '=' * 60
puts

template_api = SignWell::Resources::TemplateApi.new
document_api = SignWell::Resources::DocumentApi.new
template_id = nil
document_id = nil

begin
  # First, create a template to work with
  puts '-> Creating template...'
  template_request = SignWell::DocumentTemplateRequest.new(
    name: 'SDK Example - Template for Doc Creation',
    files: [
      SignWell::FilesInner.new(file_url: SAMPLE_PDF_URL, name: 'template.pdf')
    ],
    placeholders: [
      SignWell::PlaceholdersInner.new(id: '1', name: 'Signer')
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
  template = template_api.create_template(template_request)
  template_id = template.id
  puts '   [OK] Template created'
  puts "   Template ID: #{template_id}"

  sleep(2)

  # Create a document from the template
  puts '-> Creating document from template...'
  doc_request = SignWell::DocumentFromTemplateRequest.new(
    test_mode: true,
    template_id: template_id,
    name: 'SDK Example - Contract for Acme Corp',
    recipients: [
      SignWell::TemplateRecipientsInner.new(
        id: '1',
        name: 'Jane Smith',
        email: 'jane@example.com',
        placeholder_name: 'Signer'
      )
    ]
  )
  doc = document_api.create_document_from_template(doc_request)
  document_id = doc.id
  puts '   [OK] Document created from template'
  puts "   Document ID: #{doc.id}"
  puts "   Name: #{doc.name}"
  puts "   Status: #{doc.status}"

  sleep(1)

  # Get the document to verify
  puts '-> Getting document to verify...'
  doc = document_api.get_document(document_id)
  puts '   [OK] Document verified'
  puts "   ID: #{doc.id}"
  puts "   Recipients: #{doc.recipients&.map { |r| "#{r.name} <#{r.email}>" }&.join(', ')}"
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
  if document_id
    sleep(1)
    puts '-> Deleting document...'
    document_api.delete_document(document_id)
    puts '   [OK] Document deleted'
  end

  if template_id
    sleep(1)
    puts '-> Deleting template...'
    template_api.delete_template(template_id)
    puts '   [OK] Template deleted'
  end
end
