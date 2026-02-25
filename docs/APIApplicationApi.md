# SignWell::APIApplicationApi

All URIs are relative to *https://staging.signwell.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_api_application**](APIApplicationApi.md#delete_api_application) | **DELETE** /api/v1/api_applications/{id} | Delete API Application |
| [**get_api_application**](APIApplicationApi.md#get_api_application) | **GET** /api/v1/api_applications/{id} | Get API Application |


## delete_api_application

> delete_api_application(id)

Delete API Application

Deletes an API Application from an account. Supply the unique Application ID from either the Create API Application response or the API Application edit page

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

api_instance = SignWell::APIApplicationApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Delete API Application
  api_instance.delete_api_application(id)
rescue SignWell::ApiError => e
  puts "Error when calling APIApplicationApi->delete_api_application: #{e}"
end
```

#### Using the delete_api_application_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_api_application_with_http_info(id)

```ruby
begin
  # Delete API Application
  data, status_code, headers = api_instance.delete_api_application_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling APIApplicationApi->delete_api_application_with_http_info: #{e}"
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


## get_api_application

> <ApiApplicationResponse> get_api_application(id)

Get API Application

Gets the details of a specific API Application within an account. Supply the unique Application ID from either the Create API Application response or the API Application edit page.

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

api_instance = SignWell::APIApplicationApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Get API Application
  result = api_instance.get_api_application(id)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling APIApplicationApi->get_api_application: #{e}"
end
```

#### Using the get_api_application_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ApiApplicationResponse>, Integer, Hash)> get_api_application_with_http_info(id)

```ruby
begin
  # Get API Application
  data, status_code, headers = api_instance.get_api_application_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiApplicationResponse>
rescue SignWell::ApiError => e
  puts "Error when calling APIApplicationApi->get_api_application_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**ApiApplicationResponse**](ApiApplicationResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

