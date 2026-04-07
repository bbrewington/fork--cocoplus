---
name: "memory-off"
description: "Disable the Memory Engine. Decision capture stops. Existing memory files are preserved."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - memory-engine
---

Your objective is to disable the Memory Engine.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Remove mode flag: `rm -f .cocoplus/modes/memory.on`

Update AGENTS.md (keep ≤200 lines): replace Memory line with `- Memory: off`

Output: "✓ Memory Engine disabled. Existing memory files preserved in .cocoplus/memory/ — they can be read manually but will not be updated. Run `/memory on` to re-enable."
