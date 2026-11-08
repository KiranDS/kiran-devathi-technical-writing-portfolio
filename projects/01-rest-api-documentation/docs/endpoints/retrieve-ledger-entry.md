# Retrieve a ledger entry

Retrieves one ledger entry by its ID.

## Request

```http
GET /v1/ledger-entries/{entry_id}
```

### Path parameter

| Parameter | Type | Required | Description |
|---|---|---:|---|
| `entry_id` | string | Yes | Opaque ID of the ledger entry. |

### Required headers

| Header | Required | Description |
|---|---:|---|
| `Authorization` | Yes | Bearer token with `ledger.entries:read` and account access. |
| `Accept` | Recommended | `application/json`. |

### Example request

```bash
curl --request GET \
  --url "https://api.ledgerlite.example/v1/ledger-entries/le_01J9M8K7W6V5T4S3R2Q1P0NABC" \
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \
  --header "Accept: application/json"
```

### Success response

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

## Responses

| Status | Meaning |
|---|---|
| `200` | Entry retrieved. |
| `401` | Missing or invalid token. |
| `403` | Caller lacks required scope. |
| `404` | Entry does not exist or is not visible. |
| `429` | Rate limit exceeded. |
| `500` | Unexpected server error. |
| `503` | Service temporarily unavailable. |

The sample uses `404` for nonexistent and inaccessible resources to avoid confirming the existence of resources outside the caller's access. Confirm this information-disclosure policy with security stakeholders in a real implementation.
