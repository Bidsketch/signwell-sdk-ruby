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

Status errors are available under `SignWell::Errors`. HTTP 403 responses raise `PermissionDeniedError`, with `ForbiddenError` kept as an additive alias. Transport failures raise `ApiConnectionError`, with `TransportError` kept as an additive alias. Local required-argument validation uses Ruby's native `ArgumentError`.

## Binary Responses

Some endpoints return a downloaded file by default and JSON when a mode flag is enabled.

```ruby
bulk_send = SignWell::Resources::BulkSendApi.new
documents = SignWell::Resources::DocumentApi.new
regional = SignWell::Resources::RegionalApi.new

csv_file = bulk_send.get_bulk_send_csv_template(['00000000-0000-0000-0000-000000000000'])
csv_json = bulk_send.get_bulk_send_csv_template(
  ['00000000-0000-0000-0000-000000000000'],
  base64: true
)

pdf_file = documents.get_completed_pdf('doc_123')
pdf_url = documents.get_completed_pdf('doc_123', url_only: true)

certificate_file = regional.get_nom151_certificate('doc_123')
certificate_url = regional.get_nom151_certificate('doc_123', url_only: true)
certificate_object = regional.get_nom151_certificate('doc_123', object_only: true)
```

Downloaded files are returned as `Tempfile` objects by default. Set `config.return_binary_data = true` if you want binary response bodies returned as strings.

## Rate Limits

A 429 raises `SignWell::Errors::RateLimitError`, which carries the throttling headers on `error.rate_limit`:

```ruby
begin
  documents.create_document(body)
rescue SignWell::Errors::RateLimitError => e
  e.rate_limit.limit        # => 100
  e.rate_limit.remaining    # => 0
  e.rate_limit.reset_at     # => 2026-09-20 21:55:00 UTC
  e.rate_limit.retry_after  # => 30
end
```

`reset` is in seconds either way, but it means two different things: an absolute epoch when the server sends a timestamp (what SignWell sends) or a large number, and a delay from now when it sends a small one. **`reset_at` is set only when `reset` is absolute** — so check it rather than guessing, and prefer `retry_after` / `retry_after_at` when you just want a sleep. Any field the response did not carry is `nil`.

## Embedded Signing

The embedded API lets you integrate document signing directly into your app via an iframe, instead of redirecting users to SignWell. The `SignWell::Embedded` helper simplifies both the backend (creating documents, extracting URLs) and the frontend (rendering the iframe).

### Backend: Create a document for embedded signing

```ruby
doc = SignWell::Embedded.create_signing_document(
  name: 'NDA',
  files: [{ name: 'nda.pdf', file_url: 'https://example.com/nda.pdf' }],
  recipients: [{ name: 'Jane Doe', email: 'jane@example.com' }],
  fields: [[{ x: 20, y: 60, page: 1, type: 'signature' }]]
)

# Get the signing URL for the first recipient
signing_url = SignWell::Embedded.embedded_signing_url(doc)

# Or get all signing URLs as { email => url }
urls = SignWell::Embedded.embedded_signing_urls(doc)
```

Embedded signing documents must provide fields for every recipient, set `with_signature_page: true`, or use `text_tags: true`. The helper validates that shape before making the API request so invalid fieldless signing documents fail locally instead of returning a `422` response.

### Backend: Create a draft for embedded requesting (field placement)

```ruby
doc = SignWell::Embedded.create_requesting_document(
  name: 'Contract',
  files: [{ name: 'contract.pdf', file_url: 'https://example.com/contract.pdf' }],
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

signing_url = SignWell::Embedded.embedded_signing_url(doc)
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
<%= signwell_signing_iframe(url: @signing_url, events: { completed: 'SignWellHandlers.onComplete' }) %>
<%= signwell_requesting_iframe(url: @edit_url) %>
```

Embed helpers only accept HTTPS SignWell URLs by default and reject credentialed URLs, `http:`, `javascript:`, and arbitrary hosts before rendering script output. For non-production SignWell environments, pass exact hostnames through `allowed_embed_hosts`. Redirect URLs must be HTTPS and credential-free; pass `allowed_redirect_hosts` to restrict redirects to your app host.

## Webhooks

```ruby
payload = JSON.parse(request.body.read)
event = payload['event']

SignWell::Webhook.verify_event!(
  event: event,
  webhook_id: ENV.fetch('SIGNWELL_WEBHOOK_ID'),
  tolerance_seconds: 300
)
```

Use replay-aware verification when webhook processing has side effects:

```ruby
REPLAY_STORE = SignWell::Webhook::MemoryReplayStore.new

SignWell::Webhook.verify_event_once!(
  event: event,
  webhook_id: ENV.fetch('SIGNWELL_WEBHOOK_ID'),
  tolerance_seconds: 300,
  replay_store: REPLAY_STORE
)
```

`verify_event` and `verify_event_once` return `false` instead of raising. The in-memory replay store is intended for local development and single-process examples; production apps should back replay protection with Redis, a database, or another shared atomic insert.

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
