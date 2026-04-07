#!/bin/bash
# UserPromptSubmit hook — Phase 0 stub
# Receives: COCO_USER_PROMPT env var (or stdin)
# Purpose: Context Mode overlay, persona routing ($de, $ae etc.)

COCOPLUS_DIR=".cocoplus"
HOOK_LOG="${COCOPLUS_DIR}/hook-log.jsonl"

if [ -d "$COCOPLUS_DIR" ]; then
  echo "{\"hook\":\"user-prompt-submit\",\"ts\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"status\":\"stub\"}" >> "$HOOK_LOG" 2>/dev/null || true
fi

exit 0
