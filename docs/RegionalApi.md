# SignWell::RegionalApi

All URIs are relative to *https://www.signwell.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_nom151_certificate**](RegionalApi.md#get_nom151_certificate) | **GET** /api/v1/documents/{id}/nom151_certificate | MX – NOM-151 Certificate |


## get_nom151_certificate

> <Nom151UrlResponse> get_nom151_certificate(id, opts)

MX – NOM-151 Certificate

Download NOM-151 certificate for a completed document. Returns a ZIP file, download URL, or raw certificate data based on query parameters.

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

api_instance = SignWell::RegionalApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
opts = {
  url_only: true, # Boolean | If true, returns JSON with download URL instead of downloading the file
  object_only: true # Boolean | 
}

begin
  # MX – NOM-151 Certificate
  result = api_instance.get_nom151_certificate(id, opts)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling RegionalApi->get_nom151_certificate: #{e}"
end
```

#### Using the get_nom151_certificate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Nom151UrlResponse>, Integer, Hash)> get_nom151_certificate_with_http_info(id, opts)

```ruby
begin
  # MX – NOM-151 Certificate
  data, status_code, headers = api_instance.get_nom151_certificate_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Nom151UrlResponse>
rescue SignWell::ApiError => e
  puts "Error when calling RegionalApi->get_nom151_certificate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **url_only** | **Boolean** | If true, returns JSON with download URL instead of downloading the file | [optional][default to false] |
| **object_only** | **Boolean** |  | [optional][default to false] |

### Return type

[**Nom151UrlResponse**](Nom151UrlResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

