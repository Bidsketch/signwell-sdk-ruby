# SignWell::Models::ConditionalLogicDecisionInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rule_id** | **String** | External ID of the conditional rule that fired |  |
| **field_api_id** | **String** | api_id of the field the decision applies to |  |
| **decision_type** | **String** | Whether the signer kept the existing signature or the value was cleared |  |
| **decided_at** | **Time** | When the decision was recorded |  |
| **description** | **String** | Human-readable summary of the decision | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ConditionalLogicDecisionInfo.new(
  rule_id: null,
  field_api_id: null,
  decision_type: null,
  decided_at: null,
  description: null
)
```

