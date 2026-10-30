# Changelog

## 0.2.0 — 2026-10-29

### Added

- Support the current documented SMS delivery fields, conditional rules and decisions, and embedded signing/branding options.
- Expose 21 CFR Part 11 indicators in document responses and updated passcode-delivery settings.
- Add the document authentication update endpoint.

### Changed

- Retry explicit HTTP 429 responses up to twice by default, with Retry-After, bounded backoff, and opt-out.
- Preserve future enum response values and false/integer union values.

- Refresh generated resources, request/response models, and API documentation from the current published SignWell API.
- Regenerate with OpenAPI Generator 7.26.0 while preserving existing minimum runtimes.

### Dependencies

- Refresh the Ruby dependency lockfile.

For a detailed list of changes in each release, see
[GitHub Releases](https://github.com/Bidsketch/signwell-sdk-ruby/releases).
