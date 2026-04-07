---
name: "inspector-off"
description: "Disable automatic environment scanning at session start."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - environment-inspector
---

Your objective is to disable automatic environment scanning.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Remove mode flag: `rm -f .cocoplus/modes/inspector.on`

Update AGENTS.md (keep ≤200 lines): replace Inspector line with `- Inspector: off`

Output: "✓ Environment Inspector disabled. Existing snapshots in .cocoplus/snapshots/ are preserved. Run `/inspector on` to re-enable."
