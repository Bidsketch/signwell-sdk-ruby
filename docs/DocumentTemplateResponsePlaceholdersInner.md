# SignWell::DocumentTemplateResponsePlaceholdersInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **name** | **String** |  |  |
| **subject** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |
| **preassigned_recipient_name** | **String** |  | [optional] |
| **preassigned_recipient_email** | **String** |  | [optional] |
| **signing_order** | **Integer** |  | [optional] |
| **attachment_requests** | [**Array&lt;AttachmentRequestInfo&gt;**](AttachmentRequestInfo.md) |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::DocumentTemplateResponsePlaceholdersInner.new(
  id: null,
  name: null,
  subject: null,
  message: null,
  preassigned_recipient_name: null,
  preassigned_recipient_email: null,
  signing_order: null,
  attachment_requests: null
)
```

