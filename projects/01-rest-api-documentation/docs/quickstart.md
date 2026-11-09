# Quickstart

This guide demonstrates the documented sequence for obtaining an illustrative access token, creating a ledger entry, and retrieving it.

> **Fictional service notice:** LedgerLite and its `.example` host are not live. The commands and payloads are documentation examples only; they cannot execute against a real service.

## Before you begin

You need illustrative client credentials, an account ID you are authorized to use, an HTTP client such as `curl`, and a unique idempotency key for each logical create operation.

## 1. Set credential placeholders

```bash
export LEDGERLITE_CLIENT_ID="YOUR_CLIENT_ID"
export LEDGERLITE_CLIENT_SECRET="YOUR_CLIENT_SECRET"
```

Do not commit real credentials to source control.

## 2. Request an access token

The following shows an illustrative OAuth 2.0 client-credentials request using HTTP Basic client authentication. Confirm the actual client-authentication method and token policy with the identity provider in a real integration.

```bash
curl --request POST \\
  --url "https://auth.ledgerlite.example/oauth/token" \\
  --user "${LEDGERLITE_CLIENT_ID}:${LEDGERLITE_CLIENT_SECRET}" \\
  --header "Content-Type: application/x-www-form-urlencoded" \\
  --header "Accept: application/json" \\
  --data-urlencode "grant_type=client_credentials" \\
  --data-urlencode "scope=ledger.entries:read ledger.entries:write"
```

Illustrative response:

```json
{
  "access_token": "EXAMPLE_ACCESS_TOKEN",
  "token_type": "Bearer",
  "expires_in": 3600,
  "scope": "ledger.entries:read ledger.entries:write"
}
```

Set the returned placeholder in your shell for the following examples:

```bash
export LEDGERLITE_TOKEN="EXAMPLE_ACCESS_TOKEN"
```

The placeholder is not a valid credential.

## 3. Create an entry

```bash
curl --request POST \\
  --url "https://api.ledgerlite.example/v1/ledger-entries" \\
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \\
  --header "Content-Type: application/json" \\
  --header "Accept: application/json" \\
  --header "Idempotency-Key: 8e03978e-40d5-43e8-bc93-6894a57f9324" \\
  --data '{
    "account_id": "acct_8f3a21",
    "amount_minor": 12550,
    "currency": "USD",
    "direction": "credit",
    "description": "Invoice INV-2048 payment"
  }'
```

A successful operation returns `201 Created`. See [Create an entry](endpoints/create-ledger-entry.md).

## 4. Retrieve the entry

Use the entry ID returned by the create operation:

```bash
curl --request GET \\
  --url "https://api.ledgerlite.example/v1/ledger-entries/le_01J9M8K7W6V5T4S3R2Q1P0NABC" \\
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \\
  --header "Accept: application/json"
```

See [Retrieve an entry](endpoints/retrieve-ledger-entry.md).

## 5. List entries

```bash
curl --request GET \\
  --url "https://api.ledgerlite.example/v1/accounts/acct_8f3a21/ledger-entries?limit=20" \\
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \\
  --header "Accept: application/json"
```

The response includes `data` and `next_cursor`. See [List entries](endpoints/list-ledger-entries.md).

## 6. Handle errors

All documented API errors use the same JSON envelope. For example:

```json
{
  "error": {
    "code": "invalid_request",
    "message": "The amount_minor field must be greater than zero.",
    "request_id": "req_7f31a2"
  }
}
```

Use the HTTP status and `error.code` to determine the corrective action. See [Errors](errors.md) for the complete status-code table, examples, and retry guidance.
