# LedgerLite 1.8 release notes

<text>Publication status: approved sample for portfolio demonstration only. Product, release, and dates are fictional.</text>

**Release date:** 15 November 2026

This release adds CSV export for filtered ledger entries, displays account currency in activity filters, and corrects the duplicate-entry warning for a specific idempotency-key reuse scenario.

## Features

### Export filtered ledger entries

Account administrators can export the currently filtered ledger-entry list as a CSV file.

- **Availability:** All paid plans from 15 November 2026.
- **Permission:** Account Administrator role required.
- **Limit:** Up to 10,000 rows per export.
- **Format:** CSV.

[SOURCE: LL-2048]

## Improvements

### Display account currency in activity filters

The account activity filter now displays the account currency next to the account name. This change is available to all customers from 15 November 2026.

[SOURCE: LL-2051]

## Fixes

### Correct duplicate-entry warning for reused idempotency keys

The API now displays the duplicate-entry warning when the same idempotency key is reused with a different request body.

This change does not prevent duplicates when a client uses a new idempotency key for each retry.

**Availability:** All API customers from 15 November 2026.

[SOURCE: LL-2057]

---

## Editorial review notes

- Replaced “more specific” with a direct description of the corrected behavior.
- Preserved the limitation about clients generating a new idempotency key for each retry.
- Kept the permission, format, and export limit explicit.
- Excluded LL-2060 because it is pending approval and its customer impact is unconfirmed.
