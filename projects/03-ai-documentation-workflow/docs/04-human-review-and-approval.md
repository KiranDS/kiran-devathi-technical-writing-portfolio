# 4. Human review and approval

## Review gates

| Gate | Owner | Required evidence | Pass condition |
|---|---|---|---|
| Source readiness | Product/engineering | Complete change record | Required fields are verified |
| Draft review | Technical writer | Draft plus source IDs | Every claim is supported |
| Product accuracy | Product owner / engineering | Traceability matrix | Behavior, availability, limits are correct |
| Specialist review | Security/legal/compliance, when triggered | Risk assessment and relevant evidence | Required approval recorded |
| Editorial approval | Technical writer | Completed QA checklist | Style, clarity, accessibility, completeness pass |
| Publication | Authorized publisher | Approved final version | No unresolved critical or major findings |

## Writer review procedure

1. Read the original source record before reviewing the AI draft.
2. Verify each statement against the source ID.
3. Check that the draft does not overstate availability or customer benefit.
4. Check prerequisites, limitations, plan eligibility, dates, and rollout status.
5. Remove internal notes and implementation details not approved for publication.
6. Compare all approved records with the draft to identify omissions.
7. Resolve every critical and major issue.
8. Record reviewer, date, version, and approval status.
9. Obtain specialist approval when the risk rules require it.
10. Publish only the approved revision.

## Approval record template

```text
Release:
Draft version:
Source-record revision:
Technical writer:
Product approver:
Specialist approver (if required):
Review date:
Critical findings remaining: 0
Major findings remaining: 0
Publication decision: APPROVED / REJECTED / NEEDS REWORK
Published location:
```

## Stop conditions

Do not publish if:
- a customer-facing claim has no traceable source;
- source records conflict on a material fact;
- a required approval is pending;
- a security, legal, regulatory, or privacy question is unresolved;
- a critical or major QA finding remains open;
- the draft contains secrets, personal data, or restricted internal information.
