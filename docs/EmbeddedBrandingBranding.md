# SignWell::Models::EmbeddedBrandingBranding

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **company_logo** | **String** | Write-only. Reports only that a logo was set, never its URL or Base64 payload. | [optional] |
| **accent_color** | **String** | Hex, as #RRGGBB. | [optional] |
| **button_label_color** | **String** | Hex, as #RRGGBB. | [optional] |
| **link_color** | **String** | Hex, as #RRGGBB. | [optional] |
| **button_border_radius** | **Integer** | Pixels, 0 to 25. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::EmbeddedBrandingBranding.new(
  company_logo: null,
  accent_color: null,
  button_label_color: null,
  link_color: null,
  button_border_radius: null
)
```

