# frozen_string_literal: true

require 'faraday'
require 'spec_helper'

RSpec.describe SignWell::ApiClient do
  let(:client) { described_class.new }

  describe '#normalize_content_type' do
    it 'returns nil for missing or blank content types' do
      expect(client.send(:normalize_content_type, nil)).to be_nil
      expect(client.send(:normalize_content_type, '')).to be_nil
      expect(client.send(:normalize_content_type, '   ')).to be_nil
    end
  end

  describe '#normalize_query_params' do
    it 'preserves bracketed multi params without producing double brackets' do
      normalized = client.send(:normalize_query_params, { :'template_ids[]' => ['00000000-0000-0000-0000-000000000000'] })
      url = Faraday.new(url: 'http://example.test').build_url('/bulk_sends/csv_template', normalized)

      expect(url.to_s).to include('template_ids%5B%5D=00000000-0000-0000-0000-000000000000')
      expect(url.to_s).not_to include('template_ids%5B%5D%5B%5D')
    end
  end

  describe '#deserialize' do
    it 'falls back to json when the response omits content type' do
      response = Struct.new(:body, :headers).new('{"ok":true}', {})

      expect(client.deserialize(response, 'Object')).to eq(ok: true)
    end

    it 'raises a typed SDK error for unsupported content types' do
      response = Struct.new(:body, :headers).new('plain text', { 'Content-Type' => 'text/plain' })

      expect do
        client.deserialize(response, 'DocumentResponse')
      end.to raise_error(SignWell::Errors::UnsupportedContentTypeError, /text\/plain/)
    end
  end

  describe '#resolve_return_type' do
    it 'dispatches mixed responses by response content type' do
      response = Struct.new(:headers).new({ 'Content-Type' => 'application/json; charset=utf-8' })

      return_type = client.resolve_return_type(
        response,
        'application/json' => 'BulkSendCsvTemplateResponse',
        'application/octet-stream' => 'File',
        'default' => 'File'
      )

      expect(return_type).to eq('BulkSendCsvTemplateResponse')
    end
  end

  describe '#call_api' do
    it 'preserves Faraday connection failure context' do
      allow(client).to receive(:connection).and_raise(Faraday::ConnectionFailed.new('dns lookup failed'))

      error = nil
      begin
        client.call_api(:GET, '/test', header_params: {}, query_params: {}, auth_names: [], operation: 'Test.operation')
      rescue SignWell::Errors::ApiConnectionError => e
        error = e
      end

      expect(error).not_to be_nil
      expect(error.message).to include('dns lookup failed')
      expect(error.cause).to be_a(Faraday::ConnectionFailed)
    end

    it 'streams conditional file responses when the default return type is a file' do
      return_type = {
        'application/json' => 'BulkSendCsvTemplateResponse',
        'application/octet-stream' => 'File',
        'default' => 'File'
      }
      response = instance_double(
        Faraday::Response,
        success?: true,
        body: String.new.b,
        headers: { 'Content-Type' => 'application/octet-stream' },
        status: 200
      )
      connection = double('connection')

      allow(client).to receive(:connection).and_return(connection)
      allow(client).to receive(:build_request) { |_http_method, _path, request, _opts| request }
      allow(connection).to receive(:public_send) do |_method, &block|
        request = Struct.new(:options, :headers, :body).new(
          Struct.new(:on_data, :params_encoder, :timeout).new,
          {},
          nil
        )
        block.call(request)
        response
      end
      expect(client).to receive(:download_file).and_return(:stream)
      expect(client).to receive(:deserialize_file).with(response, :stream).and_return(:file)

      data, status, headers = client.call_api(
        :GET,
        '/test',
        header_params: {},
        query_params: {},
        auth_names: [],
        return_type: return_type,
        operation: 'BulkSendApi.get_bulk_send_csv_template'
      )

      expect(data).to eq(:file)
      expect(status).to eq(200)
      expect(headers).to eq('Content-Type' => 'application/octet-stream')
    end
  end

  describe 'default headers' do
    it 'sends the SignWell default user agent' do
      expect(client.default_headers['User-Agent']).to eq("signwell-sdk-ruby/#{SignWell::VERSION}")
    end

    it 'lets a caller-supplied user agent replace the default' do
      client.user_agent = 'MyApp/1.0'

      expect(client.default_headers['User-Agent']).to eq('MyApp/1.0')
    end
  end

  describe 'error compatibility and metadata' do
    it 'keeps additive error aliases mapped to existing classes' do
      expect(SignWell::Errors::ForbiddenError).to eq(SignWell::Errors::PermissionDeniedError)
      expect(SignWell::Errors::TransportError).to eq(SignWell::Errors::ApiConnectionError)
    end

    it 'parses structured rate limit metadata from status errors' do
      error = SignWell::Errors::ApiStatusError.for(
        code: 429,
        response_headers: {
          'x-ratelimit-limit' => '100',
          'x-ratelimit-remaining' => '0',
          'x-ratelimit-reset' => '1893456000',
          'retry-after' => '30'
        },
        response_body: '{"message":"rate limited"}'
      )

      expect(error).to be_a(SignWell::Errors::RateLimitError)
      expect(error.rate_limit.limit).to eq(100.0)
      expect(error.rate_limit.remaining).to eq(0.0)
      expect(error.rate_limit.reset).to eq(1_893_456_000.0)
      expect(error.rate_limit.retry_after).to eq(30.0)
      expect(error.rate_limit.reset_at).to be_a(Time)
    end
  end

  describe '#download_file' do
    it 'streams file downloads to a tempfile when binary data is not requested' do
      request_options = Struct.new(:on_data).new
      request = Struct.new(:options).new(request_options)

      stream = client.download_file(request)
      request.options.on_data.call('hello ', 6)
      request.options.on_data.call('world', 11)

      response = Struct.new(:body, :headers).new(String.new.b, {})
      tempfile = client.deserialize_file(response, stream)

      expect(tempfile).to be_a(Tempfile)
      expect(File.read(tempfile.path)).to eq('hello world')
    ensure
      tempfile&.close!
    end

    it 'streams larger chunked file downloads to a tempfile' do
      request_options = Struct.new(:on_data).new
      request = Struct.new(:options).new(request_options)
      expected = String.new.b

      stream = client.download_file(request)
      128.times do |index|
        chunk = "row-#{index},#{'x' * 8192}\n".b
        expected << chunk
        request.options.on_data.call(chunk, expected.bytesize)
      end

      response = Struct.new(:body, :headers).new(String.new.b, {})
      tempfile = client.deserialize_file(response, stream)

      expect(File.size(tempfile.path)).to eq(expected.bytesize)
      expect(File.binread(tempfile.path)).to eq(expected)
    ensure
      tempfile&.close!
    end

    it 'decodes transfer-encoded tempfile downloads without reading the whole tempfile at once' do
      request_options = Struct.new(:on_data).new
      request = Struct.new(:options).new(request_options)
      original = (0...(512 * 1024)).map { |index| (index % 256).chr }.join.b
      encoded = [original].pack('m')

      stream = client.download_file(request)
      offset = 0
      while offset < encoded.bytesize
        chunk = encoded.byteslice(offset, 8191)
        request.options.on_data.call(chunk, offset + chunk.bytesize)
        offset += chunk.bytesize
      end

      expect(stream).not_to receive(:read).with(no_args)
      expect(stream).to receive(:read).with(64 * 1024).at_least(:once).and_call_original

      response = Struct.new(:body, :headers).new(String.new.b, { 'Content-Transfer-Encoding' => 'binary' })
      tempfile = client.deserialize_file(response, stream)

      expect(File.size(tempfile.path)).to eq(original.bytesize)
      expect(File.binread(tempfile.path)).to eq(original)
    ensure
      tempfile&.close!
    end

    it 'returns decoded binary strings when return_binary_data is enabled' do
      config = SignWell::Configuration.new
      config.return_binary_data = true
      binary_client = described_class.new(config)
      request_options = Struct.new(:on_data).new
      request = Struct.new(:options).new(request_options)
      expected = "hello\x00world".b * 1024
      encoded = [expected].pack('m')

      stream = binary_client.download_file(request)
      encoded.scan(/.{1,37}/m).each do |chunk|
        request.options.on_data.call(chunk, chunk.bytesize)
      end

      response = Struct.new(:body, :headers).new(String.new.b, { 'Content-Transfer-Encoding' => 'base64' })
      data = binary_client.deserialize_file(response, stream)

      expect(data).to be_a(String)
      expect(data).to eq(expected)
      expect(data.encoding).to eq(Encoding::BINARY)
    end
  end
end
