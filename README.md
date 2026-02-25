# signwell_sdk

The official Ruby SDK for the [SignWell API](https://developers.signwell.com/).

## Installation

Add to your Gemfile:

```ruby
gem 'signwell_sdk'
```

Or install directly:

```shell
gem install signwell_sdk
```

## Quick Start

```ruby
require 'signwell_sdk'

SignWell.configure do |config|
  config.api_key['X-Api-Key'] = ENV['SIGNWELL_API_KEY']
end

# Send a document for signature
documents_api = SignWell::Resources::DocumentApi.new
document = documents_api.create_document({
  test_mode: true,
  name: 'My Document',
  file_url: 'https://example.com/contract.pdf',
  recipients: [{ email: 'recipient@example.com', name: 'Jane Doe' }]
})

puts document.id
```

## Documentation

For the full API reference (all resources, models, and methods), see the documentation on gemdocs:

**[signwell_sdk API Reference](https://gemdocs.org/gems/signwell_sdk/)**

## Examples

The [`examples/`](examples/) directory contains runnable scripts covering common use cases:

| Example | Description |
|---------|-------------|
| [01_me.rb](examples/01_me.rb) | Get account info |
| [02_documents.rb](examples/02_documents.rb) | Create, retrieve, remind, and delete a document |
| [03_templates.rb](examples/03_templates.rb) | Create, update, and delete templates |
| [04_document_from_template.rb](examples/04_document_from_template.rb) | Create a document from a template |
| [05_bulk_send.rb](examples/05_bulk_send.rb) | Bulk send with CSV validation |
| [06_webhooks.rb](examples/06_webhooks.rb) | Manage webhooks |
| [07_error_handling.rb](examples/07_error_handling.rb) | Error hierarchy and handling patterns |
| [08_retries.rb](examples/08_retries.rb) | Retry configuration with Faraday middleware |

To run the examples, set your API key and run any script:

```shell
cd examples
SIGNWELL_API_KEY=your_key ruby 01_me.rb
```

## License

This SDK is distributed under the [MIT License](LICENSE).
