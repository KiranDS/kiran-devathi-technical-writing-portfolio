# Errors

LedgerLite uses standard HTTP status codes and a consistent JSON error envelope. Clients should use the HTTP status and stable `error.code` to determine how to handle a failure. The human-readable `error.message` is intended for troubleshooting and must not be parsed for program logic.

> All responses in this guide are illustrative. LedgerLite is fictional and has no running service.

## Error response format

```json
{
  "error": {
    "code": "invalid_request",
    "message": "The amount_minor field must be greater than zero.",
    "request_id": "req_7f31a2"
  }
}
```

| Field | Type | Required | Description |
|---|---|---:|---|
| `error.code` | string | Yes | Stable machine-readable error identifier. |
| `error.message` | string | Yes | Human-readable explanation. Do not parse it for program logic. |
| `error.request_id` | string | Yes | Identifier to include in a support request. |

## HTTP status codes

| Status | Error code | Meaning | Client action |
|---|---|---|---|
| `400 Bad Request` | `invalid_request` | Request syntax or field validation failed. | Correct the request; do not retry unchanged. |
| `401 Unauthorized` | `unauthorized` | Bearer token is missing, invalid, or expired. | Obtain a valid token, then retry. |
| `403 Forbidden` | `forbidden` | Token lacks the required scope or account permission. | Request the required permission; refreshing the same token may not help. |
| `404 Not Found` | `not_found` | Resource does not exist or is not visible to the caller. | Verify the identifier and account access. |
| `409 Conflict` | `idempotency_key_reused` | An idempotency key was previously used with a different request body. | Resolve the key/body mismatch; do not change the body while reusing the key. |
| `429 Too Many Requests` | `rate_limit_exceeded` | Request rate limit was exceeded. | Wait before retrying; honor `Retry-After` when supplied. |
| `500 Internal Server Error` | `internal_error` | Unexpected server error. | Retry only when safe; provide the request ID if escalating. |
| `503 Service Unavailable` | `service_unavailable` | Service is temporarily unavailable. | Retry with bounded backoff; honor `Retry-After` when supplied. |

## Example: validation failure

`400 Bad Request`

```json
{
  "error": {
    "code": "invalid_request",
    "message": "The amount_minor field must be greater than zero.",
    "request_id": "req_7f31a2"
  }
}
```

**Resolution:** Set `amount_minor` to a positive integer and validate the request body before resubmitting it.

## Example: missing or invalid token

`401 Unauthorized`

```http
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Bearer realm="ledgerlite", error="invalid_token"
Content-Type: application/json
```

```json
{
  "error": {
    "code": "unauthorized",
    "message": "A valid bearer access token is required.",
    "request_id": "req_7f31a3"
  }
}
```

**Resolution:** Obtain a valid access token and send it using `Authorization: Bearer <token>`. Do not send credentials in the URL.

## Example: insufficient scope or account permission

`403 Forbidden`

```json
{
  "error": {
    "code": "forbidden",
    "message": "The access token does not grant ledger.entries:write for this account.",
    "request_id": "req_7f31a4"
  }
}
```

**Resolution:** Ask the service administrator to grant the required scope and account access. Do not assume that a valid token has access to every account.

## Example: resource not found

`404 Not Found`

```json
{
  "error": {
    "code": "not_found",
    "message": "The requested resource was not found.",
    "request_id": "req_7f31a5"
  }
}
```

The sample uses the same response for nonexistent and inaccessible resources. This avoids confirming the existence of resources outside the caller's access. A production implementation must confirm this information-disclosure policy with Security.

## Example: idempotency conflict

`409 Conflict`

```json
{
  "error": {
    "code": "idempotency_key_reused",
    "message": "This Idempotency-Key was previously used with a different request body.",
    "request_id": "req_91bc02"
  }
}
```

**Resolution:** Use the original request body with the original key when retrying the same logical operation. Generate a new key only for a genuinely new create operation.

## Example: rate limit exceeded

`429 Too Many Requests`

```http
HTTP/1.1 429 Too Many Requests
Retry-After: 30
Content-Type: application/json
```

```json
{
  "error": {
    "code": "rate_limit_exceeded",
    "message": "Request rate limit exceeded. Retry after the indicated delay.",
    "request_id": "req_7f31a6"
  }
}
```

**Resolution:** Wait for the number of seconds indicated by `Retry-After`, when present. Apply bounded exponential backoff with jitter if retrying remains necessary.

## Example: temporary service failure

`503 Service Unavailable`

```http
HTTP/1.1 503 Service Unavailable
Retry-After: 10
Content-Type: application/json
```

```json
{
  "error": {
    "code": "service_unavailable",
    "message": "The service is temporarily unavailable.",
    "request_id": "req_7f31a8"
  }
}
```

**Resolution:** Retry after the indicated delay, when supplied. Use bounded backoff and avoid creating duplicate ledger entries.

## Retry guidance

- Do not retry `400`, `401`, or `403` unchanged.
- Resolve a `409` idempotency conflict before attempting another create operation.
- For `429` and `503`, honor `Retry-After` when supplied.
- If a create request times out, retry the same logical operation with the same idempotency key and identical request body.
- Do not assume a `500` means that a create operation was not committed. Use the same idempotency key when retrying a create request.
- Apply bounded exponential backoff with jitter for transient failures, subject to the API's retry policy.

## Support escalation

Provide the `request_id`, approximate UTC timestamp, endpoint, HTTP status, and a redacted request summary. Never send access tokens, client secrets, or unnecessary personal data.
