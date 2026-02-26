# SignWell::Models::CreateWebhookRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **callback_url** | **String** | URL that we will post document events to. |  |
| **api_application_id** | **String** | Unique identifier for the API Application. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::CreateWebhookRequest.new(
  callback_url: https://example.com/webhook,
  api_application_id: null
)
```

