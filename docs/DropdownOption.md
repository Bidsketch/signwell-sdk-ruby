# SignWell::Models::DropdownOption

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'signwell_sdk'

SignWell::Models::DropdownOption.openapi_one_of
# =>
# [
#   :'DetailedOption',
#   :'String'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'signwell_sdk'

SignWell::Models::DropdownOption.build(data)
# => #<DetailedOption:0x00007fdd4aab02a0>

SignWell::Models::DropdownOption.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `DetailedOption`
- `String`
- `nil` (if no type matches)

