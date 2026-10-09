# SignWell::Models::ConditionalRuleRequestConditionsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **condition_type** | **String** | How the field_api_ids combine within a condition: &#x60;any_of&#x60;, &#x60;all_of&#x60;, &#x60;none_of&#x60;, or &#x60;not_all_of&#x60;. |  |
| **status** | **String** | The field state the condition tests for: &#x60;completed&#x60; or &#x60;not_completed&#x60;. |  |
| **join_operator** | **String** | How this condition joins the next one in the rule: &#x60;and_operator&#x60; or &#x60;or_operator&#x60;. The first condition&#39;s value is ignored. | [optional] |
| **field_api_ids** | **Array&lt;String&gt;** | api_ids of the trigger fields the condition watches. |  |
| **position** | **Integer** | 1-indexed order of the condition within the rule. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::ConditionalRuleRequestConditionsInner.new(
  condition_type: null,
  status: null,
  join_operator: null,
  field_api_ids: null,
  position: null
)
```

