# List ledger entries

Returns a page of ledger entries for an account.

> LedgerLite is fictional. The hostname is reserved for examples and cannot process requests.

## Operation

```http
GET /v1/accounts/{account_id}/ledger-entries
```

**Required scope:** `ledger.entries:read`

## Parameters

### Path parameter

| Parameter | Type | Required | Description |
|---|---|---:|---|
| `account_id` | string | Yes | Account whose entries are requested. |

### Query parameters

| Parameter | Type | Required | Default | Constraints | Description |
|---|---|---:|---:|---|---|
| `limit` | integer | No | `20` | 1–100 | Maximum number of entries to return. |
| `cursor` | string | No | — | Opaque string | Position from which to continue. |
| `direction` | string | No | — | `credit` or `debit` | Filter by entry direction. |

## Example request

```http
GET /v1/accounts/acct_8f3a21/ledger-entries?limit=2&direction=credit
Authorization: Bearer EXAMPLE_ACCESS_TOKEN
Accept: application/json
```

## Successful response: first page

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

## Request the next page

Pass `next_cursor` unchanged as the `cursor` query parameter:

```http
GET /v1/accounts/acct_8f3a21/ledger-entries?limit=2&direction=credit&cursor=eyJvZmZzZXQiOjJ9
```

When no more results are available, `next_cursor` is `null`. Example final-page response:

```json
{
  "data": [
    {
      "id": "le_01J9M6A5B4C3D2E1F0G9H8I7JKLM",
      "account_id": "acct_8f3a21",
      "amount_minor": 2500,
      "currency": "USD",
      "direction": "debit",
      "description": "Monthly service fee",
      "status": "posted",
      "created_at": "2026-10-13T07:15:00Z"
    }
  ],
  "next_cursor": null
}
```

## Error responses

| Status | Error code | Meaning |
|---|---|---|
| `400` | `invalid_request` | Invalid limit, cursor, or direction. |
| `401` | `unauthorized` | Missing, invalid, or expired token. |
| `403` | `forbidden` | Caller lacks account read access. |
| `404` | `not_found` | Account does not exist or is not visible. |
| `429` | `rate_limit_exceeded` | Rate limit exceeded. |
| `500` | `internal_error` | Unexpected server error. |
| `503` | `service_unavailable` | Service temporarily unavailable. |

See [Errors](../errors.md) for response bodies and recommended corrective actions.

## Pagination guidance

Use the returned cursor unchanged. Continue until `next_cursor` is `null`. A page can contain fewer records than the requested limit. Do not derive a cursor from an entry ID or offset. Snapshot consistency while new entries are created during pagination is not guaranteed by this sample.
