# LedgerLite 1.8 — Release notes (AI-generated draft)

<text>This sample is a deliberately labelled illustrative draft generated from the fictional source records in `change-records.json`. It is not approved for publication.</text>

## Features

### Export filtered ledger entries

Account administrators can export the currently filtered ledger-entry list as a CSV file. This feature is available on all paid plans from 15 November 2026. You must have the Account Administrator role to use it. Each export supports up to 10,000 rows.

[SOURCE: LL-2048]

## Improvements

### Currency shown in account activity filters

The account activity filter now displays the account currency next to the account name. This change is available to all customers from 15 November 2026.

[SOURCE: LL-2051]

## Fixes

### More specific duplicate-entry warning

The API now displays the duplicate-entry warning when a client reuses an idempotency key with a different request body. This change is available to all API customers from 15 November 2026.

**Important:** This change does not prevent duplicates when a client uses a new idempotency key for each retry.

[SOURCE: LL-2057]

## Open questions

None for the approved records included in this draft.

## Excluded changes

- **LL-2060 — Enable scheduled exports:** Excluded because approval is pending and customer impact, availability, prerequisites, and limitations are not confirmed.
