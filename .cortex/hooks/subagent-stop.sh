#!/bin/bash
# SubagentStop hook — Phase 0 stub
# Receives: COCO_SUBAGENT_ID, COCO_SUBAGENT_NAME env vars
# Purpose: CocoCupper trigger, merge verification

COCOPLUS_DIR=".cocoplus"
HOOK_LOG="${COCOPLUS_DIR}/hook-log.jsonl"
SUBAGENT_ID="${COCO_SUBAGENT_ID:-unknown}"

if [ -d "$COCOPLUS_DIR" ]; then
  echo "{\"hook\":\"subagent-stop\",\"subagent\":\"${SUBAGENT_ID}\",\"ts\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"status\":\"stub\"}" >> "$HOOK_LOG" 2>/dev/null || true
fi

exit 0
