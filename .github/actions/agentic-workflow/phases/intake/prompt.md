# Intake Phase

Read the ticket payload and produce the requester-approved specification. Do not implement product code in this phase.

## Inputs

- `JIRA_KEY`: ticket key or trial id.
- `TICKET_PAYLOAD_FILE`: JSON with `key`, `title`, `description`, and `acceptance_criteria`.
- `CONTEXT.md`: repository context.

## Tasks

1. Read `TICKET_PAYLOAD_FILE`.
2. Read `CONTEXT.md`.
3. Create `.workflow/artifacts/spec.md`.
4. Commit only the spec artifact with message `intake: spec for <JIRA_KEY>`.
5. Push the current branch to origin.
6. If a PR for the current branch does not exist, open a draft PR against the default branch.

## Spec Format

```markdown
---
generated_by: agentic-workflow-trial@v1
phase: intake
jira_key: <KEY>
size: trivial | standard | large
source: payload
---

# <ticket key>: <one-line summary>

## Problem

## Goal

## Non-Goals

## Users / Surfaces affected

## Acceptance Criteria

## Open Questions

## Out-of-Scope
```

Surface ambiguity as Open Questions instead of inventing requirements.

## Constraints

- Do not edit app code.
- Do not edit `.github/`, `CODEOWNERS`, `CONTEXT.md`, or `.workflow/verify.sh`.
- Do not call Jira or Atlassian tools.
