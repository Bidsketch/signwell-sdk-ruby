# SignWell::DocumentTemplateListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **templates** | [**Array&lt;DocumentTemplateResponse&gt;**](DocumentTemplateResponse.md) |  |  |
| **current_page** | **Integer** |  |  |
| **next_page** | **Integer** |  | [optional] |
| **previous_page** | **Integer** |  | [optional] |
| **total_count** | **Integer** |  |  |
| **total_pages** | **Integer** |  |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::DocumentTemplateListResponse.new(
  templates: null,
  current_page: null,
  next_page: null,
  previous_page: null,
  total_count: null,
  total_pages: null
)
```

