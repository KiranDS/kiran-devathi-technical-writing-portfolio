# Authentication and authorization

## Authentication

The sample uses bearer-token authentication. Include the token in every protected request:

```http
Authorization: Bearer YOUR_ACCESS_TOKEN
```

The placeholder is not a valid credential.

## Illustrative scopes

| Scope | Permission |
|---|---|
| `ledger.entries:write` | Create ledger entries. |
| `ledger.entries:read` | Retrieve and list entries. |

A token must have the required scope and access to the specified account. Knowing an account ID does not grant access.

## Authentication failures

| HTTP status | Code | Meaning |
|---|---|---|
| `401` | `unauthorized` | Token is missing, invalid, or expired. |
| `403` | `forbidden` | Token lacks the required scope or account permission. |

Do not retry unchanged credentials after a `401`.

## Credential handling

- Store tokens in a secrets manager or protected environment variable.
- Never commit tokens to Git or include them in URLs.
- Use HTTPS for all requests.
- Redact authorization headers from logs.
- Revoke and rotate exposed credentials according to the service's security process.

## Production questions

Confirm token issuer, lifetime, refresh and revocation behavior, supported OAuth grant, scope assignment, and account-level authorization with the security and engineering teams. These details are not defined by this sample.
