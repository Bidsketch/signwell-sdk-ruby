# SignWell::CheckboxGroupsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_name** | **String** | A unique identifier for the checkbox group. |  |
| **recipient_id** | **String** | The recipient ID associated with the checkbox group. |  |
| **checkbox_ids** | **Array&lt;String&gt;** |  |  |
| **validation** | [**CheckboxValidation**](CheckboxValidation.md) |  | [optional] |
| **required** | **Boolean** | Whether the group must be completed by the recipient. Defaults to false. | [optional][default to false] |
| **min_value** | **Integer** | The minimum number of checkboxes that must be checked in the group. (Only for validation: minimum and range) | [optional] |
| **max_value** | **Integer** | The maximum number of checkboxes that can be checked in the group. (Only for validation: maximum and range) | [optional] |
| **exact_value** | **Integer** | The exact number of checkboxes that must be checked in the group. (Only for validation: exact) | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::CheckboxGroupsInner.new(
  group_name: null,
  recipient_id: null,
  checkbox_ids: null,
  validation: null,
  required: null,
  min_value: null,
  max_value: null,
  exact_value: null
)
```

