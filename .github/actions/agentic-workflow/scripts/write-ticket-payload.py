#!/usr/bin/env python3
import argparse
import json
from pathlib import Path


parser = argparse.ArgumentParser()
parser.add_argument("--ticket-key", required=True)
parser.add_argument("--title", required=True)
parser.add_argument("--description", required=True)
parser.add_argument("--acceptance-criteria", required=True)
parser.add_argument("--output", required=True)
args = parser.parse_args()

criteria = [
    line.strip("- ").strip()
    for line in args.acceptance_criteria.splitlines()
    if line.strip()
]

payload = {
    "key": args.ticket_key,
    "title": args.title,
    "description": args.description,
    "acceptance_criteria": criteria,
    "source": "workflow_dispatch"
}

output = Path(args.output)
output.parent.mkdir(parents=True, exist_ok=True)
output.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

