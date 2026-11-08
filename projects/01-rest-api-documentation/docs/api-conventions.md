# API conventions

## HTTP methods

| Method | Purpose | Behavior |
|---|---|---|
| `POST` | Create | Creates a ledger entry. |
| `GET` | Read | Retrieves one entry or lists entries. |

The sample does not expose update or delete operations. Ledger entries are immutable.

## Identifiers

IDs are opaque strings. Clients must not parse their internal structure.

- Account: `acct_8f3a21`
- Entry: `le_01J9M8K7W6V5T4S3R2Q1P0NABC`

## Amounts

`amount_minor` is a positive integer in the currency's minor unit. For USD, `12550` represents USD 125.50. Do not send floating-point values. Supported currencies and precision rules must be confirmed for a production API.

## Timestamps

Timestamps use ISO 8601 UTC format with a `Z` suffix, for example `2026-10-15T10:05:00Z`.

## Idempotency

The create endpoint requires `Idempotency-Key`. Reuse the same key and identical body when retrying the same logical operation after an uncertain network outcome. Reusing a key with a different body returns `409 Conflict` (`idempotency_key_reused`).

A production contract must specify key retention, accepted format, concurrency behavior, and response replay semantics. Those details are not specified here.

## Pagination

The list endpoint uses cursor-based pagination. `limit` sets the maximum page size; `cursor` identifies the next page. `next_cursor` is a string when another page is available and `null` when the current page is final. Treat cursors as opaque.

## Ordering and consistency

Entries are returned in descending `created_at` order. Snapshot consistency while new entries are created during pagination is not guaranteed by this sample.

## Status codes

| Status | Meaning |
|---|---|
| `200` | Read completed successfully. |
| `201` | Entry created. |
| `400` | Request syntax or validation error. |
| `401` | Authentication failed. |
| `403` | Caller lacks permission. |
| `404` | Resource not found or not visible. |
| `409` | Idempotency conflict. |
| `429` | Rate limit exceeded. |
| `500` | Unexpected server error. |
| `503` | Service temporarily unavailable. |
