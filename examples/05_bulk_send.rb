# frozen_string_literal: true

require 'dotenv/load'
require 'signwell_sdk'
require 'json'
require 'base64'

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
  config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')
end

SAMPLE_PDF_URL = 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'

puts
puts '=' * 60
puts '  05 - Bulk Send API'
puts '=' * 60
puts

template_api = SignWell::Resources::TemplateApi.new
bulk_api = SignWell::Resources::BulkSendApi.new
template_id = nil

begin
  # Create a template for bulk send
  puts '-> Creating template for bulk send...'
  template_request = SignWell::DocumentTemplateRequest.new(
    name: 'SDK Example - Bulk Send Template',
    files: [
      SignWell::FilesInner.new(file_url: SAMPLE_PDF_URL, name: 'bulk.pdf')
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

  # Get bulk send CSV template (as base64 to avoid binary stream issues)
  puts '-> Getting CSV template...'
  data, = bulk_api.get_bulk_send_csv_template_with_http_info(
    [template_id], { base64: true, debug_return_type: 'Object' }
  )
  csv_content = Base64.decode64(data[:data])
  puts '   [OK] CSV template retrieved'
  puts "   CSV headers: #{csv_content.strip}"

  sleep(1)

  # Build a CSV with test data using the headers from the template
  # Headers are in the order returned by the API (e.g. signer_email,signer_name)
  headers = csv_content.strip.split("\n").first
  puts "   Headers: #{headers}"
  cols = headers.split(',').map(&:strip)
  rows = [
    { 'signer_email' => 'alice@example.com', 'signer_name' => 'Alice Test' },
    { 'signer_email' => 'bob@example.com', 'signer_name' => 'Bob Test' }
  ]
  csv_lines = [headers] + rows.map { |row| cols.map { |c| row[c] || '' }.join(',') }
  test_csv = "#{csv_lines.join("\n")}\n"
  csv_base64 = Base64.strict_encode64(test_csv)

  # Validate the CSV
  puts '-> Validating CSV...'
  validate_request = SignWell::BulkSendCsvRequest.new(
    template_ids: [template_id],
    bulk_send_csv: csv_base64
  )
  validation = bulk_api.validate_bulk_send_csv(validate_request)
  puts '   [OK] CSV validated'
  puts '   Validation result:'
  puts JSON.pretty_generate(validation.to_hash).gsub(/^/, '   ')

  sleep(1)

  # Create bulk send
  puts '-> Creating bulk send...'
  bulk_request = SignWell::CreateBulkSendRequest.new(
    template_ids: [template_id],
    bulk_send_csv: csv_base64,
    name: 'SDK Example - Bulk Send',
    subject: 'Please sign this document',
    message: 'Bulk send test from SDK examples.'
  )
  bulk_response = bulk_api.create_bulk_send(bulk_request)
  puts '   [OK] Bulk send created'
  puts '   Bulk send:'
  puts JSON.pretty_generate(bulk_response.to_hash).gsub(/^/, '   ')

  bulk_send_id = bulk_response&.id

  sleep(1)

  # List bulk sends
  puts '-> Listing bulk sends...'
  list = bulk_api.list_bulk_sends({ limit: 5 })
  puts '   [OK] Bulk sends listed'
  puts '   Bulk sends:'
  puts JSON.pretty_generate(list.to_hash).gsub(/^/, '   ')

  # Try to get a specific bulk send if we have an ID
  if bulk_send_id
    sleep(1)
    puts '-> Getting bulk send details...'
    details = bulk_api.get_bulk_send(bulk_send_id)
    puts '   [OK] Bulk send details retrieved'
    puts '   Details:'
    puts JSON.pretty_generate(details.to_hash).gsub(/^/, '   ')

    sleep(1)
    puts '-> Getting bulk send documents...'
    docs = bulk_api.get_bulk_send_documents(bulk_send_id)
    puts '   [OK] Bulk send documents retrieved'
    puts '   Documents:'
    puts JSON.pretty_generate(docs.to_hash).gsub(/^/, '   ')
  end
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
  if template_id
    sleep(1)
    puts '-> Deleting template...'
    template_api.delete_template(template_id)
    puts '   [OK] Template deleted'
  end
end
