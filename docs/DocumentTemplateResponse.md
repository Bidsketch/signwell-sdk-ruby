# SignWell::DocumentTemplateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **api_application_id** | **String** |  | [optional] |
| **requester_email_address** | **String** |  | [optional] |
| **custom_requester_name** | **String** |  | [optional] |
| **custom_requester_email** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **subject** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **placeholders** | [**Array&lt;DocumentTemplateResponsePlaceholdersInner&gt;**](DocumentTemplateResponsePlaceholdersInner.md) |  | [optional] |
| **copied_placeholders** | [**Array&lt;DocumentTemplateResponseCopiedPlaceholdersInner&gt;**](DocumentTemplateResponseCopiedPlaceholdersInner.md) |  | [optional] |
| **status** | **String** |  | [optional] |
| **reminders** | **Boolean** |  | [optional] |
| **archived** | **Boolean** |  | [optional] |
| **template_link** | **String** |  | [optional] |
| **apply_signing_order** | **Boolean** |  | [optional] |
| **redirect_url** | **String** |  | [optional] |
| **decline_redirect_url** | **String** |  | [optional] |
| **language** | **String** |  | [optional] |
| **expires_in** | **Integer** |  | [optional] |
| **files** | [**Array&lt;FileInfo&gt;**](FileInfo.md) |  | [optional] |
| **fields** | **Array&lt;Array&lt;DocumentResponseFieldsInnerInner&gt;&gt;** |  | [optional] |
| **allow_decline** | **Boolean** |  | [optional] |
| **allow_reassign** | **Boolean** |  | [optional] |
| **labels** | [**Array&lt;LabelInfo&gt;**](LabelInfo.md) |  | [optional] |
| **checkbox_groups** | [**Array&lt;CheckboxGroupInfo&gt;**](CheckboxGroupInfo.md) |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::DocumentTemplateResponse.new(
  id: null,
  api_application_id: null,
  requester_email_address: null,
  custom_requester_name: null,
  custom_requester_email: null,
  name: null,
  subject: null,
  message: null,
  metadata: null,
  created_at: null,
  updated_at: null,
  placeholders: null,
  copied_placeholders: null,
  status: null,
  reminders: null,
  archived: null,
  template_link: null,
  apply_signing_order: null,
  redirect_url: null,
  decline_redirect_url: null,
  language: null,
  expires_in: null,
  files: null,
  fields: null,
  allow_decline: null,
  allow_reassign: null,
  labels: null,
  checkbox_groups: null
)
```

