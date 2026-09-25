# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'generated binary/json response modes' do
  let(:api_client) { SignWell::ApiClient.new }

  describe SignWell::Resources::DocumentApi do
    let(:api) { described_class.new(api_client) }

    it 'requests binary completed PDFs by default' do
      file = Tempfile.new('completed-pdf')
      expect(api_client).to receive(:call_api) do |http_method, path, options|
        expect(http_method).to eq(:GET)
        expect(path).to eq('/api/v1/documents/doc_123/completed_pdf')
        expect(options[:header_params]['Accept']).to eq('application/octet-stream')
        expect(options[:return_type]).to eq('File')
        [file, 200, { 'Content-Type' => 'application/octet-stream' }]
      end

      result = api.get_completed_pdf('doc_123')

      expect(result).to eq(file)
    ensure
      result&.close!
    end

    it 'requests JSON completed PDF URLs when url_only is true' do
      model = SignWell::Models::CompletedPdfUrlResponse.new(file_url: 'https://example.com/signed.pdf')
      expect(api_client).to receive(:call_api) do |_http_method, _path, options|
        expect(options[:header_params]['Accept']).to eq('application/json')
        expect(options[:query_params][:url_only]).to eq(true)
        expect(options[:return_type]).to eq('CompletedPdfUrlResponse')
        [model, 200, { 'Content-Type' => 'application/json' }]
      end

      expect(api.get_completed_pdf('doc_123', url_only: true)).to eq(model)
    end
  end

  describe SignWell::Resources::RegionalApi do
    let(:api) { described_class.new(api_client) }

    it 'requests binary NOM-151 certificates by default' do
      file = Tempfile.new('nom151')
      expect(api_client).to receive(:call_api) do |http_method, path, options|
        expect(http_method).to eq(:GET)
        expect(path).to eq('/api/v1/documents/doc_123/nom151_certificate')
        expect(options[:header_params]['Accept']).to eq('application/octet-stream')
        expect(options[:return_type]).to eq('File')
        [file, 200, { 'Content-Type' => 'application/octet-stream' }]
      end

      result = api.get_nom151_certificate('doc_123')

      expect(result).to eq(file)
    ensure
      result&.close!
    end

    it 'requests JSON NOM-151 URLs when url_only is true' do
      model = SignWell::Models::Nom151UrlResponse.new(file_url: 'https://example.com/nom151.zip')
      expect(api_client).to receive(:call_api) do |_http_method, _path, options|
        expect(options[:header_params]['Accept']).to eq('application/json')
        expect(options[:query_params][:url_only]).to eq(true)
        expect(options[:return_type]).to eq('Nom151UrlResponse')
        [model, 200, { 'Content-Type' => 'application/json' }]
      end

      expect(api.get_nom151_certificate('doc_123', url_only: true)).to eq(model)
    end

    it 'requests JSON NOM-151 objects when object_only is true' do
      model = SignWell::Models::Nom151CertificateResponse.new(nom151: {})
      expect(api_client).to receive(:call_api) do |_http_method, _path, options|
        expect(options[:header_params]['Accept']).to eq('application/json')
        expect(options[:query_params][:object_only]).to eq(true)
        expect(options[:return_type]).to eq('Nom151CertificateResponse')
        [model, 200, { 'Content-Type' => 'application/json' }]
      end

      expect(api.get_nom151_certificate('doc_123', object_only: true)).to eq(model)
    end

    it 'rejects conflicting NOM-151 response modes' do
      expect(api_client).not_to receive(:call_api)

      expect do
        api.get_nom151_certificate('doc_123', url_only: true, object_only: true)
      end.to raise_error(ArgumentError, /url_only and object_only/)
    end
  end
end
