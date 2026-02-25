# SignWell::MeApi

All URIs are relative to *https://staging.signwell.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_me**](MeApi.md#get_me) | **GET** /api/v1/me | Get credentials |


## get_me

> <MeResponse> get_me

Get credentials

Retrieves the account information associated with the API key being used.

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

api_instance = SignWell::MeApi.new

begin
  # Get credentials
  result = api_instance.get_me
  p result
rescue SignWell::ApiError => e
  puts "Error when calling MeApi->get_me: #{e}"
end
```

#### Using the get_me_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MeResponse>, Integer, Hash)> get_me_with_http_info

```ruby
begin
  # Get credentials
  data, status_code, headers = api_instance.get_me_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MeResponse>
rescue SignWell::ApiError => e
  puts "Error when calling MeApi->get_me_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**MeResponse**](MeResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

