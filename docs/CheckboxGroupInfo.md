# SignWell::Models::CheckboxGroupInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Checkbox group ID |  |
| **group_name** | **String** | Name of the checkbox group | [optional] |
| **recipient_id** | **String** | Recipient ID associated with the group | [optional] |
| **checkbox_ids** | **Array&lt;String&gt;** | IDs of checkboxes in this group |  |
| **validation** | [**CheckboxValidation**](CheckboxValidation.md) |  | [optional] |
| **required** | **Boolean** | Whether at least one checkbox must be checked |  |
| **min_value** | **Integer** | Minimum number of checkboxes to check | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::CheckboxGroupInfo.new(
  id: null,
  group_name: null,
  recipient_id: null,
  checkbox_ids: null,
  validation: null,
  required: null,
  min_value: null
)
```

