---
name: "quality-on"
description: "Enable the Code Quality Advisor. When on, SQL files written during tool use are automatically analyzed for anti-patterns (SELECT *, missing WHERE, unbounded results, cartesian products, deprecated functions) and findings are logged."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - code-quality
---

Your objective is to enable the Code Quality Advisor.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Create mode flag: `touch .cocoplus/modes/quality.on`
Update AGENTS.md (keep ≤200 lines): replace Quality line with `- Quality: ON (auto-review SQL writes)`

Output: "✓ Code Quality Advisor enabled. SQL files written during this session will be automatically reviewed for anti-patterns. Findings are written to .cocoplus/quality-findings-[timestamp].md."
