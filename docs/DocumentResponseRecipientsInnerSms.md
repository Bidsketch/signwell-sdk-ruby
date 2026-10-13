# SignWell::Models::DocumentResponseRecipientsInnerSms

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone_number_masked** | **String** | Masked phone number; the full number never leaves the API. | [optional] |
| **send_sms** | **Boolean** |  | [optional] |
| **send_sms_delay** | **Integer** |  | [optional] |
| **delivery_status** | **String** |  | [optional] |
| **message_type** | **String** |  | [optional] |
| **failed** | **Boolean** |  | [optional] |
| **failed_details** | **String** |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::DocumentResponseRecipientsInnerSms.new(
  phone_number_masked: null,
  send_sms: null,
  send_sms_delay: null,
  delivery_status: null,
  message_type: null,
  failed: null,
  failed_details: null
)
```

