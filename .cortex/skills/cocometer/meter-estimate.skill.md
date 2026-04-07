---
name: "meter-estimate"
description: "Pre-flight token and cost estimation for a planned action. Analyzes the current plan or a described action and estimates token consumption, Snowflake credit usage, and whether it exceeds configured thresholds."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cocometer
---

Your objective is to estimate token and cost impact before executing an action.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

If no argument provided: read `.cocoplus/flow.json` to estimate the full pipeline.
If argument provided (e.g., `/meter estimate "run 3-stage pipeline"`): estimate the described action.

## Estimation Approach

For pipeline estimation:
- Count stages in flow.json
- For each stage, estimate based on persona and typical workload:
  - data-engineer: ~8,000 tokens/stage (SQL-heavy)
  - analytics-engineer: ~6,000 tokens/stage (semantic modeling)
  - data-scientist: ~12,000 tokens/stage (notebook + analysis)
  - data-analyst: ~4,000 tokens/stage (queries + reporting)
  - bi-analyst: ~3,000 tokens/stage (visualization spec)
  - data-product-manager: ~2,000 tokens/stage (documentation)
  - data-steward: ~3,000 tokens/stage (governance)
  - chief-data-officer: ~2,000 tokens/stage (review)

Output:

```
# Pre-flight Estimate

Action: [described action or "Full pipeline execution"]

## Token Estimate
Per stage breakdown:
[stage name] ([persona]): ~[estimate] tokens
...
Total estimate: ~[total] tokens (conservative)

## Snowflake Credit Estimate
Estimated SQL calls: ~[N]
Estimated credits: ~[N × 0.00001] credits

## Budget Check
Configured threshold: [from cost-tracker.monitor.json]
Estimate vs threshold: [WITHIN / EXCEEDS by N%]

Note: These are estimates. Actual usage depends on response length, query complexity, and data volume.
```
