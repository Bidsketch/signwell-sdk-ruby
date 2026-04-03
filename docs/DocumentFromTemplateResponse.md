# SignWell::Models::DocumentFromTemplateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **test_mode** | **Boolean** |  |  |
| **id** | **String** |  |  |
| **template_id** | **String** |  | [optional] |
| **template_ids** | **Array&lt;String&gt;** |  | [optional] |
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
| **recipients** | [**Array&lt;DocumentFromTemplateResponseRecipientsInner&gt;**](DocumentFromTemplateResponseRecipientsInner.md) |  | [optional] |
| **status** | **String** | Possible values: Draft, Created, Sending, Sent, Pending, Viewed, Completed, Manually completed, Declined, Canceled, Bounced, Blocked, Error, Expired | [optional] |
| **reminders** | **Boolean** |  | [optional] |
| **archived** | **Boolean** |  | [optional] |
| **embedded_signing** | **Boolean** |  | [optional] |
| **embedded_edit_url** | **String** |  | [optional] |
| **embedded_preview_url** | **String** |  | [optional] |
| **apply_signing_order** | **Boolean** |  | [optional] |
| **redirect_url** | **String** |  | [optional] |
| **decline_redirect_url** | **String** |  | [optional] |
| **language** | **String** |  | [optional] |
| **expires_in** | **Integer** |  | [optional] |
| **decline_message** | **String** |  | [optional] |
| **error_message** | **String** |  | [optional] |
| **embedded_signing_notifications** | **Boolean** |  | [optional] |
| **attachment_requests** | [**Array&lt;DocumentResponseAttachmentRequestsInner&gt;**](DocumentResponseAttachmentRequestsInner.md) |  | [optional] |
| **files** | [**Array&lt;FileInfo&gt;**](FileInfo.md) |  | [optional] |
| **copied_contacts** | [**Array&lt;CopiedContactInfo&gt;**](CopiedContactInfo.md) |  | [optional] |
| **fields** | **Array&lt;Array&lt;DocumentFromTemplateResponseFieldsInnerInner&gt;&gt;** |  | [optional] |
| **allow_decline** | **Boolean** |  | [optional] |
| **allow_reassign** | **Boolean** |  | [optional] |
| **labels** | [**Array&lt;LabelInfo&gt;**](LabelInfo.md) |  | [optional] |
| **checkbox_groups** | [**Array&lt;CheckboxGroupInfo&gt;**](CheckboxGroupInfo.md) |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::DocumentFromTemplateResponse.new(
  test_mode: null,
  id: null,
  template_id: null,
  template_ids: null,
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
  recipients: null,
  status: null,
  reminders: null,
  archived: null,
  embedded_signing: null,
  embedded_edit_url: null,
  embedded_preview_url: null,
  apply_signing_order: null,
  redirect_url: null,
  decline_redirect_url: null,
  language: null,
  expires_in: null,
  decline_message: null,
  error_message: null,
  embedded_signing_notifications: null,
  attachment_requests: null,
  files: null,
  copied_contacts: null,
  fields: null,
  allow_decline: null,
  allow_reassign: null,
  labels: null,
  checkbox_groups: null
)
```

