# SignWell::TemplateAttachmentRequestsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Name of the requested attachment. |  |
| **placeholder_id** | **String** | Unique identifier of the recipient that will view the attachment request. |  |
| **required** | **Boolean** | Whether the recipient will need to upload the attachment to successfully complete/sign the document. Defaults to &#x60;true&#x60;. | [optional][default to true] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::TemplateAttachmentRequestsInner.new(
  name: null,
  placeholder_id: null,
  required: null
)
```

