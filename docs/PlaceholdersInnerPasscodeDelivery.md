# SignWell::Models::PlaceholdersInnerPasscodeDelivery

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enabled** | **Boolean** | Enable passcode delivery for this recipient. Cannot be set to &#x60;false&#x60; on a 21 CFR Part 11 document: it returns a 422. | [optional] |
| **methods** | **Array&lt;String&gt;** | Delivery methods for the passcode. Currently supports: email. Defaults to [\&quot;email\&quot;] when omitted. | [optional] |
| **expire_after_access** | **Boolean** | Whether the passcode expires after the recipient accesses the document. Inherited by documents created from this template. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::PlaceholdersInnerPasscodeDelivery.new(
  enabled: null,
  methods: null,
  expire_after_access: null
)
```

