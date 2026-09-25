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

  describe '#resolve_return_type' do
    it 'falls back to the default entry when the response content type is not in the map' do
      response = Struct.new(:body, :headers).new('', { 'Content-Type' => 'application/octet-stream' })
      return_type = { 'application/pdf' => 'File', 'default' => 'DocumentResponse' }

      expect(client.send(:resolve_return_type, response, return_type)).to eq('DocumentResponse')
    end

    it 'raises when the content type is absent from the map and there is no default' do
      response = Struct.new(:body, :headers).new('', { 'Content-Type' => 'application/octet-stream' })
      return_type = { 'application/pdf' => 'File' }

      expect do
        client.send(:resolve_return_type, response, return_type)
      end.to raise_error(SignWell::Errors::UnsupportedContentTypeError, /application\/octet-stream/)
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

    it 'discards the streamed tempfile when the request fails' do
      response = instance_double(
        Faraday::Response,
        success?: false,
        status: 500,
        reason_phrase: 'Internal Server Error',
        body: '{"error":"boom"}',
        headers: { 'Content-Type' => 'application/json' }
      )
      connection = double('connection')
      streamed = nil
      streamed_path = nil

      allow(client).to receive(:connection).and_return(connection)
      allow(client).to receive(:build_request) { |_http_method, _path, request, _opts| request }
      allow(client).to receive(:download_file).and_wrap_original do |original, request|
        streamed = original.call(request)
        streamed_path = streamed.path
        streamed
      end
      allow(connection).to receive(:public_send) do |_method, &block|
        request = Struct.new(:options, :headers, :body).new(
          Struct.new(:on_data, :params_encoder, :timeout).new,
          {},
          nil
        )
        block.call(request)
        response
      end

      expect do
        client.call_api(
          :GET,
          '/test',
          header_params: {},
          query_params: {},
          auth_names: [],
          return_type: 'File',
          operation: 'DocumentApi.get_completed_pdf'
        )
      end.to raise_error(SignWell::Errors::InternalServerError)

      expect(streamed).to be_a(Tempfile)
      expect(streamed.closed?).to be(true)
      expect(File.exist?(streamed_path)).to be(false)
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
      # eql, not eq: 100.0 == 100 in Ruby, so eq would not pin the Integer type.
      expect(error.rate_limit.limit).to eql(100)
      expect(error.rate_limit.remaining).to eql(0)
      expect(error.rate_limit.reset).to eql(1_893_456_000)
      expect(error.rate_limit.retry_after).to eql(30)
      expect(error.rate_limit.reset_at).to eq(Time.at(1_893_456_000).utc)
    end

    it 'parses the ISO8601 reset timestamp the SignWell API sends' do
      error = SignWell::Errors::ApiStatusError.for(
        code: 429,
        response_headers: {
          'X-RateLimit-Limit' => '120',
          'X-RateLimit-Remaining' => '0',
          'X-RateLimit-Reset' => '2026-09-20T21:55:00+00:00'
        },
        response_body: ''
      )

      expect(error.rate_limit.limit).to eql(120)
      expect(error.rate_limit.reset_at).to eq(Time.utc(2026, 9, 20, 21, 55, 0))
      expect(error.rate_limit.reset).to eql(Time.utc(2026, 9, 20, 21, 55, 0).to_i)
    end

    it 'prefers the x-ratelimit-* header names whatever order the server emitted them in' do
      error = SignWell::Errors::ApiStatusError.for(
        code: 429,
        response_headers: { 'ratelimit-limit' => '5', 'x-ratelimit-limit' => '100' },
        response_body: ''
      )

      expect(error.rate_limit.limit).to eq(100)
    end

    it 'treats a small numeric reset as a delay, not an epoch' do
      error = SignWell::Errors::ApiStatusError.for(
        code: 429,
        response_headers: { 'x-ratelimit-reset' => '30' },
        response_body: ''
      )

      # Below the epoch threshold, so it is seconds-from-now and there is no absolute time
      # to report. reset_at staying nil is how a caller knows which unit it got.
      expect(error.rate_limit.reset).to eql(30)
      expect(error.rate_limit.reset_at).to be_nil
    end

    it 'reads the count off IETF draft headers that append a quota policy' do
      error = SignWell::Errors::ApiStatusError.for(
        code: 429,
        response_headers: {
          'ratelimit-limit' => '100, 100;w=60',
          'ratelimit-remaining' => '0, 0;w=60'
        },
        response_body: ''
      )

      expect(error.rate_limit.limit).to eql(100)
      expect(error.rate_limit.remaining).to eql(0)
    end

    it 'still refuses to read a malformed reset timestamp as its leading year' do
      error = SignWell::Errors::ApiStatusError.for(
        code: 429,
        response_headers: { 'x-ratelimit-limit' => '100', 'x-ratelimit-reset' => '2026-13-45T99:99:99Z' },
        response_body: ''
      )

      expect(error.rate_limit.reset).to be_nil
      expect(error.rate_limit.reset_at).to be_nil
    end

    it 'leaves reset metadata nil when the header is neither a timestamp nor a number' do
      error = SignWell::Errors::ApiStatusError.for(
        code: 429,
        response_headers: { 'x-ratelimit-limit' => '100', 'x-ratelimit-reset' => 'soon' },
        response_body: ''
      )

      expect(error.rate_limit.limit).to eq(100)
      expect(error.rate_limit.reset).to be_nil
      expect(error.rate_limit.reset_at).to be_nil
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

    it 'keeps the fixed download- prefix on decoded tempfiles, so a long filename cannot overflow NAME_MAX' do
      request_options = Struct.new(:on_data).new
      request = Struct.new(:options).new(request_options)
      encoded = ['%PDF-1.4 hello'.b].pack('m')

      stream = client.download_file(request)
      request.options.on_data.call(encoded, encoded.bytesize)

      # 250 characters: with Tempfile's own suffix appended this exceeds NAME_MAX (255), and
      # naming the decoded tempfile after it raised Errno::ENAMETOOLONG.
      long_name = "#{'a' * 246}.pdf"
      response = Struct.new(:body, :headers).new(
        String.new.b,
        {
          'Content-Transfer-Encoding' => 'base64',
          'Content-Disposition' => %(attachment; filename="#{long_name}")
        }
      )
      tempfile = client.deserialize_file(response, stream)

      expect(File.basename(tempfile.path)).to start_with('download-')
      expect(File.binread(tempfile.path)).to eq('%PDF-1.4 hello'.b)
    ensure
      tempfile&.close!
    end

    it 'unlinks the decoded tempfile when the decode raises, not just the one call_api holds' do
      request_options = Struct.new(:on_data).new
      request = Struct.new(:options).new(request_options)

      stream = client.download_file(request)
      request.options.on_data.call('whatever'.b, 8)

      # The decoded tempfile is only ever handed to the decoder, so capture it there.
      decoded_path = nil
      allow(client).to receive(:decode_binary_transfer_stream) do |_source, destination|
        decoded_path = destination.path
        raise IOError, 'boom'
      end

      response = Struct.new(:body, :headers).new(String.new.b, { 'Content-Transfer-Encoding' => 'base64' })

      expect { client.deserialize_file(response, stream) }.to raise_error(IOError, 'boom')
      expect(decoded_path).not_to be_nil
      expect(File.exist?(decoded_path)).to be(false)
    ensure
      stream&.close!
    end

    it 'unlinks the decoded tempfile when the swap succeeds but finalizing raises' do
      request_options = Struct.new(:on_data).new
      request = Struct.new(:options).new(request_options)
      encoded = ['payload'.b].pack('m')

      stream = client.download_file(request)
      request.options.on_data.call(encoded, encoded.bytesize)

      # call_api's rescue still points at the pre-decode tempfile, so only the method that
      # made the swap can unlink this one.
      allow(client).to receive(:log_download_path).and_raise(IOError, 'logger gone')

      response = Struct.new(:body, :headers).new(String.new.b, { 'Content-Transfer-Encoding' => 'base64' })
      decoded_path = nil
      allow(client).to receive(:decode_binary_transfer_stream).and_wrap_original do |original, source, destination|
        decoded_path = destination.path
        original.call(source, destination)
      end

      expect { client.deserialize_file(response, stream) }.to raise_error(IOError, 'logger gone')
      expect(decoded_path).not_to be_nil
      expect(File.exist?(decoded_path)).to be(false)
    ensure
      stream&.close!
    end

    it 'returns the streamed tempfile itself rather than copying it for a Content-Disposition name' do
      request_options = Struct.new(:on_data).new
      request = Struct.new(:options).new(request_options)

      stream = client.download_file(request)
      request.options.on_data.call('%PDF-1.4 hello'.b, 14)

      response = Struct.new(:body, :headers).new(
        String.new.b,
        { 'Content-Disposition' => 'attachment; filename="completed.pdf"' }
      )
      tempfile = client.deserialize_file(response, stream)

      expect(tempfile).to equal(stream)
      expect(File.binread(tempfile.path)).to eq('%PDF-1.4 hello'.b)
    ensure
      tempfile&.close!
    end
  end
end
