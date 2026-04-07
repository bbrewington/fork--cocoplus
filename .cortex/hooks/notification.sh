#!/bin/bash
# Notification hook — Phase 0 stub
# Receives: COCO_NOTIFICATION_TYPE, COCO_NOTIFICATION_PAYLOAD env vars
# Purpose: Route notifications to UI or log file

COCOPLUS_DIR=".cocoplus"
HOOK_LOG="${COCOPLUS_DIR}/hook-log.jsonl"
NOTIF_TYPE="${COCO_NOTIFICATION_TYPE:-unknown}"

if [ -d "$COCOPLUS_DIR" ]; then
  echo "{\"hook\":\"notification\",\"type\":\"${NOTIF_TYPE}\",\"ts\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"status\":\"stub\"}" >> "$HOOK_LOG" 2>/dev/null || true
fi

exit 0
