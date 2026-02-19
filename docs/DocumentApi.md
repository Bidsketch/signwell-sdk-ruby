# SignWell::DocumentApi

All URIs are relative to *https://www.signwell.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_document**](DocumentApi.md#create_document) | **POST** /api/v1/documents | Create Document |
| [**create_document_from_template**](DocumentApi.md#create_document_from_template) | **POST** /api/v1/document_templates/documents | Create Document from Template |
| [**delete_document**](DocumentApi.md#delete_document) | **DELETE** /api/v1/documents/{id} | Delete Document |
| [**get_completed_pdf**](DocumentApi.md#get_completed_pdf) | **GET** /api/v1/documents/{id}/completed_pdf | Completed PDF |
| [**get_document**](DocumentApi.md#get_document) | **GET** /api/v1/documents/{id} | Get Document |
| [**send_document**](DocumentApi.md#send_document) | **POST** /api/v1/documents/{id}/send | Update and Send Document |
| [**send_reminder**](DocumentApi.md#send_reminder) | **POST** /api/v1/documents/{id}/remind | Send Reminder |


## create_document

> <DocumentResponse> create_document(document_request)

Create Document

Creates and optionally sends a new document for signing. If `draft` is set to true the document will not be sent.

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

api_instance = SignWell::DocumentApi.new
document_request = SignWell::DocumentRequest.new({files: [SignWell::FilesInner.new({name: 'name_example'})], recipients: [SignWell::RecipientsInner.new({id: 'id_example', email: 'email_example'})]}) # DocumentRequest | 

begin
  # Create Document
  result = api_instance.create_document(document_request)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->create_document: #{e}"
end
```

#### Using the create_document_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentResponse>, Integer, Hash)> create_document_with_http_info(document_request)

```ruby
begin
  # Create Document
  data, status_code, headers = api_instance.create_document_with_http_info(document_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentResponse>
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->create_document_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **document_request** | [**DocumentRequest**](DocumentRequest.md) |  |  |

### Return type

[**DocumentResponse**](DocumentResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_document_from_template

> <DocumentFromTemplateResponse> create_document_from_template(document_from_template_request)

Create Document from Template

Creates and optionally sends a new document for signing. If `draft` is set to true the document will not be sent.

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

api_instance = SignWell::DocumentApi.new
document_from_template_request = SignWell::DocumentFromTemplateRequest.new({recipients: [SignWell::TemplateRecipientsInner.new({id: 'id_example', email: 'email_example'})]}) # DocumentFromTemplateRequest | 

begin
  # Create Document from Template
  result = api_instance.create_document_from_template(document_from_template_request)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->create_document_from_template: #{e}"
end
```

#### Using the create_document_from_template_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentFromTemplateResponse>, Integer, Hash)> create_document_from_template_with_http_info(document_from_template_request)

```ruby
begin
  # Create Document from Template
  data, status_code, headers = api_instance.create_document_from_template_with_http_info(document_from_template_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentFromTemplateResponse>
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->create_document_from_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **document_from_template_request** | [**DocumentFromTemplateRequest**](DocumentFromTemplateRequest.md) |  |  |

### Return type

[**DocumentFromTemplateResponse**](DocumentFromTemplateResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_document

> delete_document(id)

Delete Document

Deletes a document. Deleting a document will also cancel document signing (if in progress).  Supply the unique document ID from either a Create Document request or document page URL.

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

api_instance = SignWell::DocumentApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Delete Document
  api_instance.delete_document(id)
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->delete_document: #{e}"
end
```

#### Using the delete_document_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_document_with_http_info(id)

```ruby
begin
  # Delete Document
  data, status_code, headers = api_instance.delete_document_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->delete_document_with_http_info: #{e}"
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


## get_completed_pdf

> <CompletedPdfResponse> get_completed_pdf(id, opts)

Completed PDF

Gets a completed document PDF or ZIP file. Supply the unique document ID from either a document creation request or document page URL.

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

api_instance = SignWell::DocumentApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
opts = {
  url_only: true, # Boolean | 
  audit_page: true, # Boolean | 
  file_format: SignWell::FileFormat::PDF # FileFormat | 
}

begin
  # Completed PDF
  result = api_instance.get_completed_pdf(id, opts)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->get_completed_pdf: #{e}"
end
```

#### Using the get_completed_pdf_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CompletedPdfResponse>, Integer, Hash)> get_completed_pdf_with_http_info(id, opts)

```ruby
begin
  # Completed PDF
  data, status_code, headers = api_instance.get_completed_pdf_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CompletedPdfResponse>
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->get_completed_pdf_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **url_only** | **Boolean** |  | [optional][default to false] |
| **audit_page** | **Boolean** |  | [optional][default to true] |
| **file_format** | [**FileFormat**](.md) |  | [optional] |

### Return type

[**CompletedPdfResponse**](CompletedPdfResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_document

> <DocumentResponse> get_document(id)

Get Document

Returns a document and all associated document data. Supply the unique document ID from either a document creation request or Document page URL.

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

api_instance = SignWell::DocumentApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Get Document
  result = api_instance.get_document(id)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->get_document: #{e}"
end
```

#### Using the get_document_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentResponse>, Integer, Hash)> get_document_with_http_info(id)

```ruby
begin
  # Get Document
  data, status_code, headers = api_instance.get_document_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentResponse>
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->get_document_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**DocumentResponse**](DocumentResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## send_document

> <DocumentResponse> send_document(id, update_document_and_send_request)

Update and Send Document

Updates a draft document and sends it to be signed by recipients.

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

api_instance = SignWell::DocumentApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
update_document_and_send_request = SignWell::UpdateDocumentAndSendRequest.new # UpdateDocumentAndSendRequest | 

begin
  # Update and Send Document
  result = api_instance.send_document(id, update_document_and_send_request)
  p result
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->send_document: #{e}"
end
```

#### Using the send_document_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentResponse>, Integer, Hash)> send_document_with_http_info(id, update_document_and_send_request)

```ruby
begin
  # Update and Send Document
  data, status_code, headers = api_instance.send_document_with_http_info(id, update_document_and_send_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentResponse>
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->send_document_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **update_document_and_send_request** | [**UpdateDocumentAndSendRequest**](UpdateDocumentAndSendRequest.md) |  |  |

### Return type

[**DocumentResponse**](DocumentResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## send_reminder

> send_reminder(id, send_reminder_request)

Send Reminder

Sends a reminder email to recipients that have not signed yet.

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

api_instance = SignWell::DocumentApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
send_reminder_request = SignWell::SendReminderRequest.new # SendReminderRequest | 

begin
  # Send Reminder
  api_instance.send_reminder(id, send_reminder_request)
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->send_reminder: #{e}"
end
```

#### Using the send_reminder_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> send_reminder_with_http_info(id, send_reminder_request)

```ruby
begin
  # Send Reminder
  data, status_code, headers = api_instance.send_reminder_with_http_info(id, send_reminder_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue SignWell::ApiError => e
  puts "Error when calling DocumentApi->send_reminder_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **send_reminder_request** | [**SendReminderRequest**](SendReminderRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

