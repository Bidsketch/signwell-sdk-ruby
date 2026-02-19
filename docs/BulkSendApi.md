# SignWell::BulkSendApi

All URIs are relative to *https://www.signwell.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_bulk_send**](BulkSendApi.md#create_bulk_send) | **POST** /api/v1/bulk_sends | Create Bulk Send |
| [**get_bulk_send**](BulkSendApi.md#get_bulk_send) | **GET** /api/v1/bulk_sends/{id} | Get Bulk Send |
| [**get_bulk_send_csv_template**](BulkSendApi.md#get_bulk_send_csv_template) | **GET** /api/v1/bulk_sends/csv_template | Get Bulk Send CSV Template |
| [**get_bulk_send_documents**](BulkSendApi.md#get_bulk_send_documents) | **GET** /api/v1/bulk_sends/{id}/documents | Get Bulk Send Documents |
| [**list_bulk_sends**](BulkSendApi.md#list_bulk_sends) | **GET** /api/v1/bulk_sends | List Bulk Sendings |
| [**validate_bulk_send_csv**](BulkSendApi.md#validate_bulk_send_csv) | **POST** /api/v1/bulk_sends/validate_csv | Validate Bulk Send CSV |


## create_bulk_send

> create_bulk_send(create_bulk_send_request)

Create Bulk Send

Creates a bulk send, and it validates the CSV file before creating the bulk send.

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

api_instance = SignWell::BulkSendApi.new
create_bulk_send_request = SignWell::CreateBulkSendRequest.new({template_ids: ['template_ids_example'], bulk_send_csv: 'bulk_send_csv_example'}) # CreateBulkSendRequest | 

begin
  # Create Bulk Send
  api_instance.create_bulk_send(create_bulk_send_request)
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->create_bulk_send: #{e}"
end
```

#### Using the create_bulk_send_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_bulk_send_with_http_info(create_bulk_send_request)

```ruby
begin
  # Create Bulk Send
  data, status_code, headers = api_instance.create_bulk_send_with_http_info(create_bulk_send_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->create_bulk_send_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_bulk_send_request** | [**CreateBulkSendRequest**](CreateBulkSendRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_bulk_send

> get_bulk_send(id)

Get Bulk Send

Returns information about the Bulk Send.

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

api_instance = SignWell::BulkSendApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Get Bulk Send
  api_instance.get_bulk_send(id)
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->get_bulk_send: #{e}"
end
```

#### Using the get_bulk_send_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_bulk_send_with_http_info(id)

```ruby
begin
  # Get Bulk Send
  data, status_code, headers = api_instance.get_bulk_send_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->get_bulk_send_with_http_info: #{e}"
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


## get_bulk_send_csv_template

> File get_bulk_send_csv_template(template_ids, opts)

Get Bulk Send CSV Template

Fetches a CSV template that corresponds to the provided document template IDs. CSV templates are blank CSV files that have columns containing required and optional data that can be sent when creating a bulk send. Fields can be referenced by the field label. Example: [placeholder name]_[field label] could be something like customer_address or signer_company_name (if 'Customer' and 'Signer' were placeholder names for templates set up in SignWell).

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

api_instance = SignWell::BulkSendApi.new
template_ids = ['inner_example'] # Array<String> | 
opts = {
  base64: true # Boolean | 
}

begin
  # Get Bulk Send CSV Template
  result = api_instance.get_bulk_send_csv_template(template_ids, opts)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->get_bulk_send_csv_template: #{e}"
end
```

#### Using the get_bulk_send_csv_template_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(File, Integer, Hash)> get_bulk_send_csv_template_with_http_info(template_ids, opts)

```ruby
begin
  # Get Bulk Send CSV Template
  data, status_code, headers = api_instance.get_bulk_send_csv_template_with_http_info(template_ids, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->get_bulk_send_csv_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **template_ids** | [**Array&lt;String&gt;**](String.md) |  |  |
| **base64** | **Boolean** |  | [optional] |

### Return type

**File**

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/octet-stream, application/json


## get_bulk_send_documents

> get_bulk_send_documents(id, opts)

Get Bulk Send Documents

Returns information about the Bulk Send.

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

api_instance = SignWell::BulkSendApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
opts = {
  limit: 56, # Integer | 
  page: 56 # Integer | 
}

begin
  # Get Bulk Send Documents
  api_instance.get_bulk_send_documents(id, opts)
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->get_bulk_send_documents: #{e}"
end
```

#### Using the get_bulk_send_documents_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_bulk_send_documents_with_http_info(id, opts)

```ruby
begin
  # Get Bulk Send Documents
  data, status_code, headers = api_instance.get_bulk_send_documents_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->get_bulk_send_documents_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **limit** | **Integer** |  | [optional][default to 10] |
| **page** | **Integer** |  | [optional][default to 1] |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_bulk_sends

> <BulkSendListResponse> list_bulk_sends(opts)

List Bulk Sendings

Returns information about the Bulk Send.

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

api_instance = SignWell::BulkSendApi.new
opts = {
  user_email: 'user_email_example', # String | 
  limit: 56, # Integer | 
  page: 56, # Integer | 
  api_application_id: '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
}

begin
  # List Bulk Sendings
  result = api_instance.list_bulk_sends(opts)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->list_bulk_sends: #{e}"
end
```

#### Using the list_bulk_sends_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkSendListResponse>, Integer, Hash)> list_bulk_sends_with_http_info(opts)

```ruby
begin
  # List Bulk Sendings
  data, status_code, headers = api_instance.list_bulk_sends_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkSendListResponse>
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->list_bulk_sends_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_email** | **String** |  | [optional] |
| **limit** | **Integer** |  | [optional][default to 10] |
| **page** | **Integer** |  | [optional][default to 1] |
| **api_application_id** | **String** |  | [optional] |

### Return type

[**BulkSendListResponse**](BulkSendListResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## validate_bulk_send_csv

> validate_bulk_send_csv(bulk_send_csv_request)

Validate Bulk Send CSV

Validates a Bulk Send CSV file before creating the Bulk Send. It will check the structure of the CSV and the data it contains, and return any errors found.

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

api_instance = SignWell::BulkSendApi.new
bulk_send_csv_request = SignWell::BulkSendCsvRequest.new({template_ids: ['template_ids_example'], bulk_send_csv: 'bulk_send_csv_example'}) # BulkSendCsvRequest | 

begin
  # Validate Bulk Send CSV
  api_instance.validate_bulk_send_csv(bulk_send_csv_request)
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->validate_bulk_send_csv: #{e}"
end
```

#### Using the validate_bulk_send_csv_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> validate_bulk_send_csv_with_http_info(bulk_send_csv_request)

```ruby
begin
  # Validate Bulk Send CSV
  data, status_code, headers = api_instance.validate_bulk_send_csv_with_http_info(bulk_send_csv_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling BulkSendApi->validate_bulk_send_csv_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bulk_send_csv_request** | [**BulkSendCsvRequest**](BulkSendCsvRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

