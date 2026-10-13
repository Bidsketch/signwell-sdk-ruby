# SignWell::Models::CopiedPlaceholdersInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Name of the placeholder. |  |
| **preassigned_recipient_name** | **String** | In some cases, it may be necessary to pre-fill the name and email for a placeholder because it will always be the same person for all documents created from this template. This sets the name. Every recipient on a 21 CFR Part 11 document needs a name, so leaving it unset means the name has to be supplied when the document is created. | [optional] |
| **preassigned_recipient_email** | **String** | In some cases, it may be necessary to pre-fill the name and email for a placeholder because it will always be the same person for all documents created from this template. This sets the email. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::CopiedPlaceholdersInner.new(
  name: null,
  preassigned_recipient_name: null,
  preassigned_recipient_email: null
)
```

