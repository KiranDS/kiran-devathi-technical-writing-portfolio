# Create a ledger entry

Creates a ledger entry.

## Endpoint

```http
POST /v1/ledger-entries
```

## Authentication

Bearer token required.

## Request headers

| Header | Required | Description |
|---|---:|---|
| `Authorization` | Yes | Bearer access token. |
| `Content-Type` | Yes | Must be `application/json`. |
| `Accept` | No | Response format requested by the client. |

## Request body

| Field | Type | Required | Description |
|---|---|---:|---|
| `amount` | number | Yes | Amount to record. Must be greater than zero in this example. |
| `currency` | string | Yes | Three-letter currency code, such as `USD`. |
| `description` | string | Yes | Short description of the ledger entry. |

## Example request

```http
POST /v1/ledger-entries HTTP/1.1
Host: api.ledgerlite.example
Authorization: Bearer YOUR_API_TOKEN
Content-Type: application/json
Accept: application/json

{
  "amount": 125.50,
  "currency": "USD",
  "description": "Invoice payment"
}
```

## Example success response

```http
HTTP/1.1 201 Created
Content-Type: application/json
```

```json
{
  "id": "le_100046",
  "amount": 125.50,
  "currency": "USD",
  "description": "Invoice payment",
  "status": "pending",
  "created_at": "2026-10-15T10:05:00Z"
}
```

## Validation considerations

A production API reference should specify:

- Whether amounts support decimal values and the permitted precision.
- Which currency codes are accepted.
- Maximum description length and permitted characters.
- Whether an idempotency key is required to prevent duplicate submissions.
- Whether the initial status can vary by account or transaction type.

These details are intentionally identified as questions rather than invented API behavior.
