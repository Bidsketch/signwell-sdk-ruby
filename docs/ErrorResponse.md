# SignWell::Models::ErrorResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | Human-readable error message | [optional] |
| **meta** | [**ErrorResponseMeta**](ErrorResponseMeta.md) |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ErrorResponse.new(
  message: null,
  meta: null
)
```

