# SignWell::BulkSendListItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **name** | **String** |  |  |
| **api_application_id** | **String** |  | [optional] |
| **documents_count** | **Integer** |  |  |
| **documents_completed** | **Integer** |  |  |
| **documents_not_completed** | **Integer** |  |  |
| **created_at** | **Time** |  |  |
| **user_id** | **String** |  | [optional] |
| **status** | **String** |  |  |
| **template_ids** | **Array&lt;String&gt;** |  |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::BulkSendListItem.new(
  id: null,
  name: null,
  api_application_id: null,
  documents_count: null,
  documents_completed: null,
  documents_not_completed: null,
  created_at: null,
  user_id: null,
  status: null,
  template_ids: null
)
```

