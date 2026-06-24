# Implement Phase

Implement the approved plan.

## Inputs

- `.workflow/artifacts/spec.md`
- `.workflow/artifacts/context.md`
- `.workflow/artifacts/plan.md`
- `CONTEXT.md`

## Tasks

1. Read the spec, context, and plan.
2. Implement only the planned scope.
3. Follow the plan step order.
4. Make one commit per plan step where practical, using messages like `step 1: <summary>`.
5. Push the current branch to origin after committing.
6. If the plan is materially wrong, stop and write `.workflow/artifacts/implementation-blocked.md` explaining why.

## Constraints

- Do not edit `.github/`, `CODEOWNERS`, or `CONTEXT.md`.
- Do not add dependencies unless the plan explicitly approved them.
- Keep the app runnable and verifiable.
- Run relevant checks before each commit when feasible.
