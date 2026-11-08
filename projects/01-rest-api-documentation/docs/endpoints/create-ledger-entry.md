# Create a ledger entry

Creates an immutable ledger entry for an account.

## Request

```http
POST /v1/ledger-entries
```

### Required headers

| Header | Required | Description |
|---|---:|---|
| `Authorization` | Yes | Bearer token with `ledger.entries:write` and account access. |
| `Content-Type` | Yes | `application/json`. |
| `Accept` | Recommended | `application/json`. |
| `Idempotency-Key` | Yes | Unique key for this logical create operation. |

### Request body

| Field | Type | Required | Constraints | Description |
|---|---|---:|---|---|
| `account_id` | string | Yes | Non-empty | Account to which the entry belongs. |
| `amount_minor` | integer | Yes | Greater than zero | Amount in the currency's minor unit. |
| `currency` | string | Yes | Three uppercase letters in this sample | Currency code, such as `USD`. |
| `direction` | string | Yes | `credit` or `debit` | Whether the entry increases or decreases the ledger balance. |
| `description` | string | Yes | 1–140 characters | Human-readable reason for the entry. |

### Example request

```http
POST /v1/ledger-entries HTTP/1.1
Host: api.ledgerlite.example
Authorization: Bearer YOUR_ACCESS_TOKEN
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

### Success response

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

`201 Created` means the entry was created in this sample model. It does not imply payment settlement or funds availability.

## Responses

| Status | Meaning |
|---|---|
| `201` | Entry created. |
| `400` | Invalid JSON or field validation error. |
| `401` | Missing or invalid token. |
| `403` | Missing scope or account permission. |
| `404` | Account not found or not visible. |
| `409` | Idempotency key reused with a different body. |
| `429` | Rate limit exceeded. |
| `500` | Unexpected server error. |
| `503` | Service temporarily unavailable. |

## Retry behavior

If the client times out after sending the request, retry the same logical operation with the same idempotency key and identical body. Do not generate a new key for a retry. A new key can represent a new create operation and may create a duplicate entry.

## Implementation notes

Validate positive integer amounts before sending, store the returned entry ID, and do not assume that entries can be edited or deleted.
