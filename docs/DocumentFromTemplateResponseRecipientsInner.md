# SignWell::Models::DocumentFromTemplateResponseRecipientsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **email** | **String** |  |  |
| **role** | **String** |  | [optional] |
| **signing_url** | **String** |  | [optional] |
| **embedded_signing_url** | **String** |  | [optional] |
| **attachment_requests** | [**Array&lt;AttachmentRequestInfo&gt;**](AttachmentRequestInfo.md) |  | [optional] |
| **passcode** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::DocumentFromTemplateResponseRecipientsInner.new(
  name: null,
  email: null,
  role: null,
  signing_url: null,
  embedded_signing_url: null,
  attachment_requests: null,
  passcode: null,
  status: null
)
```

