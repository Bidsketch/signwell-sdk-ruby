# SignWell::Models::MeResponseAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **name** | **String** |  |  |
| **plan_tier** | **String** |  |  |
| **active_templates** | **Integer** |  | [optional] |
| **can_create_template** | **Boolean** |  | [optional] |
| **can_create_tracking_document** | **Boolean** |  | [optional] |
| **can_create_completion_document** | **Boolean** |  | [optional] |
| **active_users** | [**Array&lt;MeResponseAccountActiveUsersInner&gt;**](MeResponseAccountActiveUsersInner.md) |  | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::Models::MeResponseAccount.new(
  id: null,
  name: null,
  plan_tier: null,
  active_templates: null,
  can_create_template: null,
  can_create_tracking_document: null,
  can_create_completion_document: null,
  active_users: null
)
```

