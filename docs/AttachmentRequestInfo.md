# SignWell::Models::AttachmentRequestInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Name of the attachment request |  |
| **url** | **String** | URL of the uploaded attachment (when available) | [optional] |
| **required** | **Boolean** | Whether the attachment is required |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::AttachmentRequestInfo.new(
  name: null,
  url: null,
  required: null
)
```

