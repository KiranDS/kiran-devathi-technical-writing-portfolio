# 6. Risk and governance

## Risk register

| Risk | Example | Control | Owner |
|---|---|---|---|
| Hallucinated functionality | Draft claims bulk export when only single-record export exists | Source-only prompt; claim traceability; product review | Technical writer + product |
| Omitted limitation | Draft omits the 10,000-row cap | Required source field; completeness comparison | Product + writer |
| Incorrect availability | Draft says all customers when rollout is paid-plan only | Explicit availability field; approval gate | Product |
| Data leakage | Prompt contains a real access token | Data minimization; approved AI environment; preflight scan | Input owner |
| Prompt injection in source text | A change description contains instructions to reveal secrets | Treat records as untrusted data; fixed system rules | AI platform owner |
| Bias or inappropriate tone | Draft uses exclusionary or unclear language | Editorial review and inclusive-language guidance | Technical writer |
| Automation overreach | Draft is published without review | No auto-publish permission; human approval | Documentation lead |
| Stale documentation | Draft uses superseded source records | Versioned input records and release identifier | Product + writer |

## Risk classification

- **Low:** Cosmetic wording or non-functional UI text changes with clear approved source.
- **Medium:** Customer-visible workflow changes, configuration changes, plan eligibility, or limitations.
- **High:** Security, privacy, regulatory, financial calculations, data retention, authentication, deprecation, migration, or contractual impact.

High-risk changes require specialist review. The model must not determine whether a change is legally or regulatorily acceptable.

## Data classification

Use only public or organization-approved internal information in the AI tool. Do not submit:
- credentials, API keys, tokens, private keys;
- personal or sensitive personal data;
- customer account data or production payloads;
- confidential incident details;
- restricted source code or architecture details unless explicitly approved.

## Governance requirements

- Maintain versioned prompts and style rules.
- Record the model/tool and date used when organizational policy requires it.
- Retain source IDs and reviewer decisions.
- Review prompt changes before use.
- Sample outputs periodically for quality drift.
- Provide a manual fallback process if the AI tool is unavailable.
- Follow the organization's retention, privacy, security, and vendor policies.

## Accountability

The technical writer owns the quality of the documentation they approve. Product and engineering owners remain accountable for technical facts. AI output does not transfer or reduce those responsibilities.
