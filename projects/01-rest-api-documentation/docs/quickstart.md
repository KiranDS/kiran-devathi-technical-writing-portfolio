# Quickstart

This guide shows the sequence for creating and retrieving a LedgerLite entry.

> LedgerLite is fictional. The `.example` host cannot process requests. These commands are documentation examples, not executable integration instructions for a live service.

## Before you begin

You need an access token, an account ID you are authorized to use, an HTTP client such as `curl`, and a unique idempotency key for each logical create operation.

## 1. Set a token placeholder

```bash
export LEDGERLITE_TOKEN="YOUR_ACCESS_TOKEN"
```

Do not commit real tokens to source control.

## 2. Create an entry

```bash
curl --request POST \
  --url "https://api.ledgerlite.example/v1/ledger-entries" \
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \
  --header "Content-Type: application/json" \
  --header "Accept: application/json" \
  --header "Idempotency-Key: 8e03978e-40d5-43e8-bc93-6894a57f9324" \
  --data '{
    "account_id": "acct_8f3a21",
    "amount_minor": 12550,
    "currency": "USD",
    "direction": "credit",
    "description": "Invoice INV-2048 payment"
  }'
```

A successful operation returns `201 Created`. See [Create an entry](endpoints/create-ledger-entry.md).

## 3. Retrieve the entry

Use the returned entry ID:

```bash
curl --request GET \
  --url "https://api.ledgerlite.example/v1/ledger-entries/le_01J9M8K7W6V5T4S3R2Q1P0NABC" \
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \
  --header "Accept: application/json"
```

See [Retrieve an entry](endpoints/retrieve-ledger-entry.md).

## 4. List entries

```bash
curl --request GET \
  --url "https://api.ledgerlite.example/v1/accounts/acct_8f3a21/ledger-entries?limit=20" \
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \
  --header "Accept: application/json"
```

The response includes `data` and `next_cursor`. See [List entries](endpoints/list-ledger-entries.md).
