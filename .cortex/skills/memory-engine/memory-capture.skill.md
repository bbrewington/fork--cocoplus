---
name: "memory-capture"
description: "Manually capture a decision, pattern, or error resolution to the Memory Engine. Writes to .cocoplus/memory/ for cross-session persistence. Triggered manually or via post-tool-use hook."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - memory
  - persistence
---

Your objective is to capture a specific item to the CocoPlus Memory Engine.

## Pre-flight Check

1. Check that `.cocoplus/` directory exists. If not, output:
   "CocoPlus is not initialized. Run `/pod init` first."
   Then stop.

2. Check if `memory.on` flag exists at `.cocoplus/modes/memory.on`.
   If it does NOT exist, output:
   "Memory Engine is currently off. Run `/memory on` to enable cross-session memory capture."
   Then stop.

## Identify What to Capture

The developer may have:
- Provided the item inline: `/memory capture <text>`
- Run `/memory capture` with no arguments (interactive mode)

If no argument provided, ask:
> "What would you like to capture to memory? Choose a type:
> 1. **Decision** — A key choice made and why (e.g., 'chose star schema over OBT for query performance')
> 2. **Pattern** — A reusable approach observed (e.g., 'incremental load pattern for large fact tables')
> 3. **Error** — An error and how it was resolved (e.g., 'warehouse suspended mid-query — used RESUME before retry')
>
> Reply with the type and the content."

## Write to Memory

Based on the type, append to the appropriate memory file:

### Decision → `.cocoplus/memory/decisions.md`

Format to append:
```
## [YYYY-MM-DD HH:MM] <short title>

**Decision:** <what was decided>
**Rationale:** <why this choice was made>
**Alternatives Considered:** <what else was considered, if known>
**Context:** CocoBrew Phase: <current phase from .cocoplus/AGENTS.md>
```

### Pattern → `.cocoplus/memory/patterns.md`

Format to append:
```
## [YYYY-MM-DD HH:MM] <pattern name>

**Pattern:** <what the pattern is>
**When to Apply:** <conditions under which this pattern is useful>
**Example:** <brief example or code snippet if available>
**Source:** <where this pattern was observed — stage ID, task, or 'manual'>
```

### Error → `.cocoplus/memory/errors.md`

Format to append:
```
## [YYYY-MM-DD HH:MM] <error short description>

**Error:** <what went wrong>
**Root Cause:** <why it happened>
**Resolution:** <how it was fixed>
**Prevention:** <how to avoid this in the future>
```

## Post-Capture

1. Output confirmation: "Captured to `.cocoplus/memory/<type>.md`."
2. If the item looks like a reusable pattern that might benefit other projects, suggest:
   "This looks like a reusable pattern. Run `/patterns promote` to add it to CocoGrove for future projects."
