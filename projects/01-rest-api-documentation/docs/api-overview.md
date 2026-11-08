# API overview

## What is the LedgerLite API?

LedgerLite is a fictional REST API for creating and retrieving account ledger entries.

## Base URL

`https://api.ledgerlite.example/v1`

The `.example` domain is reserved for examples and is not a live endpoint.

## Core concepts

- **Account:** A ledger container provisioned outside this API sample. Callers must have access to the account.
- **Ledger entry:** An immutable record associated with an account.
- **Direction:** `credit` increases the account's ledger balance; `debit` decreases it.
- **Amount:** `amount_minor` is an integer in the currency's minor unit. For example, USD 125.50 is `12550`. A production API must define currency support and precision rules.

## Available operations

| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/ledger-entries` | Create an entry. |
| `GET` | `/ledger-entries/{entry_id}` | Retrieve one entry. |
| `GET` | `/accounts/{account_id}/ledger-entries` | List entries for an account. |

## Request requirements

- Use HTTPS.
- Send a bearer token in `Authorization`.
- Send JSON request bodies with `Content-Type: application/json`.
- Send `Accept: application/json`.
- Include `Idempotency-Key` when creating an entry.

## Response conventions

Success responses use JSON. Errors use an envelope containing a machine-readable `code`, human-readable `message`, and diagnostic `request_id`.

## Environments

This sample documents one illustrative host only. A real service should publish sandbox and production hosts, credential provisioning instructions, and environment-isolation behavior.

## Out of scope

This API does not define account creation, balance retrieval, payment initiation, settlement, refunds, webhooks, or reconciliation. Do not infer these capabilities from the ledger-entry resource.
