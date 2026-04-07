---
name: "cup-history"
description: "Display the last N CocoCupper findings from .cocoplus/grove/cupper-findings.md. Usage: /cup history [n] where n defaults to 5."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cococupper
---

Your objective is to display recent CocoCupper findings.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Parse argument: `/cup history [n]` — n defaults to 5.

Read `.cocoplus/grove/cupper-findings.md`. If it does not exist or is empty:
Output: "No CocoCupper findings yet. Run `/cup` to trigger an analysis."
Then stop.

Extract the last N findings (each finding starts with `## Finding`).

Output each finding in summary format:
```
| ID | Title | Type | Severity | Date | Promoted |
|----|-------|------|----------|------|----------|
[one row per finding]
```

Then show the full text of the most recent finding.

Output: "Showing [N] of [total] findings. Use `/patterns promote [finding-id]` to promote a finding to the pattern library."
