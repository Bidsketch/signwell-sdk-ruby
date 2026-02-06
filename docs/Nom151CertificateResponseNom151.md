# SignWell::Nom151CertificateResponseNom151

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Certificate status (pending, issued, failed) |  |
| **transaction_id** | **String** | RSA signature / Transaction ID |  |
| **hash** | **String** | Document digest (SHA-256 hash) |  |
| **folio** | **String** | Certificate number / Folio |  |
| **issued_at** | **Time** | Certificate issuance timestamp |  |
| **provider** | **String** | Certificate provider (e.g., SeguriData) |  |
| **validation_url** | **String** | URL to validate the certificate |  |
| **constancia** | **String** | Base64-encoded certificate file |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Nom151CertificateResponseNom151.new(
  status: null,
  transaction_id: null,
  hash: null,
  folio: null,
  issued_at: null,
  provider: null,
  validation_url: null,
  constancia: null
)
```

