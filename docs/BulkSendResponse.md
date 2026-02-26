# SignWell::Models::BulkSendResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **name** | **String** |  | [optional] |
| **api_application_id** | **String** |  | [optional] |
| **documents_count** | **Integer** |  |  |
| **documents_completed** | **Integer** |  | [optional] |
| **documents_not_completed** | **Integer** |  | [optional] |
| **created_at** | **Time** |  |  |
| **user_id** | **String** |  | [optional] |
| **status** | **String** |  |  |
| **templates** | [**Array&lt;BulkSendResponseTemplatesInner&gt;**](BulkSendResponseTemplatesInner.md) |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::BulkSendResponse.new(
  id: null,
  name: null,
  api_application_id: null,
  documents_count: null,
  documents_completed: null,
  documents_not_completed: null,
  created_at: null,
  user_id: null,
  status: null,
  templates: null
)
```

