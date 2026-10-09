# SignWell::Models::RecipientsInnerPasscodeDelivery

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enabled** | **Boolean** | Enable passcode delivery for this recipient. Cannot be set to &#x60;false&#x60; on a 21 CFR Part 11 document: it returns a 422. | [optional] |
| **methods** | **Array&lt;String&gt;** | Delivery methods for the passcode. Currently supports: email. Defaults to [\&quot;email\&quot;] when omitted. | [optional] |
| **expire_after_access** | **Boolean** | When enabled, the passcode is cleared after successful authentication. If passcode_delivery is also enabled, a new passcode is auto-generated on the next send request. Otherwise the recipient will no longer need a passcode. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::RecipientsInnerPasscodeDelivery.new(
  enabled: null,
  methods: null,
  expire_after_access: null
)
```

