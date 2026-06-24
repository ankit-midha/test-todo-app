#!/usr/bin/env bash
set -euo pipefail

JIRA_KEY=""
PHASE=""
STATUS=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --jira-key) JIRA_KEY="$2"; shift 2 ;;
    --phase) PHASE="$2"; shift 2 ;;
    --status) STATUS="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 1 ;;
  esac
done

mkdir -p .workflow/audit
cat >> ".workflow/audit/${JIRA_KEY}.log" <<LOG
$(date -u +"%Y-%m-%dT%H:%M:%SZ") phase=${PHASE} status=${STATUS} run=${GITHUB_RUN_ID:-local}
LOG

echo "audit: wrote local audit entry for ${JIRA_KEY} ${PHASE} ${STATUS}"

