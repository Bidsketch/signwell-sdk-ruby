# SignWell::Models::DocumentResponseRecipientsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **name** | **String** |  |  |
| **email** | **String** |  |  |
| **body** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |
| **subject** | **String** |  | [optional] |
| **send_email** | **Boolean** |  | [optional] |
| **send_email_delay** | **Integer** |  | [optional] |
| **delivery_method** | **String** | How the recipient is notified: email (default), sms, or email_and_sms. | [optional] |
| **sms** | [**DocumentResponseRecipientsInnerSms**](DocumentResponseRecipientsInnerSms.md) |  | [optional] |
| **signing_order** | **Integer** |  | [optional] |
| **signing_url** | **String** |  | [optional] |
| **embedded_signing_url** | **String** |  | [optional] |
| **bounced** | **Boolean** |  | [optional] |
| **bounced_details** | **String** |  | [optional] |
| **attachment_requests** | [**Array&lt;AttachmentRequestInfo&gt;**](AttachmentRequestInfo.md) |  | [optional] |
| **passcode** | **String** |  | [optional] |
| **passcode_delivery** | [**DocumentResponseRecipientsInnerPasscodeDelivery**](DocumentResponseRecipientsInnerPasscodeDelivery.md) |  | [optional] |
| **status** | **String** |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::DocumentResponseRecipientsInner.new(
  id: null,
  name: null,
  email: null,
  body: null,
  message: null,
  subject: null,
  send_email: null,
  send_email_delay: null,
  delivery_method: null,
  sms: null,
  signing_order: null,
  signing_url: null,
  embedded_signing_url: null,
  bounced: null,
  bounced_details: null,
  attachment_requests: null,
  passcode: null,
  passcode_delivery: null,
  status: null
)
```

