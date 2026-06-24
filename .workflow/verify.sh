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

while IFS= read -r file; do
  node --check "$file"
done < <(find . -path ./.git -prune -o -path ./.github -prune -o -name "*.js" -type f -print)

echo "verify: repository checks passed"

