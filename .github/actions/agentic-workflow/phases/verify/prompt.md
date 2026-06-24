# Verify Phase

Verify that the implementation satisfies the spec and plan.

## Inputs

- `.workflow/artifacts/spec.md`
- `.workflow/artifacts/context.md`
- `.workflow/artifacts/plan.md`
- Current implementation

## Tasks

1. Run `./.workflow/verify.sh`.
2. Run any obvious additional checks for the chosen app stack.
3. Review the diff against the spec and plan.
4. Write `.workflow/artifacts/verify.md`.
5. Commit `verify.md` with message `verify: checks for <JIRA_KEY>`.
6. Push the current branch to origin.

## Verify Format

```markdown
---
generated_by: agentic-workflow-trial@v1
phase: verify
jira_key: <KEY>
---

# Verify for <KEY>

## Commands Run

## Results

## Acceptance Criteria Check

## Self Review

## Residual Risk
```

If checks fail, fix in-scope issues and rerun. If failures imply the plan was wrong, stop and document that.
