# Assess Context Phase

Produce a context document for the ticket. This repo may intentionally have no product code yet; handle that as greenfield work.

## Inputs

- `.workflow/artifacts/spec.md`
- `CONTEXT.md`
- Current repository files

## Tasks

1. Read the spec and repository context.
2. Inspect the repository structure with targeted commands.
3. Write `.workflow/artifacts/context.md`.
4. Commit only the context artifact with message `assess: context for <JIRA_KEY>`.
5. Push the current branch to origin.

## Context Format

```markdown
---
generated_by: agentic-workflow-trial@v1
phase: assess-context
jira_key: <KEY>
---

# Context for <KEY>

## Repository State

## Relevant Existing Files

## Conventions To Preserve

## Proposed Insertion Points

## Risks / Unknowns
```

If there is no app yet, say so directly and propose a minimal starting structure.

## Constraints

- Do not implement product code.
- Do not edit `CONTEXT.md`, `CODEOWNERS`, or `.github/`.
