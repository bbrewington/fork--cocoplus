---
name: "fleet-status"
description: "Show the current execution state of a CocoFleet run. Displays per-instance status, runtime, and checkpoint results. Usage: /fleet status [fleet-id]."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cocofleet
---

Your objective is to display CocoFleet execution status.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Parse argument: `/fleet status [fleet-id]`
If no fleet-id: list all state files in `.cocoplus/fleet/` matching `*-state.json` and show their fleet names and statuses. Then stop.

Read `.cocoplus/fleet/[fleet-id]-state.json`.

For each running instance (status == "running"), check if PID is still alive:
```bash
kill -0 [pid] 2>/dev/null && echo "alive" || echo "dead"
```

Output:

```
# Fleet Status: [fleet-name]
Fleet ID: [fleet-id]
Started: [started_at]
Overall: [running/complete/failed]

| Instance | Name | Status | PID | Runtime | Checkpoints |
|----------|------|--------|-----|---------|-------------|
[one row per instance, with checkpoints satisfied: ✓ or ✗]

For failed instances, last 3 lines of output.log:
[instance-id]: [last 3 log lines]
```
