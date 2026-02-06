# SignWell::DocumentResponseFieldsInnerInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x** | **Float** |  |  |
| **y** | **Float** |  |  |
| **page** | **Integer** |  |  |
| **recipient** | [**DocumentResponseFieldsInnerInnerRecipient**](DocumentResponseFieldsInnerInnerRecipient.md) |  | [optional] |
| **api_id** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **date_format** | [**DateFormat**](DateFormat.md) |  | [optional] |
| **fixed_width** | **Boolean** |  | [optional] |
| **label** | **String** |  | [optional] |
| **lock_sign_date** | **Boolean** |  | [optional] |
| **required** | **Boolean** |  | [optional] |
| **type** | [**FieldType**](FieldType.md) |  | [optional] |
| **validation** | [**TextValidation**](TextValidation.md) |  | [optional] |
| **value** | [**DocumentResponseFieldsInnerInnerValue**](DocumentResponseFieldsInnerInnerValue.md) |  | [optional] |
| **height** | **String** |  | [optional] |
| **width** | **String** |  | [optional] |
| **recipient_id** | **String** |  | [optional] |
| **signing_elements_group_id** | **String** |  | [optional] |
| **placeholder_name** | **String** |  | [optional] |
| **options** | [**Array&lt;DocumentResponseFieldsInnerInnerOptionsInner&gt;**](DocumentResponseFieldsInnerInnerOptionsInner.md) | Dropdown options (for dropdown/select fields) | [optional] |
| **default_option** | **String** | Default selected option | [optional] |
| **allow_other** | **Boolean** | Whether \&quot;Other\&quot; option is allowed | [optional] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::DocumentResponseFieldsInnerInner.new(
  x: null,
  y: null,
  page: null,
  recipient: null,
  api_id: null,
  name: null,
  date_format: null,
  fixed_width: null,
  label: null,
  lock_sign_date: null,
  required: null,
  type: null,
  validation: null,
  value: null,
  height: null,
  width: null,
  recipient_id: null,
  signing_elements_group_id: null,
  placeholder_name: null,
  options: null,
  default_option: null,
  allow_other: null
)
```

