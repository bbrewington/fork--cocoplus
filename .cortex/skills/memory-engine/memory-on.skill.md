---
name: "memory-on"
description: "Enable the Memory Engine. When on, decisions and patterns are automatically captured during tool use (via PostToolUse hook) and flushed to warm storage before session compaction. Decision context is loaded at every session start."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - memory-engine
---

Your objective is to enable the Memory Engine.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Create mode flag: `touch .cocoplus/modes/memory.on`

Initialize memory files if they don't exist:
- `.cocoplus/memory/decisions.md` — with header `# Decisions Log\n\n_Decisions captured by CocoPlus Memory Engine_\n`
- `.cocoplus/memory/patterns.md` — with header `# Patterns Log\n\n_Patterns identified by CocoPlus Memory Engine_\n`
- `.cocoplus/memory/errors.md` — with header `# Errors Log\n\n_Error lessons captured by CocoPlus Memory Engine_\n`

Update AGENTS.md (keep ≤200 lines): replace Memory line with `- Memory: ON (capturing decisions)`

Output: "✓ Memory Engine enabled. Decisions, patterns, and error lessons will be captured automatically and persisted across sessions. Existing memory: [decision count] decisions, [pattern count] patterns."
