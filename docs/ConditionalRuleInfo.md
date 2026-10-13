# SignWell::Models::ConditionalRuleInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Conditional rule ID |  |
| **target_id** | **String** | api_id of the field that owns the rule, or the external_id of a checkbox group when the rule is owned by a group (groups have no api_id) |  |
| **action_type** | **String** | Action applied to action_field_ids when the conditions are met |  |
| **action_field_ids** | **Array&lt;String&gt;** | api_ids of fields the rule affects when triggered | [optional] |
| **conditions** | [**Array&lt;ConditionalRuleInfoConditionsInner&gt;**](ConditionalRuleInfoConditionsInner.md) |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ConditionalRuleInfo.new(
  id: null,
  target_id: null,
  action_type: null,
  action_field_ids: null,
  conditions: null
)
```

