# Repository Context

This repository is intentionally empty of product code. It is used to trial an
agentic software-development workflow that builds a todo app from tickets.

## Product Direction

Build a small todo application incrementally from tickets. Start simple and add
capabilities only when requested by a ticket.

## Engineering Conventions

- Prefer a dependency-free browser app for the first implementation unless the
  approved plan justifies a framework.
- Keep changes small, readable, and easy to verify.
- Generated workflow artifacts live in `.workflow/artifacts/`.
- Runtime application code should not be placed inside `.github/`.
- If the app remains dependency-free, it should work by opening `index.html`
  directly in a browser.

## Verification

Run:

```bash
./.workflow/verify.sh
```

