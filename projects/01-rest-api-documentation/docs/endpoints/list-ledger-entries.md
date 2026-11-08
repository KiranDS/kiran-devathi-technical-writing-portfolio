# List ledger entries

Returns a page of ledger entries for an account.

## Request

```http
GET /v1/accounts/{account_id}/ledger-entries
```

### Path parameter

| Parameter | Type | Required | Description |
|---|---|---:|---|
| `account_id` | string | Yes | Account whose entries are requested. |

### Query parameters

| Parameter | Type | Required | Default | Constraints | Description |
|---|---|---:|---:|---|---|
| `limit` | integer | No | `20` | 1–100 | Maximum number of entries to return. |
| `cursor` | string | No | — | Opaque cursor | Position from which to continue. |
| `direction` | string | No | — | `credit` or `debit` | Filter by entry direction. |

### Example request

```http
GET /v1/accounts/acct_8f3a21/ledger-entries?limit=2&direction=credit
Authorization: Bearer YOUR_ACCESS_TOKEN
Accept: application/json
```

### Success response

`200 OK`

```json
{
  "data": [
    {
      "id": "le_01J9M8K7W6V5T4S3R2Q1P0NABC",
      "account_id": "acct_8f3a21",
      "amount_minor": 12550,
      "currency": "USD",
      "direction": "credit",
      "description": "Invoice INV-2048 payment",
      "status": "posted",
      "created_at": "2026-10-15T10:05:00Z"
    },
    {
      "id": "le_01J9M7H6G5F4E3D2C1B0A9ZXYZ",
      "account_id": "acct_8f3a21",
      "amount_minor": 5000,
      "currency": "USD",
      "direction": "credit",
      "description": "Account adjustment",
      "status": "posted",
      "created_at": "2026-10-14T08:20:00Z"
    }
  ],
  "next_cursor": "eyJvZmZzZXQiOjJ9"
}
```

The cursor is illustrative and must be treated as opaque.

### Request the next page

Pass `next_cursor` unchanged as the `cursor` query parameter:

```http
GET /v1/accounts/acct_8f3a21/ledger-entries?limit=2&direction=credit&cursor=eyJvZmZzZXQiOjJ9
```

When no more results are available, `next_cursor` is `null`.

## Responses

| Status | Meaning |
|---|---|
| `200` | Page returned successfully. |
| `400` | Invalid limit, cursor, or direction. |
| `401` | Missing or invalid token. |
| `403` | Caller lacks account read access. |
| `404` | Account does not exist or is not visible. |
| `429` | Rate limit exceeded. |
| `500` | Unexpected server error. |
| `503` | Service temporarily unavailable. |

## Pagination guidance

Use the returned cursor unchanged. Continue until `next_cursor` is `null`. A page can contain fewer records than the requested limit. Do not derive a cursor from an entry ID or offset. Snapshot consistency while new entries are created during pagination is not guaranteed by this sample.
