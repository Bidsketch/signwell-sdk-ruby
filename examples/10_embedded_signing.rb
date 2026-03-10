# frozen_string_literal: true

require 'dotenv/load'
require 'signwell_sdk'

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
  config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')
end

SAMPLE_PDF_URL = 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'

puts
puts '=' * 60
puts '  10 - Embedded Signing'
puts '=' * 60
puts

document_id = nil

begin
  # --- Using the SignWell::Embedded helper ---
  puts '-> Creating document for embedded signing (helper)...'
  doc = SignWell::Embedded.create_signing_document(
    name: 'SDK Example - Embedded NDA',
    file_url: SAMPLE_PDF_URL,
    recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }],
    fields: [[{ x: 20, y: 60, page: 1, type: 'signature' }]],
    test_mode: true
  )

  document_id = doc.id
  puts '   [OK] Document created'
  puts "   ID: #{doc.id}"
  puts "   Status: #{doc.status}"
  puts "   Embedded: #{doc.embedded}"

  # Extract signing URL for the first recipient
  signing_url = SignWell::Embedded.signing_url(doc)
  puts "   Signing URL: #{signing_url}"

  # Extract all signing URLs as { email => url }
  all_urls = SignWell::Embedded.signing_urls(doc)
  puts "   All URLs: #{all_urls}"

  # The script tag for your frontend
  puts
  puts '   Include this in your HTML <head>:'
  puts "   #{SignWell::Embedded.script_tag}"
  puts
  puts '   Then open the signing iframe with:'
  puts '   <script>'
  puts "     var embed = new SignWellEmbed({ url: '#{signing_url}' });"
  puts '     embed.open();'
  puts '   </script>'

  sleep(1)

  # --- Direct approach (for comparison) ---
  puts
  puts '-> Creating document for embedded signing (direct)...'
  api = SignWell::Resources::DocumentApi.new
  request = SignWell::DocumentRequest.new(
    test_mode: true,
    name: 'SDK Example - Embedded NDA (direct)',
    embedded_signing: true,
    files: [SignWell::FilesInner.new(file_url: SAMPLE_PDF_URL, name: 'nda.pdf')],
    recipients: [SignWell::RecipientsInner.new(id: '1', name: 'Jane Doe', email: 'jane@example.com')],
    fields: [[SignWell::FieldsInnerInner.new(x: 20, y: 60, page: 1, recipient_id: '1', type: 'signature', required: true)]]
  )
  doc2 = api.create_document(request)
  puts '   [OK] Document created'
  puts "   ID: #{doc2.id}"
  puts "   Signing URL: #{doc2.recipients&.first&.signing_url}"

  sleep(1)

  # Clean up second document
  api.delete_document(doc2.id)
  puts '   [OK] Second document deleted'
ensure
  if document_id
    sleep(1)
    puts
    puts '-> Cleaning up...'
    SignWell::Resources::DocumentApi.new.delete_document(document_id)
    puts '   [OK] Document deleted'
  end
end
