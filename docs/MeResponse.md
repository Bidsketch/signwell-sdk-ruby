# SignWell::Models::MeResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Membership ID |  |
| **role** | **String** | Role within the account (e.g. owner, admin, member) |  |
| **archived** | **Boolean** |  | [optional] |
| **user** | [**MeResponseUser**](MeResponseUser.md) |  |  |
| **account** | [**AccountInfoResponse**](AccountInfoResponse.md) |  |  |
| **workspace** | [**AccountInfoResponse**](AccountInfoResponse.md) |  |  |
| **contact** | [**MeResponseContact**](MeResponseContact.md) |  |  |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::MeResponse.new(
  id: null,
  role: null,
  archived: null,
  user: null,
  account: null,
  workspace: null,
  contact: null
)
```

