# Authentication and authorization

LedgerLite uses an illustrative OAuth 2.0 client-credentials flow. A client obtains an access token from the authorization server and sends that token to protected API operations as a bearer token.

> **Fictional service notice:** `auth.ledgerlite.example` is a reserved example hostname and is not reachable. The request and response below illustrate the documented flow; they are not executable credentials or a verified implementation contract.

## 1. OAuth 2.0 client-credentials flow

Use the client-credentials grant for a confidential service-to-service client. Do not use this flow in browser or mobile applications that cannot protect a client secret.

**Token URL**

```text
POST https://auth.ledgerlite.example/oauth/token
```

**Illustrative token request**

This example uses HTTP Basic client authentication. A real authorization server may require a different client-authentication method; confirm it with the identity/security team.

```bash
curl --request POST \
  --url "https://auth.ledgerlite.example/oauth/token" \
  --user "${LEDGERLITE_CLIENT_ID}:${LEDGERLITE_CLIENT_SECRET}" \
  --header "Content-Type: application/x-www-form-urlencoded" \
  --header "Accept: application/json" \
  --data-urlencode "grant_type=client_credentials" \
  --data-urlencode "scope=ledger.entries:read ledger.entries:write"
```

**Illustrative successful token response**

`200 OK`

```json
{
  "access_token": "EXAMPLE_ACCESS_TOKEN",
  "token_type": "Bearer",
  "expires_in": 3600,
  "scope": "ledger.entries:read ledger.entries:write"
}
```

| Field | Type | Description |
|---|---|---|
| `access_token` | string | Token to send in the `Authorization` header. The value shown is a placeholder, not a credential. |
| `token_type` | string | Token type. The example uses `Bearer`. |
| `expires_in` | integer | Illustrative token lifetime in seconds. Actual lifetime is implementation-defined. |
| `scope` | string | Space-delimited scopes granted to the token. The authorization server may grant fewer scopes than requested. |

The token response is an OAuth-style illustrative example. LedgerLite does not define a live token service, client registration process, token lifetime, signing algorithm, revocation endpoint, or client-authentication policy.

## 2. Send the access token

Include the access token in the `Authorization` header on every protected API request.

```http
Authorization: Bearer EXAMPLE_ACCESS_TOKEN
Accept: application/json
```

Do not send tokens in query parameters or URL paths.

## 3. Available scopes

| Scope | Permission | Used by |
|---|---|---|
| `ledger.entries:read` | Retrieve and list ledger entries. | `GET /ledger-entries/{entry_id}` and `GET /accounts/{account_id}/ledger-entries` |
| `ledger.entries:write` | Create ledger entries. | `POST /ledger-entries` |

A valid token must also be authorized for the requested account. Knowing an account ID does not grant access to that account.

## 4. Authentication and authorization failures

| HTTP status | Error code | Meaning | Recommended action |
|---|---|---|---|
| `401 Unauthorized` | `unauthorized` | Token is missing, invalid, or expired. | Obtain a valid token and retry. |
| `403 Forbidden` | `forbidden` | Token lacks the required scope or account permission. | Request the required access from the service administrator. |

Example `401` response:

```json
{
  "error": {
    "code": "unauthorized",
    "message": "A valid bearer access token is required.",
    "request_id": "req_7f31a3"
  }
}
```

Do not repeatedly retry with unchanged invalid credentials. A `403` is an authorization failure, not an indication that the token should be refreshed automatically.

## 5. Credential handling

- Store client secrets in a secrets manager or protected environment variable.
- Never commit client secrets or access tokens to Git.
- Use HTTPS for token and API requests.
- Redact `Authorization` headers and client secrets from application logs.
- Restrict client credentials to the minimum required scopes.
- Rotate or revoke exposed credentials according to the organization's security process.
- Do not embed confidential client credentials in browser-side or mobile application code.

## 6. Production details to confirm

Before implementing a real integration, confirm the issuer URL, client registration process, supported client-authentication method, token lifetime, signing and validation rules, revocation behavior, scope assignment, account-level authorization model, and rate limits with the identity, security, and API teams. These details are intentionally not invented in this portfolio example.
