---
name: "meter-report"
description: "Generate a full CocoMeter usage report for the current session and optionally the last N sessions. Includes per-model breakdown, per-action costs, and total token consumption."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cocometer
  - reporting
---

Your objective is to generate a CocoMeter usage report.

## Pre-flight Check

Check that `.cocoplus/` directory exists. If not, output:
"CocoPlus is not initialized. Run `/pod init` first."
Then stop.

## Read Session Data

1. Read `.cocoplus/meter/current-session.json` if it exists.
2. Read `.cocoplus/meter/history.jsonl` — parse last 10 sessions (or all if fewer).

If no meter data exists at all, output:
"No CocoMeter data found. Use `/meter on` to enable tracking, then use `/meter` to see current usage."
Then stop.

## Generate Report

Output a structured report:

```
═══════════════════════════════════════
  CocoMeter Usage Report
═══════════════════════════════════════

CURRENT SESSION
───────────────
Status:     <Active | Inactive>
Session ID: <id>
Started:    <timestamp>
Duration:   <X minutes>

Token Usage:
  Input:    <n> tokens
  Output:   <n> tokens
  Total:    <n> tokens

Tool Activity:
  Tool calls: <n>
  Top tools:  <tool: count, ...>

Model Breakdown:
  <model>: <input_tokens> in / <output_tokens> out (<n> calls)
  ...

ACTIONS LOG (last 10)
─────────────────────
  <HH:MM> [<model>] <action>: <in>→<out> tokens
  ...

SESSION HISTORY (last 5 sessions)
──────────────────────────────────
  <date>  <duration>m  <total_tokens> tokens  <tool_calls> calls
  ...

TOTALS (all recorded sessions)
───────────────────────────────
  Sessions tracked:  <n>
  Total tokens:      <n>
  Total tool calls:  <n>
  Avg tokens/session:<n>
═══════════════════════════════════════
```

## Cost Estimates (Optional)

If Snowflake Cortex token pricing is available in project context, append:
```
ESTIMATED COST
──────────────
Note: Estimates based on published Cortex token pricing.
Actual billing may differ.

  Current session: ~$<amount>
  All sessions:    ~$<amount>
```

Otherwise omit the cost section and note:
"Cost estimation requires Snowflake Cortex pricing data. Check your Snowflake account for actual billing."
