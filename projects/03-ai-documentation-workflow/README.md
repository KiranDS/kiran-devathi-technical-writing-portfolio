# DocOps AI — AI-Assisted Documentation Workflow

**Portfolio project:** AI-assisted release documentation with human approval  
**Version:** 1.0  
**Status:** Demonstration case study; fictional product and data

## Project overview

DocOps AI demonstrates a controlled workflow for turning structured engineering change inputs into draft customer-facing release notes. It combines prompt design, source traceability, style-guide checks, risk classification, and mandatory human review.

The case study is inspired by common enterprise documentation operations. It is not a representation of any former employer's internal systems, data, prompts, or results.

> **Important:** This is a portfolio simulation. The product, change records, people, metrics, and sample outputs are fictional. No production system is connected, and no AI-generated content is approved for publication automatically.

## What this project demonstrates

- Translating engineering change records into audience-appropriate release notes.
- Designing reusable prompts with explicit source-grounding and abstention rules.
- Maintaining traceability from each statement to an input record.
- Applying a documentation style guide and structured quality checks.
- Classifying risk and routing sensitive changes to specialist reviewers.
- Keeping a human writer accountable for final accuracy and publication.
- Measuring cycle time and quality without presenting illustrative figures as verified outcomes.

## Scenario

A fictional SaaS product, **LedgerLite**, ships a monthly release. Product and engineering teams provide change records containing feature descriptions, customer impact, availability, configuration requirements, and known limitations. A technical writer uses an AI assistant to produce a first draft of release notes, then verifies it against the source records and the editorial checklist.

## Repository map

```text
03-ai-documentation-workflow/
├── README.md
├── CONTRIBUTING.md
├── docs/
│   ├── 01-workflow-overview.md
│   ├── 02-source-inputs-and-data-contract.md
│   ├── 03-prompt-library.md
│   ├── 04-human-review-and-approval.md
│   ├── 05-quality-assurance-checklist.md
│   ├── 06-risk-and-governance.md
│   ├── 07-measurement-and-evaluation.md
│   └── 08-implementation-guide.md
├── examples/
│   ├── change-records.json
│   ├── generated-draft.md
│   ├── reviewed-release-notes.md
│   └── traceability-matrix.md
├── templates/
│   ├── change-intake-template.md
│   ├── reviewer-checklist.md
│   └── evaluation-log.csv
└── assets/
    └── workflow.mmd
```

## Start here

1. Read [Workflow overview](docs/01-workflow-overview.md).
2. Review the [sample source records](examples/change-records.json).
3. Compare the [AI-generated draft](examples/generated-draft.md) with the [human-reviewed version](examples/reviewed-release-notes.md).
4. Inspect the [traceability matrix](examples/traceability-matrix.md) to see how claims map back to source records.
5. Review the prompt and quality controls before adapting the workflow.

## Key design principle

**AI drafts; accountable people verify and approve.** The workflow must never invent functionality, compatibility, dates, performance claims, security assurances, or availability. If the source is incomplete or contradictory, the assistant must flag the gap rather than fill it with a plausible-sounding statement.

## Limitations

- The examples are static and manually authored; this repository does not include a live model integration.
- No actual API calls, automated evaluations, or production metrics are claimed.
- The example release notes are not validated against a running LedgerLite service.
- The workflow is a documentation-process demonstration, not a substitute for product, legal, security, or compliance approval.

## Author's contribution

This portfolio project demonstrates information design, technical writing, prompt specification, editorial governance, and quality assurance. It is designed as an original, non-confidential sample.
