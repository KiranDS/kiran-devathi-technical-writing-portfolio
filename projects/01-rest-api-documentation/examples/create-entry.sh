#!/usr/bin/env bash
# Illustrative only: LedgerLite is fictional and this .example host is not live.
set -eu
: "${LEDGERLITE_TOKEN:?Set LEDGERLITE_TOKEN before running this example}"

curl --request POST \
  --url "https://api.ledgerlite.example/v1/ledger-entries" \
  --header "Authorization: Bearer ${LEDGERLITE_TOKEN}" \
  --header "Content-Type: application/json" \
  --header "Accept: application/json" \
  --header "Idempotency-Key: 8e03978e-40d5-43e8-bc93-6894a57f9324" \
  --data @create-entry-request.json
