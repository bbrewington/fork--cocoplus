---
name: "meter"
description: "Show CocoMeter report for the current session: tools called, SQL statements executed, writes performed, estimated token consumption, and estimated Snowflake credit usage."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cocometer
---

Your objective is to display the current session CocoMeter report.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Read `.cocoplus/meter/current-session.json`. If it does not exist:
Output: "No active meter session. CocoMeter tracking starts automatically when a session begins with CocoMeter enabled. Run `/meter on` to enable and start a new session." Then stop.

Output a formatted report:

```
# CocoMeter — Current Session

Session ID: [session_id]
Started: [started_at]
Phase: [phase]

## Tool Usage
Tools Called: [tools_called]
SQL Statements: [sql_statements]
File Writes: [writes_performed]

## Token Estimate
Estimated tokens consumed: [tokens_consumed]
(Note: exact counts require Coco's native token reporting)

## Snowflake Credit Estimate
SQL operations × 0.00001 credits/statement = [estimate] credits
(rough estimate — actual credits depend on compute size and query complexity)
```
