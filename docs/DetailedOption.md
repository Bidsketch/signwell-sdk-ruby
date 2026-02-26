# SignWell::Models::DetailedOption

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Option display name |  |
| **api_id** | **String** | Unique identifier for the option | [optional] |
| **is_other** | **Boolean** | Whether this is the special \&quot;Other\&quot; option | [optional][default to false] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::DetailedOption.new(
  name: null,
  api_id: null,
  is_other: null
)
```

