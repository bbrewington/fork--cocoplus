#!/bin/bash
# SessionStart hook — Phase 0 stub
# Receives: COCO_SESSION_ID env var
# Purpose: Load CocoPod context, trigger inspector, initialize meter

COCOPLUS_DIR=".cocoplus"
HOOK_LOG="${COCOPLUS_DIR}/hook-log.jsonl"

if [ -d "$COCOPLUS_DIR" ]; then
  echo "{\"hook\":\"session-start\",\"session\":\"${COCO_SESSION_ID}\",\"ts\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"status\":\"stub\"}" >> "$HOOK_LOG" 2>/dev/null || true
fi

exit 0
