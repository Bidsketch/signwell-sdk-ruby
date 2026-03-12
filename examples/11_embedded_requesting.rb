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
puts '  11 - Embedded Requesting (Field Placement)'
puts '=' * 60
puts

document_id = nil

begin
  # --- Using the SignWell::Embedded helper ---
  puts '-> Creating draft document for embedded requesting (helper)...'
  doc = SignWell::Embedded.create_requesting_document(
    name: 'SDK Example - Embedded Contract',
    files: [{ name: 'contract.pdf', file_url: SAMPLE_PDF_URL }],
    recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }],
    test_mode: true
  )

  document_id = doc.id
  puts '   [OK] Draft document created'
  puts "   ID: #{doc.id}"
  puts "   Status: #{doc.status}"
  puts "   Edit URL: #{doc.embedded_edit_url}"

  # The edit URL opens the field placement editor in an iframe
  puts
  puts '   Open the field editor in your frontend:'
  puts '   <script>'
  puts "     var embed = new SignWellEmbed({ url: '#{doc.embedded_edit_url}' });"
  puts '     embed.open();'
  puts '   </script>'

  sleep(1)

  # --- Direct approach (for comparison) ---
  puts
  puts '-> Creating draft document for embedded requesting (direct)...'
  api = SignWell::Resources::DocumentApi.new
  request = SignWell::DocumentRequest.new(
    test_mode: true,
    name: 'SDK Example - Embedded Contract (direct)',
    draft: true,
    files: [SignWell::FilesInner.new(file_url: SAMPLE_PDF_URL, name: 'contract.pdf')],
    recipients: [SignWell::RecipientsInner.new(id: '1', name: 'Jane Doe', email: 'jane@example.com')]
  )
  doc2 = api.create_document(request)
  puts '   [OK] Draft document created'
  puts "   ID: #{doc2.id}"
  puts "   Edit URL: #{doc2.embedded_edit_url}"

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
