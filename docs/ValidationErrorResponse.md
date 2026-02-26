# SignWell::Models::ValidationErrorResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **errors** | **Hash&lt;String, Object&gt;** | Field-specific validation errors. Keys are field names (e.g., recipients, fields, files). Values can be strings, arrays of strings, or nested objects with further field-specific errors. |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ValidationErrorResponse.new(
  errors: null
)
```

