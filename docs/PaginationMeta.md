# SignWell::Models::PaginationMeta

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **current_page** | **Integer** | Current page number |  |
| **next_page** | **Integer** | Next page number, null if on last page | [optional] |
| **previous_page** | **Integer** | Previous page number, null if on first page | [optional] |
| **total_count** | **Integer** | Total number of records |  |
| **total_pages** | **Integer** | Total number of pages |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::PaginationMeta.new(
  current_page: null,
  next_page: null,
  previous_page: null,
  total_count: null,
  total_pages: null
)
```

