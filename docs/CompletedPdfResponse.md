# SignWell::Models::CompletedPdfResponse

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'signwell_sdk'

SignWell::Models::CompletedPdfResponse.openapi_one_of
# =>
# [
#   :'CompletedPdfUrlResponse',
#   :'File'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'signwell_sdk'

SignWell::Models::CompletedPdfResponse.build(data)
# => #<CompletedPdfUrlResponse:0x00007fdd4aab02a0>

SignWell::Models::CompletedPdfResponse.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `CompletedPdfUrlResponse`
- `File`
- `nil` (if no type matches)

