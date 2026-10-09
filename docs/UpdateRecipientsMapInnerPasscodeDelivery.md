# SignWell::Models::UpdateRecipientsMapInnerPasscodeDelivery

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enabled** | **Boolean** | Enable or disable passcode delivery. Cannot be set to &#x60;false&#x60; on a 21 CFR Part 11 document: it returns a 422. | [optional] |
| **methods** | **Array&lt;String&gt;** | Delivery methods. Defaults to [\&quot;email\&quot;]. | [optional] |
| **expire_after_access** | **Boolean** | Clear passcode after successful authentication. If passcode_delivery is also enabled, a new passcode is auto-generated on the next send request. Otherwise the recipient will no longer need a passcode. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::UpdateRecipientsMapInnerPasscodeDelivery.new(
  enabled: null,
  methods: null,
  expire_after_access: null
)
```

