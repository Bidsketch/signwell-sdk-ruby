# SignWell::Models::ApiApplicationResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **name** | **String** |  |  |
| **callback_urls** | **Array&lt;String&gt;** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **owner** | [**ApiApplicationResponseOwner**](ApiApplicationResponseOwner.md) |  | [optional] |
| **preferences** | [**ApiApplicationResponsePreferences**](ApiApplicationResponsePreferences.md) |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ApiApplicationResponse.new(
  id: null,
  name: null,
  callback_urls: null,
  created_at: null,
  updated_at: null,
  owner: null,
  preferences: null
)
```

