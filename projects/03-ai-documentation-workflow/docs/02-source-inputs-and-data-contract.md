# 2. Source inputs and data contract

## Purpose

The model can only produce reliable documentation when the source records are sufficiently precise. This contract defines the minimum information required for each change.

## Required fields

| Field | Required | Description | Example |
|---|---:|---|---|
| `change_id` | Yes | Stable identifier | `LL-2048` |
| `title` | Yes | Short change title | `Add ledger-entry export` |
| `change_type` | Yes | `feature`, `enhancement`, `fix`, `deprecation`, or `security` | `feature` |
| `customer_impact` | Yes | Verified customer-visible behavior | `Account administrators can export filtered entries` |
| `availability` | Yes | Release/rollout status | `Available to all paid plans from 2026-11-15` |
| `prerequisites` | Yes | Requirements or explicit `None` | `Account administrator role` |
| `limitations` | Yes | Known limitations or explicit `None` | `CSV only; maximum 10,000 rows` |
| `source_owner` | Yes | Person/team responsible for confirmation | `Ledger API team` |
| `approval_status` | Yes | `approved`, `pending`, or `rejected` | `approved` |
| `audience` | Yes | Intended reader | `Account administrators` |
| `internal_notes` | No | Non-publishable context, clearly separated | `Feature flag rollout complete` |

## Data handling rules

- Include only information approved for the intended audience.
- Do not include credentials, access tokens, customer identifiers, personal data, or production payloads.
- Keep internal notes separate from customer-facing facts.
- Do not use an internal note as evidence for a public claim.
- A missing field is not equivalent to `None`. `None` must be explicitly confirmed.
- Pending or rejected changes must not be described as generally available.
- Dates, plan names, limits, and regional availability require explicit source confirmation.

## Sample source file

See [`../examples/change-records.json`](../examples/change-records.json).

## Preflight validation

Before drafting, confirm:

1. Every record has a unique change ID.
2. Every required field is present.
3. Approval status is `approved` for any item intended for publication.
4. Customer impact is concrete and testable.
5. Availability and prerequisites are explicit.
6. Limitations are stated or explicitly confirmed as none.
7. No restricted data is present.

If any condition fails, pause that item and request clarification. Do not ask the model to infer the missing fact.
