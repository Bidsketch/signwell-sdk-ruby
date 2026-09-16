# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'generated resource helpers' do
  let(:api_client) { SignWell::ApiClient.new }

  def document_response(id, status: nil)
    SignWell::Models::DocumentResponse.new({ id: id, test_mode: true, status: status })
  end

  def document_list_response(documents:, current_page:, next_page:)
    SignWell::Models::DocumentListResponse.new(
      documents: documents,
      current_page: current_page,
      next_page: next_page,
      total_count: documents.length,
      total_pages: next_page.nil? ? current_page : next_page
    )
  end

  describe SignWell::Resources::DocumentApi do
    let(:api) { described_class.new(api_client) }

    it 'serializes raw list query filters' do
      expect(api_client).to receive(:call_api) do |http_method, path, options|
        expect(http_method).to eq(:GET)
        expect(path).to eq('/api/v1/documents')
        expect(options[:query_params]).to include(
          page: 2,
          limit: 25,
          query: 'name:Classic AND status:completed'
        )
        [document_list_response(documents: [], current_page: 2, next_page: nil), 200, {}]
      end

      api.list_documents(page: 2, limit: 25, query: 'name:Classic AND status:completed')
    end

    it 'iterates document pages and document items until next_page is nil' do
      page_one = document_list_response(documents: [document_response('doc_1')], current_page: 1, next_page: 2)
      page_two = document_list_response(documents: [document_response('doc_2')], current_page: 2, next_page: nil)
      allow(api_client).to receive(:call_api).and_return(
        [page_one, 200, {}],
        [page_two, 200, {}],
        [page_one, 200, {}],
        [page_two, 200, {}]
      )

      expect(api.iterate_document_pages(query: 'status:Completed').map(&:current_page)).to eq([1, 2])
      expect(api.iterate_documents(query: 'status:Completed').map(&:id)).to eq(%w[doc_1 doc_2])
    end

    it 'aliases update_document to the send_document operation' do
      request = SignWell::Models::UpdateDocumentAndSendRequest.new(subject: 'Updated')
      expect(api_client).to receive(:call_api) do |http_method, path, options|
        expect(http_method).to eq(:POST)
        expect(path).to eq('/api/v1/documents/doc_123/send')
        expect(options[:operation]).to eq(:"DocumentApi.send_document")
        [document_response('doc_123'), 200, {}]
      end

      expect(api.update_document('doc_123', request).id).to eq('doc_123')
    end

    it 'waits for document completion with bounded polling' do
      allow(api_client).to receive(:call_api).and_return(
        [document_response('doc_123', status: 'In Progress'), 200, {}],
        [document_response('doc_123', status: 'Completed'), 200, {}]
      )

      result = api.wait_for_completion('doc_123', interval: 0, max_attempts: 3)

      expect(result.status).to eq('Completed')
    end

    it 'raises a wait timeout error with the last document' do
      allow(api_client).to receive(:call_api).and_return(
        [document_response('doc_123', status: 'In Progress'), 200, {}]
      )

      expect do
        api.wait_for_completion('doc_123', interval: 0, max_attempts: 1)
      end.to raise_error(SignWell::Errors::WaitForCompletionTimeoutError) { |error|
        expect(error.last_document.id).to eq('doc_123')
      }
    end
  end

  describe SignWell::Resources::TemplateApi do
    let(:api) { described_class.new(api_client) }

    it 'serializes raw list query filters and iterates template items' do
      page_one = SignWell::Models::DocumentTemplateListResponse.new(
        templates: [SignWell::Models::DocumentTemplateResponse.new(id: 'tpl_1')],
        current_page: 1,
        next_page: 2,
        total_count: 2,
        total_pages: 2
      )
      page_two = SignWell::Models::DocumentTemplateListResponse.new(
        templates: [SignWell::Models::DocumentTemplateResponse.new(id: 'tpl_2')],
        current_page: 2,
        next_page: nil,
        total_count: 2,
        total_pages: 2
      )
      seen_queries = []
      allow(api_client).to receive(:call_api) do |_http_method, path, options|
        expect(path).to eq('/api/v1/document_templates')
        seen_queries << options[:query_params]
        seen_queries.length.odd? ? [page_one, 200, {}] : [page_two, 200, {}]
      end

      expect(api.iterate_templates(query: 'name:NDA AND archived:false').map(&:id)).to eq(%w[tpl_1 tpl_2])
      expect(seen_queries).to all(include(query: 'name:NDA AND archived:false'))
    end
  end
end
