---
name: "quality-off"
description: "Disable the Code Quality Advisor. Automatic SQL review stops. Existing findings are preserved."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - code-quality
---

Your objective is to disable the Code Quality Advisor.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Remove mode flag: `rm -f .cocoplus/modes/quality.on`
Update AGENTS.md (keep ≤200 lines): replace Quality line with `- Quality: off`

Output: "✓ Code Quality Advisor disabled. Existing findings preserved. Run `/quality on` to re-enable."
