# SignWell::Models::ErrorResponseMeta

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error** | **String** | Error code identifier |  |
| **message** | **String** | Detailed error message |  |
| **messages** | **Array&lt;String&gt;** | List of error messages | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ErrorResponseMeta.new(
  error: null,
  message: null,
  messages: null
)
```

