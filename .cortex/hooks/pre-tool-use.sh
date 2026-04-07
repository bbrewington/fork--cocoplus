#!/bin/bash
# PreToolUse hook — Phase 0 stub
# Receives: COCO_TOOL_NAME, COCO_TOOL_INPUT env vars (or stdin JSON)
# Purpose: Safety Gate intercept for SnowflakeSqlExecute

COCOPLUS_DIR=".cocoplus"
HOOK_LOG="${COCOPLUS_DIR}/hook-log.jsonl"
TOOL_NAME="${COCO_TOOL_NAME:-unknown}"

if [ -d "$COCOPLUS_DIR" ]; then
  echo "{\"hook\":\"pre-tool-use\",\"tool\":\"${TOOL_NAME}\",\"ts\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"status\":\"stub\"}" >> "$HOOK_LOG" 2>/dev/null || true
fi

# Phase 0: always allow
exit 0
