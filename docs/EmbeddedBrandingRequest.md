# SignWell::Models::EmbeddedBrandingRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **company_logo** | [**EmbeddedBrandingRequestCompanyLogo**](EmbeddedBrandingRequestCompanyLogo.md) |  | [optional] |
| **accent_color** | **String** | Accent color for this document&#39;s embedded pages, as a 6-digit HEX value. Returned normalized to &#x60;#RRGGBB&#x60;. | [optional] |
| **button_label_color** | **String** | Button label color for this document&#39;s embedded pages, as a 6-digit HEX value. Returned normalized to &#x60;#RRGGBB&#x60;. | [optional] |
| **link_color** | **String** | Link color for this document&#39;s embedded pages, as a 6-digit HEX value. Returned normalized to &#x60;#RRGGBB&#x60;. | [optional] |
| **button_border_radius** | **Integer** | Corner radius of buttons on this document&#39;s embedded pages, in pixels. Must be between 0 and 25. | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::EmbeddedBrandingRequest.new(
  company_logo: null,
  accent_color: #51B6C4,
  button_label_color: #FFFFFF,
  link_color: #1A0DAB,
  button_border_radius: 25
)
```

