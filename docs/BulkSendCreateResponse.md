# SignWell::BulkSendCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **template_ids** | **Array&lt;String&gt;** |  |  |
| **api_application_id** | **String** |  | [optional] |
| **documents_count** | **Integer** |  |  |
| **created_at** | **Time** |  |  |
| **user_id** | **String** |  | [optional] |
| **status** | **String** |  |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::BulkSendCreateResponse.new(
  id: null,
  template_ids: null,
  api_application_id: null,
  documents_count: null,
  created_at: null,
  user_id: null,
  status: null
)
```

