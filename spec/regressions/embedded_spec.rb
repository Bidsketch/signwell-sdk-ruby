# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SignWell::Embedded do
  def stub_document_api
    api = instance_double(SignWell::Resources::DocumentApi)
    allow(SignWell::Resources::DocumentApi).to receive(:new).and_return(api)
    api
  end

  describe '.build_recipients' do
    it 'works in plain Ruby without ActiveSupport helpers' do
      recipients = described_class.send(
        :build_recipients,
        [{ name: 'Jane Doe', email: 'jane@example.com', passcode: '1234' }]
      )

      expect(recipients.first.passcode).to eq('1234')
    end

    it 'normalizes blank passcodes to nil' do
      recipients = described_class.send(
        :build_recipients,
        [{ name: 'Jane Doe', email: 'jane@example.com', passcode: '   ' }]
      )

      expect(recipients.first.passcode).to be_nil
    end
  end

  describe '.build_template_recipients' do
    it 'auto-assigns recipient ids when omitted' do
      recipients = described_class.send(
        :build_template_recipients,
        [
          { placeholder_name: 'Client', name: 'Jane Doe', email: 'jane@example.com' },
          { placeholder_name: 'Manager', name: 'John Doe', email: 'john@example.com' }
        ]
      )

      expect(recipients.map(&:id)).to eq(%w[1 2])
    end

    it 'preserves explicit recipient ids' do
      recipients = described_class.send(
        :build_template_recipients,
        [{ id: 'signer-a', placeholder_name: 'Client', name: 'Jane Doe', email: 'jane@example.com' }]
      )

      expect(recipients.first.id).to eq('signer-a')
    end

    it 'normalizes blank passcodes to nil without ActiveSupport helpers' do
      recipients = described_class.send(
        :build_template_recipients,
        [{ placeholder_name: 'Client', name: 'Jane Doe', email: 'jane@example.com', passcode: nil }]
      )

      expect(recipients.first.passcode).to be_nil
    end
  end

  describe '.create_signing_document_from_template' do
    it 'builds valid template recipients without requiring Rails helpers' do
      api = instance_double(SignWell::Resources::DocumentApi)
      allow(SignWell::Resources::DocumentApi).to receive(:new).and_return(api)
      allow(api).to receive(:create_document_from_template) { |request| request }

      request = described_class.create_signing_document_from_template(
        template_id: 'template_123',
        recipients: [
          {
            placeholder_name: 'Signer 1',
            name: 'Jane Doe',
            email: 'jane@example.com',
            passcode: '   '
          }
        ]
      )

      expect(request.recipients.first.id).to eq('1')
      expect(request.recipients.first.passcode).to be_nil
    end
  end

  describe '.create_signing_document' do
    it 'creates an embedded signing document request with defaults' do
      api = stub_document_api
      captured_request = nil
      allow(api).to receive(:create_document) { |request| captured_request = request }

      described_class.create_signing_document(
        name: 'NDA',
        files: [{ name: 'nda.pdf', file_url: 'https://example.com/nda.pdf' }],
        recipients: [{ name: 'Jane Doe', email: 'jane@example.com', passcode: '   ' }],
        fields: [[{ x: 20, y: 60, page: 1, type: 'signature', label: 'Sign here' }]]
      )

      expect(captured_request.embedded_signing).to eq(true)
      expect(captured_request.embedded_signing_notifications).to eq(false)
      expect(captured_request.recipients.first.id).to eq('1')
      expect(captured_request.recipients.first.passcode).to be_nil
      expect(captured_request.fields.first.first.recipient_id).to eq('1')
      expect(captured_request.fields.first.first.required).to eq(true)
      expect(captured_request.fields.first.first.label).to eq('Sign here')
    end

    it 'allows embedded signing with a signature page instead of explicit fields' do
      api = stub_document_api
      captured_request = nil
      allow(api).to receive(:create_document) { |request| captured_request = request }

      described_class.create_signing_document(
        name: 'NDA',
        files: [{ name: 'nda.pdf', file_url: 'https://example.com/nda.pdf' }],
        recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }],
        with_signature_page: true
      )

      expect(captured_request.with_signature_page).to eq(true)
    end

    it 'allows embedded signing with text tags instead of explicit fields' do
      api = stub_document_api
      captured_request = nil
      allow(api).to receive(:create_document) { |request| captured_request = request }

      described_class.create_signing_document(
        name: 'NDA',
        files: [{ name: 'nda.pdf', file_base64: 'ZGF0YQ==' }],
        recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }],
        text_tags: true
      )

      expect(captured_request.text_tags).to eq(true)
    end

    it 'rejects embedded signing without fields, text tags, or a signature page' do
      api = stub_document_api
      allow(api).to receive(:create_document)

      expect do
        described_class.create_signing_document(
          name: 'NDA',
          files: [{ name: 'nda.pdf', file_url: 'https://example.com/nda.pdf' }],
          recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }]
        )
      end.to raise_error(ArgumentError, /fields for every recipient/)
      expect(api).not_to have_received(:create_document)
    end

    it 'accepts numeric recipient ids in field assignments' do
      api = stub_document_api
      captured_request = nil
      allow(api).to receive(:create_document) { |request| captured_request = request }

      described_class.create_signing_document(
        name: 'NDA',
        files: [{ name: 'nda.pdf', file_url: 'https://example.com/nda.pdf' }],
        recipients: [{ id: 1, name: 'Jane Doe', email: 'jane@example.com' }],
        fields: [[{ x: 20, y: 60, page: 1, type: 'signature', recipient_id: 1 }]]
      )

      expect(captured_request.recipients.first.id).to eq('1')
      expect(captured_request.fields.first.first.recipient_id).to eq(1)
    end

    it 'rejects embedded signing when a recipient has no field assignment' do
      api = stub_document_api
      allow(api).to receive(:create_document)

      expect do
        described_class.create_signing_document(
          name: 'NDA',
          files: [{ name: 'nda.pdf', file_url: 'https://example.com/nda.pdf' }],
          recipients: [
            { id: '1', name: 'Jane Doe', email: 'jane@example.com' },
            { id: '2', name: 'John Doe', email: 'john@example.com' }
          ],
          fields: [[{ x: 20, y: 60, page: 1, type: 'signature', recipient_id: '1' }]]
        )
      end.to raise_error(ArgumentError, /fields for every recipient/)
      expect(api).not_to have_received(:create_document)
    end

    it 'requires exactly one file source per file' do
      expect do
        described_class.send(
          :build_files,
          [{ name: 'nda.pdf', file_url: 'https://example.com/nda.pdf', file_base64: 'ZGF0YQ==' }]
        )
      end.to raise_error(ArgumentError, /exactly one/)

      expect do
        described_class.send(:build_files, [{ name: 'nda.pdf' }])
      end.to raise_error(ArgumentError, /exactly one/)
    end

    it 'normalizes checkbox field values to API wire values during serialization' do
      true_checkbox = SignWell::Models::FieldsInnerInner.new(
        x: 20,
        y: 60,
        page: 1,
        recipient_id: '1',
        type: SignWell::Models::FieldType::CHECKBOX,
        value: true
      )
      false_checkbox = SignWell::Models::FieldsInnerInner.new(
        x: 20,
        y: 60,
        page: 1,
        recipient_id: '1',
        type: SignWell::Models::FieldType::CHECKBOX,
        value: 'false'
      )
      text_field = SignWell::Models::FieldsInnerInner.new(
        x: 20,
        y: 60,
        page: 1,
        recipient_id: '1',
        type: SignWell::Models::FieldType::TEXT,
        value: 'true'
      )

      expect(true_checkbox.to_hash[:value]).to eq('t')
      expect(false_checkbox.to_hash[:value]).to eq('f')
      expect(text_field.to_hash[:value]).to eq('true')

      {
        true => 't',
        false => 'f',
        'true' => 't',
        't' => 't',
        'false' => 'f',
        'f' => 'f'
      }.each do |raw_value, expected_value|
        field = SignWell::Models::FieldsInnerInner.new(
          x: 20,
          y: 60,
          page: 1,
          recipient_id: '1',
          type: SignWell::Models::FieldType::CHECKBOX,
          value: raw_value
        )
        expect(field.to_hash[:value]).to eq(expected_value)
      end

      %w[yes no 1 0].each do |raw_value|
        field = SignWell::Models::FieldsInnerInner.new(
          x: 20,
          y: 60,
          page: 1,
          recipient_id: '1',
          type: SignWell::Models::FieldType::CHECKBOX,
          value: raw_value
        )

        expect { field.to_hash }.to raise_error(ArgumentError, /Checkbox field values/)
      end
    end
  end
end
