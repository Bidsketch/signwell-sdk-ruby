# SignWell::SendReminderRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **recipients** | [**Array&lt;ReminderRecipientsInner&gt;**](ReminderRecipientsInner.md) | Optional list if recipients within the document to send a reminder email to. If none are specified, all recipients that have not signed yet will receive a reminder email. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::SendReminderRequest.new(
  recipients: null
)
```

