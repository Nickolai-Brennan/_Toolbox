---
name: stack-verifier
description: Verifies that required development tools (node, npm, python, pip, docker, git, psql) are present in the environment. Use when setting up the project, after cloning the repo, or when environment/dependency files change.
compatibility: Requires bash. Designed for Linux/macOS and GitHub Actions (ubuntu-latest).
metadata:
  author: xXx_Lab
  version: "1.0"
---

# Stack Verifier

Checks for the presence of common development tools and prints `OK` or `MISSING` for each one.

## Auto-run (GitHub Actions)

This skill is automatically triggered by the GitHub Actions workflow at
`.github/workflows/verify-stack.yml`.

The workflow runs `scripts/verify-stack.sh` on every `push` and `pull_request`
that touches any of the following files:

- `config/env.example`
- `config/stack.config.json`
- `.env*`
- `scripts/verify-stack.sh`
- `package.json`, `package-lock.json`, `pnpm-lock.yaml`, `yarn.lock`
- `requirements.txt`, `pyproject.toml`, `poetry.lock`, `Pipfile`, `Pipfile.lock`
- `docker-compose.yml`, `docker-compose.*.yml`

> **Note:** This `SKILL.md` file is documentation/metadata for Copilot and humans.
> It does **not** trigger automatically on repo events by itself — that is handled
> entirely by the GitHub Actions workflow above.

## Manual run

```bash
bash scripts/verify-stack.sh
```

## What it checks

| Tool     | Purpose                  |
|----------|--------------------------|
| `node`   | JavaScript runtime       |
| `npm`    | Node package manager     |
| `python` | Python interpreter       |
| `pip`    | Python package manager   |
| `docker` | Container runtime        |
| `git`    | Version control          |
| `psql`   | PostgreSQL client        |

## Example output

```
=== Stack Verification ===
  ✅  node       OK   (v20.11.0)
  ✅  npm        OK   (10.2.4)
  ✅  python     OK   (Python 3.11.7)
  ✅  pip        OK   (pip 23.3.1 from ...)
  ❌  docker     MISSING
  ✅  git        OK   (git version 2.43.0)
  ✅  psql       OK   (psql (PostgreSQL) 15.5)
==========================
Result: 1 tool(s) missing. Please install them before continuing.
```

The script exits with code `1` if any tool is missing, making it safe to use as a
CI gate.
