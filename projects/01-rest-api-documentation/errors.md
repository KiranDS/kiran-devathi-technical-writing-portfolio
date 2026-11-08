# API errors

The following table illustrates a possible error model for the fictional LedgerLite API. Confirm the actual response schema and status-code behavior with the API owner before using this pattern for a live product.

## HTTP status codes

| Status | Meaning | Client action |
|---|---|---|
| `400` | The request is malformed or contains invalid fields. | Correct the request using the validation details. |
| `401` | Authentication is missing or invalid. | Provide a valid bearer token. |
| `403` | The authenticated client is not authorized. | Request the required permission. |
| `404` | The requested resource does not exist. | Verify the resource ID and endpoint. |
| `409` | The request conflicts with the current resource state. | Retrieve the latest resource state before retrying. |
| `429` | The client has sent too many requests. | Apply a backoff strategy before retrying. |
| `500` | The server encountered an unexpected error. | Retry only when safe; contact support if the issue continues. |

## Example error response

```json
{
  "error": {
    "code": "invalid_amount",
    "message": "The amount must be greater than zero.",
    "request_id": "req_7f31a2"
  }
}
```

## Error-handling guidance

- Do not assume every failed request is safe to retry.
- Use exponential backoff for rate-limit responses when supported by the API.
- Preserve the request ID when reporting an issue to support.
- Avoid logging access tokens or other secrets.
