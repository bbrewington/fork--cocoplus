---
name: "context-on"
description: "Enable Context Mode. When on, every developer prompt is prepended with a CocoPlus context block showing the current phase, active modes, and recent checkpoints. Helps the AI maintain project awareness across prompts."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - context-mode
---

Your objective is to enable Context Mode.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Create mode flag: `touch .cocoplus/modes/context-mode.on`
Update AGENTS.md (keep ≤200 lines): replace Context line with `- Context Mode: ON (phase context prepended to prompts)`

Output: "✓ Context Mode enabled. Each prompt will be prepended with current phase, active modes, and recent checkpoints. This helps maintain project context across conversation turns."
