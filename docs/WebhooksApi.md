# SignWell::WebhooksApi

All URIs are relative to *https://staging.signwell.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_webhook**](WebhooksApi.md#create_webhook) | **POST** /api/v1/hooks | Create Webhook |
| [**delete_webhook**](WebhooksApi.md#delete_webhook) | **DELETE** /api/v1/hooks/{id} | Delete Webhook |
| [**list_webhooks**](WebhooksApi.md#list_webhooks) | **GET** /api/v1/hooks | List Webhooks |


## create_webhook

> <WebhookResponse> create_webhook(create_webhook_request)

Create Webhook

Register a callback URL that we will post document events to.

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

api_instance = SignWell::WebhooksApi.new
create_webhook_request = SignWell::CreateWebhookRequest.new({callback_url: 'https://example.com/webhook'}) # CreateWebhookRequest | 

begin
  # Create Webhook
  result = api_instance.create_webhook(create_webhook_request)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling WebhooksApi->create_webhook: #{e}"
end
```

#### Using the create_webhook_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookResponse>, Integer, Hash)> create_webhook_with_http_info(create_webhook_request)

```ruby
begin
  # Create Webhook
  data, status_code, headers = api_instance.create_webhook_with_http_info(create_webhook_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookResponse>
rescue SignWell::ApiError => e
  puts "Error when calling WebhooksApi->create_webhook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_webhook_request** | [**CreateWebhookRequest**](CreateWebhookRequest.md) |  |  |

### Return type

[**WebhookResponse**](WebhookResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_webhook

> delete_webhook(id)

Delete Webhook

Deletes a registered callback URL that we are posting document events to.

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

api_instance = SignWell::WebhooksApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Delete Webhook
  api_instance.delete_webhook(id)
rescue SignWell::ApiError => e
  puts "Error when calling WebhooksApi->delete_webhook: #{e}"
end
```

#### Using the delete_webhook_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_webhook_with_http_info(id)

```ruby
begin
  # Delete Webhook
  data, status_code, headers = api_instance.delete_webhook_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling WebhooksApi->delete_webhook_with_http_info: #{e}"
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


## list_webhooks

> <Array<WebhookResponse>> list_webhooks

List Webhooks

List all the webhooks in the account.

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

api_instance = SignWell::WebhooksApi.new

begin
  # List Webhooks
  result = api_instance.list_webhooks
  p result
rescue SignWell::ApiError => e
  puts "Error when calling WebhooksApi->list_webhooks: #{e}"
end
```

#### Using the list_webhooks_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<WebhookResponse>>, Integer, Hash)> list_webhooks_with_http_info

```ruby
begin
  # List Webhooks
  data, status_code, headers = api_instance.list_webhooks_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<WebhookResponse>>
rescue SignWell::ApiError => e
  puts "Error when calling WebhooksApi->list_webhooks_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;WebhookResponse&gt;**](WebhookResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

