# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SignWell::Resources::BulkSendApi do
  let(:api_client) { SignWell::ApiClient.new }
  let(:api) { described_class.new(api_client) }
  let(:template_ids) { ['00000000-0000-0000-0000-000000000000'] }

  describe '#get_bulk_send_csv_template' do
    it 'requests json and returns a model when base64 mode is requested' do
      model = SignWell::Models::BulkSendCsvTemplateResponse.new(data: 'ZGF0YQ==')
      expect(api_client).to receive(:call_api) do |http_method, path, options|
        expect(http_method).to eq(:GET)
        expect(path).to eq('/api/v1/bulk_sends/csv_template')
        expect(options[:header_params]['Accept']).to eq('application/json')
        expect(options[:query_params][:'template_ids[]']).to eq(template_ids)
        expect(options[:query_params][:base64]).to eq(true)
        expect(options[:return_type]).to eq('BulkSendCsvTemplateResponse')
        [model, 200, { 'Content-Type' => 'application/json' }]
      end

      result = api.get_bulk_send_csv_template(template_ids, base64: true)

      expect(result).to eq(model)
    end

    it 'requests binary and returns a file when base64 mode is not requested' do
      file = Tempfile.new('bulk-send-csv')
      expect(api_client).to receive(:call_api) do |http_method, path, options|
        expect(http_method).to eq(:GET)
        expect(path).to eq('/api/v1/bulk_sends/csv_template')
        expect(options[:header_params]['Accept']).to eq('application/octet-stream')
        expect(options[:query_params][:'template_ids[]']).to eq(template_ids)
        expect(options[:query_params]).not_to have_key(:base64)
        expect(options[:return_type]).to eq('File')
        [file, 200, { 'Content-Type' => 'application/octet-stream' }]
      end

      result = api.get_bulk_send_csv_template(template_ids)

      expect(result).to eq(file)
    ensure
      result&.close!
    end
  end
end
