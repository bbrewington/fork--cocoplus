---
name: "fleet-logs"
description: "Show output logs for a specific CocoFleet instance. If the instance is still running, tails the live log. If complete, shows the full log with status summary. Usage: /fleet logs [fleet-id] [instance-id]."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cocofleet
---

Your objective is to show output logs for a CocoFleet instance.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Parse arguments: `/fleet logs [fleet-id] [instance-id]`
If missing: output "Usage: /fleet logs [fleet-id] [instance-id]" Then stop.

Log file: `.cocoplus/fleet/[instance-id]/output.log`
If not found: output "No log file found for [instance-id]. The instance may not have started yet." Then stop.

Read state file to determine if instance is still running.
Check if PID in state.json is alive: `kill -0 [pid] 2>/dev/null && echo "alive" || echo "dead"`

If alive (instance still running):
- Output last 50 lines of output.log
- Append: "[Instance is still running — showing last 50 lines. Re-run `/fleet logs` to refresh.]"

If dead (instance complete or stopped):
- Output full log content
- Append status summary from state.json (completed/failed, checkpoints satisfied)
