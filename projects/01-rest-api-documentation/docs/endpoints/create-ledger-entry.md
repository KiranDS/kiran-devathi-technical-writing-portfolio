# Create a ledger entry

Creates an immutable ledger entry for an account.

> LedgerLite is fictional. The hostname is reserved for examples and cannot process requests.

## Operation

```http
POST /v1/ledger-entries
```

**Required scopes:** `ledger.entries:write`  
**Idempotency:** Required through `Idempotency-Key`.

## Request headers

| Header | Required | Description |
|---|---:|---|
| `Authorization` | Yes | Bearer token with `ledger.entries:write` and access to the target account. |
| `Content-Type` | Yes | `application/json`. |
| `Accept` | Recommended | `application/json`. |
| `Idempotency-Key` | Yes | Unique key for this logical create operation; 1–255 characters. |

## Request body

| Field | Type | Required | Constraints | Description |
|---|---|---:|---|---|
| `account_id` | string | Yes | Non-empty | Account to which the entry belongs. |
| `amount_minor` | integer | Yes | Minimum `1` | Positive amount in the currency's minor unit. For USD, `12550` represents USD 125.50. |
| `currency` | string | Yes | `^[A-Z]{3}$` | Three-letter uppercase currency code. Supported currencies are not enumerated in this sample. |
| `direction` | string | Yes | `credit` or `debit` | Whether the entry increases or decreases the ledger balance. |
| `description` | string | Yes | 1–140 characters | Human-readable reason for the entry. |

Unknown properties are not accepted by the sample request schema.

## Example request

```http
POST /v1/ledger-entries HTTP/1.1
Host: api.ledgerlite.example
Authorization: Bearer EXAMPLE_ACCESS_TOKEN
Content-Type: application/json
Accept: application/json
Idempotency-Key: 8e03978e-40d5-43e8-bc93-6894a57f9324

{
  "account_id": "acct_8f3a21",
  "amount_minor": 12550,
  "currency": "USD",
  "direction": "credit",
  "description": "Invoice INV-2048 payment"
}
```

## Successful response

`201 Created`

```json
{
  "id": "le_01J9M8K7W6V5T4S3R2Q1P0NABC",
  "account_id": "acct_8f3a21",
  "amount_minor": 12550,
  "currency": "USD",
  "direction": "credit",
  "description": "Invoice INV-2048 payment",
  "status": "posted",
  "created_at": "2026-10-15T10:05:00Z"
}
```

| Response field | Type | Description |
|---|---|---|
| `id` | string | Server-assigned immutable entry ID. |
| `account_id` | string | Account associated with the entry. |
| `amount_minor` | integer | Amount in currency minor units. |
| `currency` | string | Three-letter uppercase currency code. |
| `direction` | string | `credit` or `debit`. |
| `description` | string | Description supplied in the request. |
| `status` | string | `posted` in this sample model. |
| `created_at` | string | UTC timestamp in RFC 3339 date-time format. |

`201 Created` means the entry was created in this sample model. It does not imply settlement or funds availability.

## Error responses

| Status | Error code | Meaning |
|---|---|---|
| `400` | `invalid_request` | Invalid JSON or field validation error. |
| `401` | `unauthorized` | Missing, invalid, or expired token. |
| `403` | `forbidden` | Missing scope or account permission. |
| `404` | `not_found` | Account does not exist or is not visible. |
| `409` | `idempotency_key_reused` | Key was reused with a different request body. |
| `429` | `rate_limit_exceeded` | Rate limit exceeded. |
| `500` | `internal_error` | Unexpected server error. |
| `503` | `service_unavailable` | Service temporarily unavailable. |

See [Errors](../errors.md) for response bodies and recommended corrective actions.

## Retry behavior

If the client times out after sending the request, retry the same logical operation with the same idempotency key and identical body. Do not generate a new key for a retry. A new key can represent a new create operation and may create a duplicate entry.

## Implementation notes

Validate positive integer amounts before sending, store the returned entry ID, and do not assume entries can be edited or deleted.
