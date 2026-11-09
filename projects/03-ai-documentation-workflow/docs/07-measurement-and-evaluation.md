# 7. Measurement and evaluation

## What to measure

| Metric | Definition | Why it matters |
|---|---|---|
| Draft preparation time | Active writer time from validated inputs to first draft | Measures drafting effort |
| Review time | Active review and correction time | Detects whether effort is shifted downstream |
| Total cycle time | Draft plus review time, excluding waiting time if tracked separately | Measures end-to-end efficiency |
| Factual correction rate | Factual issues corrected / factual claims reviewed | Tracks reliability |
| Unsupported-claim count | Claims with no approved source | Must be zero at publication |
| Omission count | Approved customer-facing changes missing from draft | Tracks completeness |
| First-pass approval rate | Drafts approved without major rework / drafts reviewed | Tracks draft usefulness |
| Rework rate | Drafts returned for substantial revision / drafts reviewed | Tracks workflow quality |

## Measurement method

1. Establish a baseline using comparable releases produced without AI.
2. Record active drafting and review time separately.
3. Use the same scope and complexity categories for comparison.
4. Record defects by category and severity.
5. Compare multiple releases; avoid conclusions from a single example.
6. Report sample size, exclusions, and measurement period.
7. Do not count waiting time as active writing time unless the measurement definition says so.

## Illustrative calculation — not a measured result

If a baseline first-draft task takes 8 active hours and an AI-assisted draft takes 2 active hours:

- Time saved = 8 − 2 = 6 hours
- Relative reduction = 6 / 8 × 100 = 75%

This is a hypothetical calculation to demonstrate the metric. It is not a measured result from this fictional project and must not be presented as a verified business outcome.

## Evaluation log

Use [`../templates/evaluation-log.csv`](../templates/evaluation-log.csv) to capture observations. Record actual values only after conducting a repeatable test.

## Success criteria

A workflow is not successful merely because the first draft is faster. It should demonstrate:
- zero unsupported claims in the approved publication;
- no critical or major factual defects at publication;
- no increase in omission rate;
- review effort that does not erase drafting-time savings;
- traceability and approval records for each release.
