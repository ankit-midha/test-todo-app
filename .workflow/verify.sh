#!/usr/bin/env bash
set -euo pipefail

if [[ -f package.json ]]; then
  if command -v npm >/dev/null 2>&1; then
    npm test --if-present
    npm run lint --if-present
  else
    echo "verify: package.json exists but npm is unavailable" >&2
    exit 1
  fi
fi

if [[ -f index.html ]]; then
  grep -qi "<html" index.html
fi

NODE_BIN="${NODE_BIN:-$(command -v node || true)}"
if [[ -z "${NODE_BIN}" && -n "${RUNNER_TEMP:-}" ]]; then
  RUNNER_ROOT="$(cd "${RUNNER_TEMP}/../.." && pwd)"
  for candidate in \
    "${RUNNER_ROOT}/externals/node24/bin/node" \
    "${RUNNER_ROOT}/externals/node20/bin/node"
  do
    if [[ -x "${candidate}" ]]; then
      NODE_BIN="${candidate}"
      break
    fi
  done
fi

while IFS= read -r file; do
  if [[ -z "${NODE_BIN}" ]]; then
    echo "verify: node is required to check JavaScript syntax" >&2
    exit 1
  fi
  "${NODE_BIN}" --check "$file"
done < <(find . -path ./.git -prune -o -path ./.github -prune -o -name "*.js" -type f -print)

echo "verify: repository checks passed"
