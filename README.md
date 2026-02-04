# Signwell SDK Ruby API library

The Signwell SDK Ruby library provides convenient access to the Signwell SDK REST API from any Ruby 3.2.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/Bidsketch/signwell-sdk-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

It is generated with [Stainless](https://www.stainless.com/).

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/signwell_sdk).

The REST API documentation can be found on [developers.signwell.com](https://developers.signwell.com/).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "signwell_sdk", "~> 0.0.1.pre.alpha.1"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "signwell_sdk"

signwell_sdk = SignwellSDK::Client.new(
  api_key: ENV["SIGNWELL_SDK_API_KEY"] # This is the default and can be omitted
)

document = signwell_sdk.v1.documents.create(
  files: [{name: "employment_agreement.pdf", file_url: "https://example.com/documents/employment_agreement.pdf"}],
  recipients: [
    {id: "1", name: "John Doe", email: "john.doe@example.com"},
    {id: "2", name: "HR Manager", email: "hr@company.com"}
  ],
  allow_decline: true,
  apply_signing_order: true,
  copied_contacts: [{name: "Legal Department", email: "legal@company.com"}],
  decline_redirect_url: "https://example.com/signing-declined",
  expires_in: 14,
  fields: [
    [
      {x: 150, y: 600, page: 1, recipient_id: "1", type: "signature", required: true, api_id: "employee_signature"},
      {x: 150, y: 650, page: 1, recipient_id: "1", type: "date", required: true, label: "Date Signed"},
      {x: 400, y: 600, page: 1, recipient_id: "2", type: "signature", required: true, api_id: "hr_signature"}
    ]
  ],
  message: "Hi John,\n\nPlease review and sign the attached employment agreement at your earliest convenience.\n\nBest regards,\nHR Team",
  metadata: {employee_id: "EMP-2024-001", department: "Engineering", contract_type: "full_time"},
  name: "Employment Agreement - John Doe",
  redirect_url: "https://example.com/signing-complete",
  reminders: true,
  subject: "Action Required: Please sign your Employment Agreement",
  test_mode: true
)

puts(document.id)
```

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `SignwellSDK::Errors::APIError` will be thrown:

```ruby
begin
  document = signwell_sdk.v1.documents.list
rescue SignwellSDK::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue SignwellSDK::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue SignwellSDK::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
signwell_sdk = SignwellSDK::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
signwell_sdk.v1.documents.list(request_options: {max_retries: 5})
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
signwell_sdk = SignwellSDK::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
signwell_sdk.v1.documents.list(request_options: {timeout: 5})
```

On timeout, `SignwellSDK::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `SignwellSDK::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
documents =
  signwell_sdk.v1.documents.list(
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(documents[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `SignwellSDK::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `SignwellSDK::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
signwell_sdk.v1.documents.create(
  files: [
    SignwellSDK::V1::DocumentFile.new(
      name: "employment_agreement.pdf",
      file_url: "https://example.com/documents/employment_agreement.pdf"
    )
  ],
  recipients: [
    SignwellSDK::V1::DocumentCreateParams::Recipient.new(
      id: "1",
      name: "John Doe",
      email: "john.doe@example.com"
    ),
    SignwellSDK::V1::DocumentCreateParams::Recipient.new(id: "2", name: "HR Manager", email: "hr@company.com")
  ],
  allow_decline: true,
  apply_signing_order: true,
  copied_contacts: [SignwellSDK::V1::CopiedContact.new(name: "Legal Department", email: "legal@company.com")],
  decline_redirect_url: "https://example.com/signing-declined",
  expires_in: 14,
  fields: [
    [
      SignwellSDK::V1::DocumentCreateParams::Field.new(
        x: 150,
        y_: 600,
        page: 1,
        recipient_id: "1",
        type: "signature",
        required: true,
        api_id: "employee_signature"
      ),
      SignwellSDK::V1::DocumentCreateParams::Field.new(
        x: 150,
        y_: 650,
        page: 1,
        recipient_id: "1",
        type: "date",
        required: true,
        label: "Date Signed"
      ),
      SignwellSDK::V1::DocumentCreateParams::Field.new(
        x: 400,
        y_: 600,
        page: 1,
        recipient_id: "2",
        type: "signature",
        required: true,
        api_id: "hr_signature"
      )
    ]
  ],
  message: "Hi John,\n\nPlease review and sign the attached employment agreement at your earliest convenience.\n\nBest regards,\nHR Team",
  metadata: {employee_id: "EMP-2024-001", department: "Engineering", contract_type: "full_time"},
  name: "Employment Agreement - John Doe",
  redirect_url: "https://example.com/signing-complete",
  reminders: true,
  subject: "Action Required: Please sign your Employment Agreement",
  test_mode: true
)
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
signwell_sdk.v1.documents.create(
  files: [{name: "employment_agreement.pdf", file_url: "https://example.com/documents/employment_agreement.pdf"}],
  recipients: [
    {id: "1", name: "John Doe", email: "john.doe@example.com"},
    {id: "2", name: "HR Manager", email: "hr@company.com"}
  ],
  allow_decline: true,
  apply_signing_order: true,
  copied_contacts: [{name: "Legal Department", email: "legal@company.com"}],
  decline_redirect_url: "https://example.com/signing-declined",
  expires_in: 14,
  fields: [
    [
      {x: 150, y: 600, page: 1, recipient_id: "1", type: "signature", required: true, api_id: "employee_signature"},
      {x: 150, y: 650, page: 1, recipient_id: "1", type: "date", required: true, label: "Date Signed"},
      {x: 400, y: 600, page: 1, recipient_id: "2", type: "signature", required: true, api_id: "hr_signature"}
    ]
  ],
  message: "Hi John,\n\nPlease review and sign the attached employment agreement at your earliest convenience.\n\nBest regards,\nHR Team",
  metadata: {employee_id: "EMP-2024-001", department: "Engineering", contract_type: "full_time"},
  name: "Employment Agreement - John Doe",
  redirect_url: "https://example.com/signing-complete",
  reminders: true,
  subject: "Action Required: Please sign your Employment Agreement",
  test_mode: true
)

# You can also splat a full Params class:
params = SignwellSDK::V1::DocumentCreateParams.new(
  files: [
    SignwellSDK::V1::DocumentFile.new(
      name: "employment_agreement.pdf",
      file_url: "https://example.com/documents/employment_agreement.pdf"
    )
  ],
  recipients: [
    SignwellSDK::V1::DocumentCreateParams::Recipient.new(
      id: "1",
      name: "John Doe",
      email: "john.doe@example.com"
    ),
    SignwellSDK::V1::DocumentCreateParams::Recipient.new(id: "2", name: "HR Manager", email: "hr@company.com")
  ],
  allow_decline: true,
  apply_signing_order: true,
  copied_contacts: [SignwellSDK::V1::CopiedContact.new(name: "Legal Department", email: "legal@company.com")],
  decline_redirect_url: "https://example.com/signing-declined",
  expires_in: 14,
  fields: [
    [
      SignwellSDK::V1::DocumentCreateParams::Field.new(
        x: 150,
        y_: 600,
        page: 1,
        recipient_id: "1",
        type: "signature",
        required: true,
        api_id: "employee_signature"
      ),
      SignwellSDK::V1::DocumentCreateParams::Field.new(
        x: 150,
        y_: 650,
        page: 1,
        recipient_id: "1",
        type: "date",
        required: true,
        label: "Date Signed"
      ),
      SignwellSDK::V1::DocumentCreateParams::Field.new(
        x: 400,
        y_: 600,
        page: 1,
        recipient_id: "2",
        type: "signature",
        required: true,
        api_id: "hr_signature"
      )
    ]
  ],
  message: "Hi John,\n\nPlease review and sign the attached employment agreement at your earliest convenience.\n\nBest regards,\nHR Team",
  metadata: {employee_id: "EMP-2024-001", department: "Engineering", contract_type: "full_time"},
  name: "Employment Agreement - John Doe",
  redirect_url: "https://example.com/signing-complete",
  reminders: true,
  subject: "Action Required: Please sign your Employment Agreement",
  test_mode: true
)
signwell_sdk.v1.documents.create(**params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :pdf
puts(SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::PDF)

# Revealed type: `T.all(SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat, Symbol)`
T.reveal_type(SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::PDF)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
signwell_sdk.v1.documents.retrieve_completed_pdf(
  file_format: SignwellSDK::V1::DocumentRetrieveCompletedPdfParams::FileFormat::PDF,
  # …
)

# Literal values are also permissible:
signwell_sdk.v1.documents.retrieve_completed_pdf(
  file_format: :pdf,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/Bidsketch/signwell-sdk-ruby/tree/main/CONTRIBUTING.md).
