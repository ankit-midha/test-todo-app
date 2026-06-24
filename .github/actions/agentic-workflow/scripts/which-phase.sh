#!/usr/bin/env bash
set -euo pipefail

REQUESTED_PHASE="auto"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --requested-phase) REQUESTED_PHASE="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 1 ;;
  esac
done

case "${REQUESTED_PHASE}" in
  auto|intake|assess-context|plan|implement|verify|open-pr|none) ;;
  *) echo "invalid phase: ${REQUESTED_PHASE}" >&2; exit 1 ;;
esac

if [[ "${REQUESTED_PHASE}" != "auto" ]]; then
  echo "name=${REQUESTED_PHASE}"
  exit 0
fi

ARTIFACTS_DIR=".workflow/artifacts"

if [[ ! -f "${ARTIFACTS_DIR}/spec.md" ]]; then
  echo "name=intake"
elif [[ ! -f "${ARTIFACTS_DIR}/context.md" ]]; then
  echo "name=assess-context"
elif [[ ! -f "${ARTIFACTS_DIR}/plan.md" ]]; then
  echo "name=plan"
elif [[ ! -f "${ARTIFACTS_DIR}/implementation.md" ]]; then
  echo "name=none"
elif [[ ! -f "${ARTIFACTS_DIR}/verify.md" ]]; then
  echo "name=verify"
else
  echo "name=open-pr"
fi
