# SignWell::DocumentListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **documents** | [**Array&lt;DocumentResponse&gt;**](DocumentResponse.md) |  |  |
| **current_page** | **Integer** |  |  |
| **next_page** | **Integer** |  | [optional] |
| **previous_page** | **Integer** |  | [optional] |
| **total_count** | **Integer** |  |  |
| **total_pages** | **Integer** |  |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::DocumentListResponse.new(
  documents: null,
  current_page: null,
  next_page: null,
  previous_page: null,
  total_count: null,
  total_pages: null
)
```

