---
name: "fleet-run"
description: "Execute a CocoFleet manifest. Spawns independent Coco processes for each instance, respects dependency order, polls for completion, and writes an aggregated results summary. Usage: /fleet run [fleet-name]."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cocofleet
---

Your objective is to execute a CocoFleet manifest.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Parse argument: `/fleet run [fleet-name]`
If no fleet-name: output "Usage: /fleet run [fleet-name]" Then stop.

Read `.cocoplus/fleet/[fleet-name]-manifest.json`. If not found: output "Manifest not found. Run `/fleet init [fleet-name]` first." Then stop.

## Validate Manifest

Check: instance count ≤ 10. If exceeded: output "WARNING: Fleet has [N] instances, exceeding the 10-instance maximum. Edit manifest to reduce instance count." Then stop.

Check `which coco` is available. If not: output "ERROR: 'coco' CLI not in PATH." Then stop.

## Create Fleet State File

Generate fleet-id: `fleet-YYYYMMDD-HHMMSS`

Write `.cocoplus/fleet/[fleet-id]-state.json`:
```json
{
  "fleet_id": "[fleet-id]",
  "fleet_name": "[fleet-name]",
  "started_at": "[ISO 8601 timestamp]",
  "status": "running",
  "instances": {}
}
```

Initialize each instance in the state with status "pending".

## Resolve and Execute Instances

Algorithm:
1. Find all instances with no `depends_on` or with all dependencies satisfied in state.json
2. For each ready instance:
   a. Create directory: `.cocoplus/fleet/[instance-id]/`
   b. Verify task_file exists. If not: mark instance as failed, log error.
   c. Spawn Coco process via Bash:
      ```bash
      coco --task-file .cocoplus/fleet/[instance-id]/task.md > .cocoplus/fleet/[instance-id]/output.log 2>&1 &
      echo $! > .cocoplus/fleet/[instance-id]/pid.txt
      ```
   d. Record PID in state.json, set status = "running", started_at = [timestamp]

3. Poll every 30 seconds:
   - For each running instance: check if PID is still alive (`kill -0 [pid]`)
   - If PID dead: validate checkpoints, update state
   - If checkpoints satisfied: status = "completed"
   - If not: status = "failed"
   - Spawn newly unblocked dependents

4. When all instances complete: write aggregated-results.md

## Write Aggregated Results

Write `.cocoplus/fleet/[fleet-id]-aggregated-results.md`:
```markdown
# Fleet Results: [fleet-name]

**Fleet ID:** [fleet-id]
**Completed:** [ISO 8601 timestamp]
**Duration:** [seconds]

## Instance Summary
| Instance | Status | Duration | Checkpoints |
|----------|--------|----------|-------------|
[one row per instance]

## Overall Status
[COMPLETE / PARTIAL (N failed) / FAILED]
```

Output: "Fleet [fleet-name] running. Fleet ID: [fleet-id]. Use `/fleet status [fleet-id]` to monitor. Use `/fleet stop [fleet-id]` to terminate all processes."

## Anti-Rationalization

| Temptation | Why Not |
|------------|---------|
| Block waiting for all instances | Fleet must return control to developer immediately |
| Share context between instances | Instances are process-isolated by design — no shared context |
| Exceed 10 instances without warning | 10 is the safety limit — always enforce |
