# SignWell::DocumentFromTemplateResponseRecipientsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **email** | **String** |  |  |
| **role** | **String** |  | [optional] |
| **attachment_requests** | [**Array&lt;AttachmentRequestInfo&gt;**](AttachmentRequestInfo.md) |  | [optional] |
| **passcode** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::DocumentFromTemplateResponseRecipientsInner.new(
  name: null,
  email: null,
  role: null,
  attachment_requests: null,
  passcode: null,
  status: null
)
```

