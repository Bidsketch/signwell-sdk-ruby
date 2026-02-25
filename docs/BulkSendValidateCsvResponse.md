# SignWell::BulkSendValidateCsvResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bulk_send_csv** | **String** | Base64-encoded CSV content |  |
| **template_ids** | **Array&lt;String&gt;** |  |  |
| **skip_row_errors** | **Boolean** |  | [optional] |
| **api_application_id** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **subject** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |
| **apply_signing_order** | **Boolean** |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::BulkSendValidateCsvResponse.new(
  bulk_send_csv: null,
  template_ids: null,
  skip_row_errors: null,
  api_application_id: null,
  name: null,
  subject: null,
  message: null,
  apply_signing_order: null
)
```

