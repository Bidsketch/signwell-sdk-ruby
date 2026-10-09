# SignWell::Models::ConditionalRuleInfoConditionsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **condition_type** | **String** | How field_api_ids combine within this condition | [optional] |
| **status** | **String** | Field state that satisfies this condition | [optional] |
| **join_operator** | **String** | How this condition joins with the next one in the rule | [optional] |
| **field_api_ids** | **Array&lt;String&gt;** | api_ids of fields evaluated by this condition | [optional] |
| **position** | **Integer** | Order of this condition within the rule | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ConditionalRuleInfoConditionsInner.new(
  condition_type: null,
  status: null,
  join_operator: null,
  field_api_ids: null,
  position: null
)
```

