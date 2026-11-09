# Claim-to-source traceability matrix

| Draft statement | Source ID | Source field(s) | Review result |
|---|---|---|---|
| Account administrators can export the filtered ledger-entry list as CSV | LL-2048 | `customer_impact` | Supported |
| Export is available on paid plans from 15 Nov 2026 | LL-2048 | `availability` | Supported |
| Account Administrator role is required | LL-2048 | `prerequisites` | Supported |
| Export limit is 10,000 rows | LL-2048 | `limitations` | Supported |
| Account currency appears next to account name in activity filter | LL-2051 | `customer_impact` | Supported |
| Currency display change is available to all customers from 15 Nov 2026 | LL-2051 | `availability` | Supported |
| Warning appears when same idempotency key is reused with a different body | LL-2057 | `customer_impact` | Supported |
| A new idempotency key on each retry can still result in duplicates | LL-2057 | `limitations` | Supported |

## Exclusion traceability

| Change ID | Decision | Reason |
|---|---|---|
| LL-2060 | Excluded | `approval_status` is pending; customer impact and other publication details are not confirmed |

## Review rule

Every material customer-facing claim must map to an approved source. If a claim cannot be mapped, remove it or obtain confirmation from the source owner.
