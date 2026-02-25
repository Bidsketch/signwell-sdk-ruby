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
puts '  02 - Document API'
puts '=' * 60
puts

api = SignWell::Resources::DocumentApi.new
document_id = nil

begin
  # Create a document
  puts '-> Creating document with test_mode...'
  request = SignWell::DocumentRequest.new(
    # test_mode: true,
    name: 'SDK Example - NDA',
    subject: 'Please sign this NDA',
    message: 'Hi, please review and sign this document.',
    files: [
      SignWell::FilesInner.new(file_url: SAMPLE_PDF_URL, name: 'nda.pdf')
    ],
    recipients: [
      SignWell::RecipientsInner.new(
        id: '1',
        name: 'Test Signer',
        email: 'cristian.cepeda@signwell.com'
      )
    ],
    fields: [
      [
        SignWell::FieldsInnerInner.new(
          x: 20,
          y: 60,
          page: 1,
          recipient_id: '1',
          type: 'signature',
          required: true
        )
      ]
    ],
    draft: false
  )

  # Plan limit errors: the API returns 401 when you've exceeded your plan's
  # document limit. This looks like an auth error but is actually a billing issue.
  # Check the message to distinguish it from a bad API key.
  begin
    doc = api.create_document(request)
  rescue SignWell::Errors::AuthenticationError => e
    if e.message.include?('document limit')
      puts
      puts "   [ERROR] Plan document limit reached (#{e.code}): #{e.message}"
      puts '   Tip: Upgrade your plan or wait for the limit to reset.'
    else
      puts "   [ERROR] Authentication failed (#{e.code}): #{e.message}"
      raise
    end
  rescue SignWell::Errors::BadRequestError => e
    puts "   [ERROR] Bad request (#{e.code}): #{e.message}"
    raise
  rescue SignWell::Errors::UnprocessableEntityError => e
    puts "   [ERROR] Validation failed (#{e.code}): #{e.message}"
    raise
  rescue SignWell::Errors::RateLimitError => e
    puts "   [ERROR] Rate limit exceeded (#{e.code}): #{e.message}"
    raise
  end

  if doc
    document_id = doc.id
    puts '   [OK] Document created'
    puts "   ID: #{doc.id}"
    puts "   Name: #{doc.name}"
    puts "   Status: #{doc.status}"

    sleep(1)

    # Get the document
    puts '-> Getting document...'
    doc = api.get_document(document_id)
    puts '   [OK] Document retrieved'
    puts "   ID: #{doc.id}"
    puts "   Status: #{doc.status}"
    puts "   Recipients: #{doc.recipients&.map(&:name)&.join(', ')}"

    sleep(1)

    # Send reminder
    puts '-> Sending reminder...'
    reminder_request = SignWell::SendReminderRequest.new
    api.send_reminder(document_id, reminder_request)
    puts '   [OK] Reminder sent to all pending recipients'

    sleep(1)

    # Get completed PDF (will likely fail since doc isn't signed, but demonstrates usage)
    puts '-> Attempting to get completed PDF URL...'

    begin
      pdf = api.get_completed_pdf(document_id, { url_only: true })
      puts '   [OK] Got PDF response'
      puts '   PDF:'
      puts JSON.pretty_generate(pdf.to_hash).gsub(/^/, '   ')
    rescue SignWell::Errors::NotFoundError => e
      puts "   Expected: Document not yet completed (#{e.code})"
      puts "   Error class: #{e.class.name}"
      puts "   Message: #{e.message.to_s[0..150]}"
    rescue SignWell::Errors::BadRequestError => e
      puts "   [ERROR] Bad request (#{e.code}): #{e.message}"
    end
  end
ensure
  # Clean up
  if document_id
    sleep(1)
    puts '-> Deleting document...'
    api.delete_document(document_id)
    puts '   [OK] Document deleted'
  end
end
