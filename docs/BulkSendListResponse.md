# SignWell::BulkSendListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bulk_sends** | [**Array&lt;BulkSendListItem&gt;**](BulkSendListItem.md) |  |  |
| **current_page** | **Integer** |  |  |
| **next_page** | **Integer** |  | [optional] |
| **previous_page** | **Integer** |  | [optional] |
| **total_count** | **Integer** |  |  |
| **total_pages** | **Integer** |  |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::BulkSendListResponse.new(
  bulk_sends: null,
  current_page: null,
  next_page: null,
  previous_page: null,
  total_count: null,
  total_pages: null
)
```

