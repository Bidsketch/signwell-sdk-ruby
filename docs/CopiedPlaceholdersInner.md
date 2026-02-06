# SignWell::CopiedPlaceholdersInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Name of the placeholder. |  |
| **preassigned_recipient_name** | **String** | In some cases, it may be necessary to pre-fill the name and email for a placeholder because it will always be the same person for all documents created from this template. This sets the name. | [optional] |
| **preassigned_recipient_email** | **String** | In some cases, it may be necessary to pre-fill the name and email for a placeholder because it will always be the same person for all documents created from this template. This sets the email. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::CopiedPlaceholdersInner.new(
  name: null,
  preassigned_recipient_name: null,
  preassigned_recipient_email: null
)
```

