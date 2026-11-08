# Errors

The API uses standard HTTP status codes and a consistent JSON error envelope.

## Error response

```json
{
  "error": {
    "code": "invalid_request",
    "message": "The amount_minor field must be greater than zero.",
    "request_id": "req_7f31a2"
  }
}
```

| Field | Type | Description |
|---|---|---|
| `error.code` | string | Stable machine-readable identifier. |
| `error.message` | string | Human-readable explanation. Do not parse it for program logic. |
| `error.request_id` | string | Identifier to include in a support request. |

## Status codes

| Status | Example code | Meaning | Client action |
|---|---|---|---|
| `400` | `invalid_request` | Syntax or field validation failed. | Correct the request. |
| `401` | `unauthorized` | Token missing, invalid, or expired. | Obtain a valid token. |
| `403` | `forbidden` | Missing scope or account permission. | Request the required permission. |
| `404` | `not_found` | Resource missing or not visible. | Verify ID and access. |
| `409` | `idempotency_key_reused` | Key reused with a different body. | Resolve the key/body conflict. |
| `429` | `rate_limit_exceeded` | Rate limit exceeded. | Wait; honor `Retry-After` when supplied. |
| `500` | `internal_error` | Unexpected server error. | Retry only when safe; include request ID in escalation. |
| `503` | `service_unavailable` | Service temporarily unavailable. | Retry with backoff; honor `Retry-After` when supplied. |

## Validation example

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

## Idempotency conflict example

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

## Retry guidance

- Do not retry `400`, `401`, or `403` unchanged.
- Resolve `409` before attempting another create operation.
- For `429` and `503`, wait and honor `Retry-After` if supplied.
- If a create request times out, retry with the same idempotency key and identical body.
- Use bounded exponential backoff with jitter for transient failures, subject to the API's retry policy.

## Support escalation

Provide the request ID, approximate UTC timestamp, endpoint, HTTP status, and a redacted request summary. Never send tokens, secrets, or unnecessary personal data.
