# SignWell::Models::AccountInfoResponsePreferences

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date_format** | **String** |  | [optional] |
| **days_until_links_expire** | **Integer** |  | [optional] |
| **disable_apply_everywhere** | **Boolean** |  | [optional] |
| **disable_apply_everywhere_effective** | **Boolean** |  | [optional] |
| **disable_drawn_signatures** | **Boolean** |  | [optional] |
| **disable_typed_signatures** | **Boolean** |  | [optional] |
| **disable_uploaded_signatures** | **Boolean** |  | [optional] |
| **enable_redirect** | **Boolean** |  | [optional] |
| **hide_document_id_in_audit** | **Boolean** |  | [optional] |
| **mute_branding** | **Boolean** |  | [optional] |
| **redirect_url** | **String** |  | [optional] |
| **separate_audit_pdf** | **Boolean** |  | [optional] |
| **separate_completed_file** | **Boolean** |  | [optional] |
| **enable_nom151_compliance** | **Boolean** |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::AccountInfoResponsePreferences.new(
  date_format: null,
  days_until_links_expire: null,
  disable_apply_everywhere: null,
  disable_apply_everywhere_effective: null,
  disable_drawn_signatures: null,
  disable_typed_signatures: null,
  disable_uploaded_signatures: null,
  enable_redirect: null,
  hide_document_id_in_audit: null,
  mute_branding: null,
  redirect_url: null,
  separate_audit_pdf: null,
  separate_completed_file: null,
  enable_nom151_compliance: null
)
```

