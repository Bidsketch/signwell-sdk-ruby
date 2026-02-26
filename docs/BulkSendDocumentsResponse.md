# SignWell::Models::BulkSendDocumentsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **name** | **String** |  | [optional] |
| **api_application_id** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **user_id** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **documents** | [**Array&lt;DocumentResponse&gt;**](DocumentResponse.md) |  |  |
| **current_page** | **Integer** |  |  |
| **next_page** | **Integer** |  | [optional] |
| **previous_page** | **Integer** |  | [optional] |
| **total_count** | **Integer** |  |  |
| **total_pages** | **Integer** |  |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::BulkSendDocumentsResponse.new(
  id: null,
  name: null,
  api_application_id: null,
  created_at: null,
  user_id: null,
  status: null,
  documents: null,
  current_page: null,
  next_page: null,
  previous_page: null,
  total_count: null,
  total_pages: null
)
```

