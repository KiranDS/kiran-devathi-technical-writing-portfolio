# Authentication

The fictional LedgerLite API uses bearer-token authentication.

## Include the access token

Send the token in the `Authorization` request header:

```http
Authorization: Bearer YOUR_API_TOKEN
```

Replace `YOUR_API_TOKEN` with a valid token issued by the service administrator.

## Security recommendations

- Store tokens in a secrets manager or secure environment variable.
- Do not commit tokens to source control.
- Do not include tokens in screenshots, logs, or support tickets.
- Use HTTPS for all API requests.
- Rotate or revoke exposed tokens according to the service's security procedure.

## Authentication errors

| HTTP status | Meaning | Suggested action |
|---|---|---|
| `401` | The token is missing, invalid, or expired. | Verify the header and request a valid token. |
| `403` | The token is valid but does not have permission for the operation. | Ask an administrator to review the token's permissions. |

> These behaviors are illustrative. A real API's token lifecycle, scopes, and error schema must be confirmed with its engineering team.
