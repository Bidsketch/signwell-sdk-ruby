# SignWell::Models::ReminderRecipientsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Recipient&#39;s name (required if multiple recipients share the same email). | [optional] |
| **email** | **String** | Recipient&#39;s email address. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ReminderRecipientsInner.new(
  name: null,
  email: null
)
```

