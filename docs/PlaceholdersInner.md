# SignWell::Models::PlaceholdersInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique identifier that you will give to each placeholder. We recommend numbering sequentially from 1 to X. IDs are required for associating recipients to fields and more. |  |
| **name** | **String** | Name of the placeholder. |  |
| **preassigned_recipient_name** | **String** | In some cases, it may be necessary to pre-fill the name and email for a placeholder because it will always be the same person for all documents created from this template. This sets the name. | [optional] |
| **preassigned_recipient_email** | **String** | In some cases, it may be necessary to pre-fill the name and email for a placeholder because it will always be the same person for all documents created from this template. This sets the email. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::PlaceholdersInner.new(
  id: null,
  name: null,
  preassigned_recipient_name: null,
  preassigned_recipient_email: null
)
```

