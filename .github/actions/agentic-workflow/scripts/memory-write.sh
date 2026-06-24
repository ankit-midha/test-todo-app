#!/usr/bin/env bash
set -euo pipefail

JIRA_KEY=""
PHASE=""
TEAM_ID=""
STATUS=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --jira-key) JIRA_KEY="$2"; shift 2 ;;
    --phase) PHASE="$2"; shift 2 ;;
    --team-id) TEAM_ID="$2"; shift 2 ;;
    --status) STATUS="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "${TEAM_ID}" || -z "${AGENTIC_MEMORY_ID:-}" ]]; then
  echo "memory-write: team or memory id unset; skipping"
  exit 0
fi

REGION="${AWS_REGION:-ap-southeast-2}"
REPO_ID="$(echo "${GITHUB_REPOSITORY:-unknown/unknown}" | tr '/' '-')"
NS="/teams/${TEAM_ID}/repos/${REPO_ID}/tickets/${JIRA_KEY}/"

PAYLOAD="$(printf '{"schema_version":1,"phase":"%s","status":"%s","jira_key":"%s","team_id":"%s","repo":"%s","branch":"%s","commit_sha":"%s","workflow_run_id":"%s"}' \
  "${PHASE}" "$(echo "${STATUS}" | tr '[:upper:]' '[:lower:]')" "${JIRA_KEY}" "${TEAM_ID}" \
  "${GITHUB_REPOSITORY:-unknown}" "${GITHUB_REF_NAME:-unknown}" "${GITHUB_SHA:-unknown}" "${GITHUB_RUN_ID:-0}")"
EVENT_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

echo "memory-write: ns=${NS} phase=${PHASE} status=${STATUS}"
if ! aws bedrock-agentcore create-event \
  --region "${REGION}" \
  --memory-id "${AGENTIC_MEMORY_ID}" \
  --namespace "${NS}" \
  --actor-id "agentic-workflow-bot" \
  --session-id "${JIRA_KEY}" \
  --event-type "phase-boundary" \
  --event-timestamp "${EVENT_TIMESTAMP}" \
  --payload "${PAYLOAD}" \
  --no-cli-pager; then
  echo "memory-write: failed; continuing because this trial must not block on memory telemetry" >&2
fi
