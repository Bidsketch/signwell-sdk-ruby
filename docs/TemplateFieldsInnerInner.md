# SignWell::TemplateFieldsInnerInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x** | **Float** | Horizontal value in the coordinates of the field (in pixels). Coordinates are specific to the page where fields are located. |  |
| **y** | **Float** | Vertical value in the coordinates of the field (in pixels). Coordinates are specific to the page where fields are located. |  |
| **page** | **Integer** | The page number within the file. If the page does not exist within the file then the field won&#39;t be created. |  |
| **placeholder_id** | **String** | Unique identifier of the placeholder assigned to the field. |  |
| **type** | [**FieldType**](FieldType.md) |  |  |
| **required** | **Boolean** | Whether the field must be completed by the recipient. Defaults to &#x60;true&#x60; except for checkbox type fields. | [optional][default to true] |
| **label** | **String** | Text and Date fields only: label that is displayed when the field is empty. | [optional] |
| **value** | [**AdditionalFieldsInnerInnerValue**](AdditionalFieldsInnerInnerValue.md) |  | [optional] |
| **api_id** | **String** | Unique identifier of the field. Useful when needing to reference specific field values or update a document and its fields. | [optional] |
| **name** | **String** | Checkbox fields only. At least 2 checkbox fields in an array of fields must be assigned to the same recipient and grouped with selection requirements. | [optional] |
| **validation** | [**TextValidation**](TextValidation.md) |  | [optional] |
| **fixed_width** | **Boolean** | Text fields only: whether the field width will stay fixed and text will display in multiple lines, rather than one long line. If set to &#x60;false&#x60; the field width will automatically grow horizontally to fit text on one line. Defaults to &#x60;false&#x60;. | [optional][default to false] |
| **lock_sign_date** | **Boolean** | Date fields only: makes fields readonly and automatically populates with the date the recipient signed. Defaults to &#x60;false&#x60;. | [optional][default to false] |
| **date_format** | [**DateFormat**](DateFormat.md) |  | [optional] |
| **height** | **Float** | Height of the field (in pixels). Maximum height varies by field type: Signature/Initials (200px), others (74px). When using text tags if the height is greater than the maximum height, the height will be set to the maximum height. | [optional] |
| **width** | **Float** | Width of the field (in pixels). For text fields, width will auto-grow unless &#x60;fixed_width&#x60; is true. | [optional] |
| **options** | [**Array&lt;DropdownOption&gt;**](DropdownOption.md) | Array of dropdown options (for dropdown/select fields only) | [optional] |
| **default_option** | **String** | Default selected option (for dropdown/select fields only) | [optional] |
| **allow_other** | **Boolean** | Whether to allow \&quot;Other\&quot; option with text input (for dropdown/select fields only) | [optional][default to false] |

## Example

```ruby
require 'signwell_sdk'

instance = SignWell::TemplateFieldsInnerInner.new(
  x: null,
  y: null,
  page: null,
  placeholder_id: null,
  type: null,
  required: null,
  label: null,
  value: null,
  api_id: null,
  name: null,
  validation: null,
  fixed_width: null,
  lock_sign_date: null,
  date_format: null,
  height: null,
  width: null,
  options: null,
  default_option: null,
  allow_other: null
)
```

