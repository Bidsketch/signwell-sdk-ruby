# SignWell::FilesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Name of the file that will be uploaded. |  |
| **file_url** | **String** | Publicly available URL of the file to be uploaded. | [optional] |
| **file_base64** | **String** | A RFC 4648 base64 string of the file to be uploaded. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::FilesInner.new(
  name: null,
  file_url: null,
  file_base64: null
)
```

