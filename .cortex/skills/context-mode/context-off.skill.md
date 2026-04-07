---
name: "context-off"
description: "Disable Context Mode. Prompts are no longer prepended with CocoPlus context."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - context-mode
---

Your objective is to disable Context Mode.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Remove mode flag: `rm -f .cocoplus/modes/context-mode.on`
Update AGENTS.md (keep ≤200 lines): replace Context line with `- Context Mode: off`

Output: "✓ Context Mode disabled. Prompts will no longer be prepended with context. Run `/context on` to re-enable."
