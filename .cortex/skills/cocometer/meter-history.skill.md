---
name: "meter-history"
description: "Show historical CocoMeter data from past sessions. Usage: /meter history [n] where n is the number of sessions to show (default 10)."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cocometer
---

Your objective is to display historical CocoMeter data.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Parse argument: `/meter history [n]` — n defaults to 10.

Read `.cocoplus/meter/history.jsonl`. If it does not exist or is empty:
Output: "No meter history yet. CocoMeter records history when sessions end. Ensure CocoMeter is enabled (`/meter on`) and complete a session."
Then stop.

Read the last N JSON objects from history.jsonl (one per line).

Output:

```
# CocoMeter — Session History

Showing last [N] sessions:

| Session | Started | Duration | Tools Called | SQL Statements | Writes |
|---------|---------|----------|-------------|----------------|--------|
[one row per session]

## Totals (last [N] sessions)
Total tools called: [sum]
Total SQL statements: [sum]
Total writes: [sum]
Estimated total tokens: [sum]
```
