# SignWell::TemplateApi

All URIs are relative to *https://www.signwell.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_template**](TemplateApi.md#create_template) | **POST** /api/v1/document_templates | Create Template |
| [**delete_template**](TemplateApi.md#delete_template) | **DELETE** /api/v1/document_templates/{id} | Delete Template |
| [**get_template**](TemplateApi.md#get_template) | **GET** /api/v1/document_templates/{id} | Get Template |
| [**list_templates**](TemplateApi.md#list_templates) | **GET** /api/v1/document_templates | List Templates |
| [**update_template**](TemplateApi.md#update_template) | **PUT** /api/v1/document_templates/{id} | Update Template |


## create_template

> <DocumentTemplateResponse> create_template(document_template_request)

Create Template

Creates a new template.

### Examples

```ruby
require 'time'
require 'signwell_sdk'
# setup authorization
SignWell.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = SignWell::TemplateApi.new
document_template_request = SignWell::DocumentTemplateRequest.new({files: [SignWell::FilesInner.new({name: 'name_example'})], placeholders: [SignWell::PlaceholdersInner.new({id: 'id_example', name: 'name_example'})]}) # DocumentTemplateRequest | 

begin
  # Create Template
  result = api_instance.create_template(document_template_request)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->create_template: #{e}"
end
```

#### Using the create_template_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentTemplateResponse>, Integer, Hash)> create_template_with_http_info(document_template_request)

```ruby
begin
  # Create Template
  data, status_code, headers = api_instance.create_template_with_http_info(document_template_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentTemplateResponse>
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->create_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **document_template_request** | [**DocumentTemplateRequest**](DocumentTemplateRequest.md) |  |  |

### Return type

[**DocumentTemplateResponse**](DocumentTemplateResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_template

> delete_template(id)

Delete Template

Deletes a template. Supply the unique template ID from either a Create Template request or template page URL.

### Examples

```ruby
require 'time'
require 'signwell_sdk'
# setup authorization
SignWell.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = SignWell::TemplateApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Delete Template
  api_instance.delete_template(id)
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->delete_template: #{e}"
end
```

#### Using the delete_template_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_template_with_http_info(id)

```ruby
begin
  # Delete Template
  data, status_code, headers = api_instance.delete_template_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->delete_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_template

> <DocumentTemplateResponse> get_template(id)

Get Template

Returns a template and all associated template data. Supply the unique template ID from either a Create Template request or template page URL.

### Examples

```ruby
require 'time'
require 'signwell_sdk'
# setup authorization
SignWell.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = SignWell::TemplateApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Get Template
  result = api_instance.get_template(id)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->get_template: #{e}"
end
```

#### Using the get_template_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentTemplateResponse>, Integer, Hash)> get_template_with_http_info(id)

```ruby
begin
  # Get Template
  data, status_code, headers = api_instance.get_template_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentTemplateResponse>
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->get_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**DocumentTemplateResponse**](DocumentTemplateResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_templates

> <DocumentTemplateListResponse> list_templates(opts)

List Templates

Returns a paginated list of templates for the authenticated account.

### Examples

```ruby
require 'time'
require 'signwell_sdk'
# setup authorization
SignWell.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = SignWell::TemplateApi.new
opts = {
  page: 56, # Integer | 
  limit: 56 # Integer | 
}

begin
  # List Templates
  result = api_instance.list_templates(opts)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->list_templates: #{e}"
end
```

#### Using the list_templates_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentTemplateListResponse>, Integer, Hash)> list_templates_with_http_info(opts)

```ruby
begin
  # List Templates
  data, status_code, headers = api_instance.list_templates_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentTemplateListResponse>
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->list_templates_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page** | **Integer** |  | [optional][default to 1] |
| **limit** | **Integer** |  | [optional][default to 10] |

### Return type

[**DocumentTemplateListResponse**](DocumentTemplateListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_template

> <DocumentTemplateResponse> update_template(id, document_template_update_request)

Update Template

Updates an existing template.

### Examples

```ruby
require 'time'
require 'signwell_sdk'
# setup authorization
SignWell.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = SignWell::TemplateApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
document_template_update_request = SignWell::DocumentTemplateUpdateRequest.new # DocumentTemplateUpdateRequest | 

begin
  # Update Template
  result = api_instance.update_template(id, document_template_update_request)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->update_template: #{e}"
end
```

#### Using the update_template_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentTemplateResponse>, Integer, Hash)> update_template_with_http_info(id, document_template_update_request)

```ruby
begin
  # Update Template
  data, status_code, headers = api_instance.update_template_with_http_info(id, document_template_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentTemplateResponse>
rescue SignWell::ApiError => e
  puts "Error when calling TemplateApi->update_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **document_template_update_request** | [**DocumentTemplateUpdateRequest**](DocumentTemplateUpdateRequest.md) |  |  |

### Return type

[**DocumentTemplateResponse**](DocumentTemplateResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

