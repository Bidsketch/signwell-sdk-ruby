# SignWell::Models::UpdateDocumentAndSendRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **test_mode** | **Boolean** | Set to &#x60;true&#x60; to enable Test Mode. Documents created with Test Mode do not count towards API billing and are not legally binding. Defaults to &#x60;false&#x60; | [optional][default to false] |
| **send_sms_test_preview_email** | **Boolean** | Only applies when &#x60;test_mode&#x60; is &#x60;true&#x60;. When &#x60;true&#x60;, and the document has an SMS-only recipient, sends the document owner a test-mode preview email (with a masked phone number) instead of the regular SMS sender-copy email. No SMS is sent and no credits are used, in test mode or otherwise. Defaults to &#x60;false&#x60;. | [optional][default to false] |
| **name** | **String** | The name of the document. | [optional] |
| **subject** | **String** | Email subject for the signature request that recipients will see. Defaults to the default system subject or a template subject (if the document is created from a template). Applies to email notifications only; SMS notifications always use fixed system templates. | [optional] |
| **message** | **String** | Email message for the signature request that recipients will see. Defaults to the default system message or a template message (if the document is created from a template). Applies to email notifications only; SMS notifications always use fixed system templates. | [optional] |
| **expires_in** | **Integer** | Number of days before the signature request expires. Defaults to the account expiration setting or template expiration (if the document is created from a template). | [optional] |
| **reminders** | **Boolean** | Whether to send signing reminders to recipients. Reminders are sent on day 3, day 6, and day 10 if set to &#x60;true&#x60;. Defaults to &#x60;true&#x60;. | [optional][default to true] |
| **apply_signing_order** | **Boolean** | When set to &#x60;true&#x60; recipients will sign one at a time in the order of the &#x60;recipients&#x60; collection of this request. | [optional][default to false] |
| **api_application_id** | **String** | Unique identifier for API Application settings to use. API Applications are optional and mainly used when isolating OAuth apps or for more control over embedded API settings | [optional] |
| **embedded_signing** | **Boolean** | When set to &#x60;true&#x60; it enables embedded signing in your website/web application. Embedded functionality works with an iFrame and email authentication is disabled. :embedded_signinig defaults to &#x60;false&#x60;. | [optional][default to false] |
| **embedded_signing_notifications** | **Boolean** | On embedding signing, document owners (and CC&#39;d contacts) do not get a notification email when documents have been completed. Setting this param to &#x60;true&#x60; will send out those final completed notifications. Default is &#x60;false&#x60; | [optional][default to false] |
| **embedded** | [**EmbeddedRequest**](EmbeddedRequest.md) |  | [optional] |
| **custom_requester_name** | **String** | Sets the custom requester name for the document. When set, this is the name used for all email communications, signing notifications, and in the audit file. | [optional] |
| **custom_requester_email** | **String** | Sets the custom requester email for the document. When set, this is the email used for all email communications, signing notifications, and in the audit file. | [optional] |
| **redirect_url** | **String** | A URL that recipients are redirected to after successfully signing a document. | [optional] |
| **allow_decline** | **Boolean** | Whether to allow recipients the option to decline signing a document. If multiple signers are involved in a document, any single recipient can cancel the entire document signing process by declining to sign. | [optional][default to true] |
| **allow_reassign** | **Boolean** | In some cases a signer is not the right person to sign and may need to reassign their signing responsibilities to another person. This feature allows them to reassign the document to someone else. Unavailable on 21 CFR Part 11 documents: omit it and reassignment stays off, while sending &#x60;true&#x60; returns a 422. | [optional][default to true] |
| **decline_redirect_url** | **String** | A URL that recipients are redirected to if the document is declined. | [optional] |
| **conditional_rules** | [**Array&lt;ConditionalRuleRequest&gt;**](ConditionalRuleRequest.md) | Conditional logic rules that show, hide, or require fields based on what a signer does to other fields. Every identifier is a field api_id. At most 10 rules per document or template. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Optional key-value data that can be associated with the document. If set, will be available every time the document data is returned. | [optional] |
| **labels** | [**Array&lt;LabelRequest&gt;**](LabelRequest.md) | Labels can be used to organize documents in a way that can make it easy to find using the document search in SignWell. A document can have multiple labels. Updating labels on a document will replace any existing labels for that document. | [optional] |
| **checkbox_groups** | [**Array&lt;CheckboxGroupsInner&gt;**](CheckboxGroupsInner.md) | Checkbox fields that are placed on a document can be grouped with selection requirements. At least 2 checkbox fields in an array of fields must be assigned to the same recipient. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::UpdateDocumentAndSendRequest.new(
  test_mode: null,
  send_sms_test_preview_email: null,
  name: null,
  subject: null,
  message: null,
  expires_in: null,
  reminders: null,
  apply_signing_order: null,
  api_application_id: null,
  embedded_signing: null,
  embedded_signing_notifications: null,
  embedded: null,
  custom_requester_name: null,
  custom_requester_email: null,
  redirect_url: null,
  allow_decline: null,
  allow_reassign: null,
  decline_redirect_url: null,
  conditional_rules: null,
  metadata: null,
  labels: null,
  checkbox_groups: null
)
```

