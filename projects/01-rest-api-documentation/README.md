# LedgerLite API — Developer Documentation

**Portfolio case study | Fictional product | API v1 | OpenAPI 3.1.0**

LedgerLite is a fictional account-ledger service. This project demonstrates end-to-end API documentation: onboarding, authentication, endpoint references, request/response models, error handling, operational conventions, security guidance, and an OpenAPI contract.

> **Important:** LedgerLite and all IDs, payloads, tokens, and endpoints are fictional. The `.example` hostname is reserved for examples. This is not a live financial service and must not be used to process real transactions.

## Start here

| Task | Documentation |
|---|---|
| Understand the API | [Overview](docs/api-overview.md) |
| Make a sample request | [Quickstart](docs/quickstart.md) |
| Understand credentials | [Authentication](docs/authentication.md) |
| Create an entry | [Create entry](docs/endpoints/create-ledger-entry.md) |
| Retrieve an entry | [Retrieve entry](docs/endpoints/retrieve-ledger-entry.md) |
| List account entries | [List entries](docs/endpoints/list-ledger-entries.md) |
| Handle failures | [Errors](docs/errors.md) |
| Understand conventions | [API conventions](docs/api-conventions.md) |
| Review security guidance | [Security](docs/security.md) |
| Inspect the machine-readable contract | [OpenAPI 3.1](openapi/ledgerlite-v1.yaml) |

## API at a glance

- Base URL: `https://api.ledgerlite.example/v1`
- Transport: HTTPS
- Media type: `application/json`
- Authentication: Bearer token
- Pagination: Cursor-based
- Duplicate create protection: `Idempotency-Key`

## Resource model

A ledger entry records an amount, currency, direction, description, status, and creation timestamp. Entries are immutable in this sample. Amounts use integer minor units: `12550` in USD represents USD 125.50. A production implementation must define supported currencies and precision rules authoritatively.

## Scope and assumptions

The API supports creating an entry, retrieving one entry, and listing entries for an account. Account provisioning, balances, settlement, payment initiation, refunds, webhooks, and reconciliation are out of scope. A `201 Created` response does not imply settlement or funds availability.

This is a coherent illustrative contract, not a tested implementation. In a real project, confirm all assumptions with Product, Engineering, QA, and Security before publication.
