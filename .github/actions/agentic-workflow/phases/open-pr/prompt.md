# Open PR Phase

Prepare the pull request for human review.

## Inputs

- `.workflow/artifacts/spec.md`
- `.workflow/artifacts/context.md`
- `.workflow/artifacts/plan.md`
- `.workflow/artifacts/verify.md`

## Tasks

1. Confirm all required artifacts exist.
2. Ensure the branch is pushed.
3. Find the PR for the current branch.
4. Mark the PR ready for review if it is still draft.
5. Update the PR body with links/summary of artifacts and verification.

## Constraints

- Do not implement product changes in this phase.
- Do not edit `.github/`, `CODEOWNERS`, or `CONTEXT.md`.
