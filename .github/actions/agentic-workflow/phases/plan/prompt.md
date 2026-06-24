# Plan Phase

Produce an implementation plan. Do not implement product code in this phase.

## Inputs

- `.workflow/artifacts/spec.md`
- `.workflow/artifacts/context.md`
- `CONTEXT.md`

## Tasks

1. Read the spec and context artifacts.
2. Write `.workflow/artifacts/plan.md`.
3. Commit only the plan artifact with message `plan: steps for <JIRA_KEY>`.
4. Push the current branch to origin.

## Plan Format

```markdown
---
generated_by: agentic-workflow-trial@v1
phase: plan
jira_key: <KEY>
---

# Plan for <KEY>

## Approach

## Steps

### Step 1: <name>
- Files:
- Test mode: tdd | test-after
- Work:
- Verification:

## Acceptance Criteria Mapping

## Risks

## Material Deviation Rules
```

Each step should map to one implementation commit. For the first todo app ticket, prefer a minimal dependency-free browser app unless the spec requires otherwise.

## Constraints

- Do not edit app code.
- Do not edit `CONTEXT.md`, `CODEOWNERS`, or `.github/`.
