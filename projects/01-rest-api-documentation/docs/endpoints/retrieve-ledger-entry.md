# Retrieve a ledger entry

Retrieves one ledger entry by its ID.

> LedgerLite is fictional. The hostname is reserved for examples and cannot process requests.

## Operation

```http
GET /v1/ledger-entries/{entry_id}
```

**Required scope:** `ledger.entries:read`

## Path parameter

| Parameter | Type | Required | Description |
|---|---|---:|---|
| `entry_id` | string | Yes | Opaque ID of the ledger entry. |

## Required headers

| Header | Required | Description |
|---|---:|---|
| `Authorization` | Yes | Bearer token with `ledger.entries:read` and access to the entry's account. |
| `Accept` | Recommended | `application/json`. |

## Example request

```bash
curl --request GET \\
  --url "https://api.ledgerlite.example/v1/ledger-entries/le_01J9M8K7W6V5T4S3R2Q1P0NABC" \\
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \\
  --header "Accept: application/json"
```

## Successful response

`200 OK`

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

## Error responses

| Status | Error code | Meaning |
|---|---|---|
| `401` | `unauthorized` | Missing, invalid, or expired token. |
| `403` | `forbidden` | Caller lacks the required scope or account permission. |
| `404` | `not_found` | Entry does not exist or is not visible. |
| `429` | `rate_limit_exceeded` | Rate limit exceeded. |
| `500` | `internal_error` | Unexpected server error. |
| `503` | `service_unavailable` | Service temporarily unavailable. |

See [Errors](../errors.md) for response bodies and recommended corrective actions.

The sample uses `404` for nonexistent and inaccessible resources to avoid confirming the existence of resources outside the caller's access. Confirm this information-disclosure policy with security stakeholders in a real implementation.
