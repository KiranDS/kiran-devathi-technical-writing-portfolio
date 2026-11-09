# 8. Implementation guide

This guide describes a controlled pilot that can be run without integrating the AI assistant into a production publishing pipeline.

## Phase 1 — Prepare

- Select one low- or medium-risk release.
- Identify the approved AI environment and data classification.
- Agree on the audience, style guide, glossary, and release-note template.
- Assign source owners and reviewers.
- Create a baseline measurement for a comparable manual release.

## Phase 2 — Structure inputs

- Ask engineering/product contributors to complete the intake template.
- Validate required fields and approval status.
- Remove internal-only and restricted data from the prompt package.
- Freeze the source-record revision for the draft.

## Phase 3 — Generate and review

- Run Prompt A with approved records.
- Save the raw draft separately from the edited version.
- Run Prompts B and C as review aids.
- Verify each claim against its source.
- Resolve open questions with source owners.
- Complete the QA checklist and approval record.

## Phase 4 — Publish and evaluate

- Publish only the human-approved version.
- Retain the source revision, prompt version, draft, final, and review record according to policy.
- Record active drafting time, review time, corrections, omissions, and approvals.
- Review results with the documentation lead and product owner.

## Pilot exit criteria

Proceed to a broader pilot only if:
- there are no unresolved critical or major defects;
- unsupported claims are zero in approved output;
- reviewers can trace claims to source records;
- the data-handling process complies with organizational policy;
- measured total effort and quality are acceptable.

## Rollback

Stop AI-assisted drafting and return to the manual process if:
- source data is exposed to an unapproved service;
- repeated unsupported claims appear;
- review effort becomes materially higher than the baseline;
- reviewers cannot establish reliable traceability;
- the AI service or organizational policy changes in a way that invalidates the controls.

## Suggested future enhancements

These are future options, not implemented features:
- schema validation for intake JSON;
- automated detection of missing required fields;
- integration with an approved issue tracker;
- automated link and terminology checks;
- a dashboard for cycle time and defect trends;
- version-controlled prompt evaluation tests.
