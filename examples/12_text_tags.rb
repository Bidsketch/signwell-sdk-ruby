# frozen_string_literal: true

# Text Tags let you embed field markers directly in your PDF content
# (e.g. {{signature}}, {{date:1:y}}) and the API places signing fields
# automatically. This avoids manually specifying x/y coordinates.
#
# Tag format: {{type:signer:required:label:prefill:api_id:width:height:extra...}}
#
# Common tags:
#   {{signature}}            - Signature for signer 1
#   {{signature:2}}          - Signature for signer 2
#   {{initial:1:y}}          - Required initials for signer 1
#   {{date:1:y::::::::y:mm/dd/yyyy}} - Locked date with format
#   {{text:1:y:Company}}     - Required text field with label
#   {{check:1:n}}            - Optional checkbox
#   {{af_n}}                 - Auto-fill full name
#   {{af_e}}                 - Auto-fill email
#   {{af_d_s}}               - Auto-fill date signed
#
# The signer number in tags maps to the position in the recipients array:
#   Signer 1 = recipients[0], Signer 2 = recipients[1], etc.
#
# Tip: Set the tag text color to match the PDF background (e.g. white on white)
# so tags are invisible to signers. The API detects them regardless of color.

require 'dotenv/load'
require 'signwell_sdk'
require 'base64'

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV.fetch('SIGNWELL_API_KEY')
  config.host = ENV.fetch('SIGNWELL_HOST', 'www.signwell.com')
end

SAMPLE_PDF = File.join(__dir__, 'Text-Tags-Basic-Demo.pdf')

puts
puts '=' * 60
puts '  12 - Text Tags'
puts '=' * 60
puts

unless File.exist?(SAMPLE_PDF)
  warn "   [ERROR] PDF not found: #{SAMPLE_PDF}"
  warn '   Place a PDF with text tags (e.g. {{signature}}, {{signature:2}}) in the examples/ directory.'
  exit 1
end

pdf_base64 = Base64.strict_encode64(File.binread(SAMPLE_PDF))

document_id = nil

begin
  # --- Using the SignWell::Embedded helper with text_tags ---
  # The text_tags option is passed through **opts to the DocumentRequest model.
  # No fields array needed - the API reads the tags from the PDF.
  puts '-> Creating embedded document with text tags (helper)...'
  doc = SignWell::Embedded.create_signing_document(
    name: 'SDK Example - Text Tags Contract',
    files: [{ name: 'Text-Tags-Basic-Demo.pdf', file_base64: pdf_base64 }],
    recipients: [
      { name: 'Alice Smith', email: 'alice@example.com' },
      { name: 'Bob Jones', email: 'bob@example.com' }
    ],
    text_tags: true,
    test_mode: true
  )

  document_id = doc.id
  puts '   [OK] Document created with text tags'
  puts "   ID: #{doc.id}"
  puts "   Status: #{doc.status}"

  # Each recipient gets their own embedded signing URL
  doc.recipients&.each_with_index do |r, i|
    puts "   Signer #{i + 1} (#{r.name}): #{r.embedded_signing_url}"
  end

  # Helper methods work the same as regular embedded signing
  url_signer_1 = SignWell::Embedded.embedded_signing_url(doc, recipient_index: 0)
  url_signer_2 = SignWell::Embedded.embedded_signing_url(doc, recipient_index: 1)
  puts
  puts "   Signer 1 URL: #{url_signer_1}"
  puts "   Signer 2 URL: #{url_signer_2}"

  all_urls = SignWell::Embedded.embedded_signing_urls(doc)
  puts "   All URLs: #{all_urls}"

  sleep(1)

  # --- Direct approach (for comparison) ---
  puts
  puts '-> Creating document with text tags (direct)...'
  api = SignWell::Resources::DocumentApi.new
  request = SignWell::DocumentRequest.new(
    test_mode: true,
    name: 'SDK Example - Text Tags (direct)',
    text_tags: true,
    embedded_signing: true,
    files: [SignWell::FilesInner.new(file_base64: pdf_base64, name: 'Text-Tags-Basic-Demo.pdf')],
    recipients: [
      SignWell::RecipientsInner.new(id: '1', name: 'Alice Smith', email: 'alice@example.com'),
      SignWell::RecipientsInner.new(id: '2', name: 'Bob Jones', email: 'bob@example.com')
    ]
  )
  doc3 = api.create_document(request)
  puts '   [OK] Document created'
  puts "   ID: #{doc3.id}"
  puts "   Signer 1 URL: #{doc3.recipients&.first&.embedded_signing_url}"
  puts "   Signer 2 URL: #{doc3.recipients&.last&.embedded_signing_url}"

  sleep(1)

  api.delete_document(doc3.id)
  puts '   [OK] Direct document deleted'
ensure
  if document_id
    sleep(1)
    puts
    puts '-> Cleaning up...'
    SignWell::Resources::DocumentApi.new.delete_document(document_id)
    puts '   [OK] Document deleted'
  end
end
