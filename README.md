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

api = SignWell::Resources::DocumentApi.new

# Create and send a document for signature
request = SignWell::Models::DocumentRequest.new(
  test_mode: true,
  name: 'SDK Example - NDA',
  files: [
    SignWell::Models::FilesInner.new(
      file_url: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
      name: 'nda.pdf'
    )
  ],
  recipients: [
    SignWell::Models::RecipientsInner.new(
      id: '1',
      name: 'Jane Doe',
      email: 'jane@example.com'
    )
  ],
  fields: [[
    SignWell::Models::FieldsInnerInner.new(
      x: 20, y: 60, page: 1,
      recipient_id: '1',
      type: 'signature',
      required: true
    )
  ]]
)

document = api.create_document(request)
puts document.id
```

## Embedded Signing

The embedded API lets you integrate document signing directly into your app via an iframe, instead of redirecting users to SignWell. The `SignWell::Embedded` helper simplifies both the backend (creating documents, extracting URLs) and the frontend (rendering the iframe).

### Backend: Create a document for embedded signing

```ruby
doc = SignWell::Embedded.create_signing_document(
  name: 'NDA',
  file_url: 'https://example.com/nda.pdf',
  recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }],
  fields: [[{ x: 20, y: 60, page: 1, type: 'signature' }]]
)

# Get the signing URL for the first recipient
signing_url = SignWell::Embedded.signing_url(doc)

# Or get all signing URLs as { email => url }
urls = SignWell::Embedded.signing_urls(doc)
```

### Backend: Create a draft for embedded requesting (field placement)

```ruby
doc = SignWell::Embedded.create_requesting_document(
  name: 'Contract',
  file_url: 'https://example.com/contract.pdf',
  recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }]
)

edit_url = doc.embedded_edit_url
```

### Backend: Create from a template

```ruby
# Single template
doc = SignWell::Embedded.create_signing_document_from_template(
  template_id: 'your-template-uuid',
  recipients: [{ placeholder_name: 'Signer 1', name: 'Jane Doe', email: 'jane@example.com' }]
)

# Multiple templates
doc = SignWell::Embedded.create_signing_document_from_template(
  template_ids: ['template-uuid-1', 'template-uuid-2'],
  recipients: [{ placeholder_name: 'Signer 1', name: 'Jane Doe', email: 'jane@example.com' }]
)

signing_url = SignWell::Embedded.signing_url(doc)
```

### Frontend: JavaScript

```html
<script src="https://static.signwell.com/assets/embedded.js"></script>
<script>
  var embed = new SignWellEmbed({
    url: signingUrl,
    events: {
      completed: function(e) { console.log('Signed!', e); },
      closed: function(e) { console.log('Closed'); }
    }
  });
  embed.open();
</script>
```

### Frontend: Rails view helpers

If you use Rails, view helpers are available automatically:

```erb
<%= signwell_embed_script_tag %>
<%= signwell_signing_iframe(url: @signing_url, events: { completed: 'onComplete' }) %>
<%= signwell_requesting_iframe(url: @edit_url) %>
```

## Documentation

For the full API reference (all resources, models, and methods), see the documentation on gemdocs:

**[signwell_sdk API Reference](https://gemdocs.org/gems/signwell_sdk/)**

## Examples

The [`examples/`](https://github.com/Bidsketch/signwell-sdk-ruby/tree/main/examples) directory contains runnable scripts covering common use cases:

| Example | Description |
|---------|-------------|
| [01_me.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/01_me.rb) | Get account info |
| [02_documents.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/02_documents.rb) | Create, retrieve, remind, and delete a document |
| [03_templates.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/03_templates.rb) | Create, update, and delete templates |
| [04_document_from_template.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/04_document_from_template.rb) | Create a document from a template |
| [05_bulk_send.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/05_bulk_send.rb) | Bulk send with CSV validation |
| [06_webhooks.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/06_webhooks.rb) | Manage webhooks |
| [07_error_handling.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/07_error_handling.rb) | Error hierarchy and handling patterns |
| [08_retries.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/08_retries.rb) | Retry configuration with Faraday middleware |
| [09_webhook_validation.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/09_webhook_validation.rb) | Webhook signature verification |
| [10_embedded_signing.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/10_embedded_signing.rb) | Embedded signing workflow |
| [11_embedded_requesting.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/11_embedded_requesting.rb) | Embedded requesting workflow |
| [12_text_tags.rb](https://github.com/Bidsketch/signwell-sdk-ruby/blob/main/examples/12_text_tags.rb) | Text tags with multi-signer support |

To run the examples, set your API key and run any script:

```shell
cd examples
SIGNWELL_API_KEY=your_key ruby 01_me.rb
```

## License

This SDK is distributed under the [MIT License](LICENSE).
