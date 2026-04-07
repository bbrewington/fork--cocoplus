---
name: "cocoplus-off"
description: "Deactivate Full Assist Mode — removes all CocoPlus feature flags. Data files (memory, meter history, grove patterns) are preserved. Idempotent."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - assist-mode
---

Your objective is to deactivate Full Assist Mode.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

## Check Which Flags Exist

Record which flags currently exist before removing them (for reporting).

## Remove All Feature Flags

Run:
```
rm -f .cocoplus/modes/memory.on
rm -f .cocoplus/modes/inspector.on
rm -f .cocoplus/modes/quality.on
rm -f .cocoplus/modes/context-mode.on
rm -f .cocoplus/modes/cocometer.on
rm -f .cocoplus/modes/full-assist.on
rm -f .cocoplus/modes/safety.strict
rm -f .cocoplus/modes/safety.normal
rm -f .cocoplus/modes/safety.off
```

**DO NOT delete any data files.** Only flag files are removed. These data files are NEVER deleted:
- `.cocoplus/memory/` directory and all files
- `.cocoplus/meter/history.jsonl`
- `.cocoplus/grove/patterns/` and all files
- `.cocoplus/grove/cupper-findings.md`

## Update AGENTS.md

Update AGENTS.md (keep ≤200 lines).
Replace Active Modes section with:
```
## Active Modes
- FULL ASSIST MODE: OFF
- Safety: off (deactivated)
- Memory: off
- Inspector: off
- Context Mode: off
- CocoMeter: off
- Code Quality: off
```

## Create Git Commit

```
git add .cocoplus/modes/ .cocoplus/AGENTS.md
git commit -m "chore(cocopod): deactivate full assist mode"
```

## Output

```
Full Assist Mode deactivated.

Deactivated: [list of flags that were removed]

Preserved (not deleted):
- .cocoplus/memory/ — decisions, patterns, errors files
- .cocoplus/meter/history.jsonl
- .cocoplus/grove/patterns/
- .cocoplus/grove/cupper-findings.md

Run `/cocoplus on` to re-activate all features.
```
