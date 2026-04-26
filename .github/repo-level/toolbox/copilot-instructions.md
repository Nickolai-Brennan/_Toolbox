# Toolbox

## Repository Overview

**_Toolbox** is a knowledge-base and execution system owned by Nickolai Brennan. It is not a runnable application — it is a structured collection of documentation, AI automation assets, workflow templates, and architectural references used across a suite of sports-data and developer-tooling products.

There is no build, test, or lint pipeline. All files are Markdown or plain text.

---

## Repository Structure

```
_Toolbox/
├── .github/
│   └── copilot-instructions.md     ← this file
├── Actions/
│   └── Doc Creation/               ← document metadata templates
├── Automations/
│   ├── Agents/                     ← .agent.md files defining AI agent roles
│   ├── Instructions/               ← reference guides (e.g., how-to create custom instructions)
│   ├── Prompts/                    ← reusable prompt templates
│   ├── Skills/                     ← reusable, deterministic capability definitions
│   ├── Information/                ← knowledge/context retrieval sources
│   └── master-list.md              ← index of all automation assets
├── Docs/
│   ├── KBD/                        ← knowledge-base documents
│   ├── PRD/                        ← product requirement documents
│   └── Technical/                  ← technical specs
├── System/
│   ├── architecture.md             ← high-level architecture (in progress)
│   └── changelog.md                ← repo changelog (in progress)
├── Workflow/
│   ├── AI Execution Methods.md     ← AI orchestration meta-prompt & decision framework
│   └── Guide.md                    ← execution process system (9-step lifecycle)
├── In Action.md                    ← active project tracker
└── Master Stack.txt                ← full technology stack reference
```

---

## Technology Stack (from `Master Stack.txt`)

| Layer | Technologies |
|---|---|
| **Frontend** | React, Next.js, Tailwind CSS, TanStack (Table, Query, Router), PrimeReact, Flowbite |
| **Backend** | Python / FastAPI / Pydantic / SQLAlchemy; Node.js / TypeScript / Fastify |
| **API patterns** | REST primary; GraphQL (Apollo / Strawberry) where useful |
| **Database** | PostgreSQL (source of truth), Redis (cache/queue), Neo4j (optional graph) |
| **Queue / Workers** | Celery, scheduled jobs |
| **DevOps** | Docker, Docker Compose, GitHub Actions |
| **Hosting** | Vercel (frontend), Railway (backend/DB), Hostinger |
| **Dev environment** | VS Code, Codespaces, dev containers |
| **External data** | DataGolf, weather APIs, sportsbook/odds APIs, PGA event sources |

---

## Core Products Referenced

- **WeatherTrax** — weather-adjusted golf projection microservice
- **STORM / xSTATx** — analytics models, player metrics, leaderboards
- **CaddyStats** — content + data hybrid golf platform (articles, rankings, tournament center)
- **Hydra / OmniDocs** — document builder, task orchestration, AI-prompt framework
- **ProjXCafe** — profile/task marketplace with auth, wallet, reputation systems

---

## Execution Philosophy (Non-Negotiable Rules)

These govern how all work in this system must be approached:

- **No need → no build.** Define the problem before writing anything.
- **No workflow → no solution.** Map the user journey before designing a solution.
- **No doc → doesn't exist.** Every system, decision, and task must be documented.
- **No metric → no validation.** Every output must have a measurable success criterion.
- **No checklist → no execution.** All tasks must be tracked as checklist items.

---

## AI Orchestration Model (`Workflow/AI Execution Methods.md`)

Select the correct AI execution method using this decision order:

1. **Information** — retrieve grounding data/context first (PostgreSQL, APIs, internal docs)
2. **Skills** — apply a reusable, deterministic capability if one exists
3. **Agents** — use for multi-step, stateful, semi-autonomous workflows
4. **Prompts** — fallback for one-off, exploratory, or creative tasks

**Escalation rules:**
- Prompt used >3 times → convert to a Skill
- Skill chained >2 steps → wrap in an Agent
- Agent requires external data → integrate Information layer
- Repeated workflows across products → formalize into a microservice

---

## Document & File Conventions

- All documents use Markdown format.
- New documents should include the metadata header from `Actions/Doc Creation/`:
  ```
  Doc ID:
  Owner (Hat):
  Phase:
  Status: (Draft / Active / Deprecated)
  Related Features:
  Related Tasks:
  Last Updated:
  ```
- Architecture diagrams use Mermaid syntax inside Markdown files.
- Agent definition files follow the `.agent.md` naming convention and include a YAML frontmatter block (`name`, `description`) followed by a Markdown role definition.
- Folder naming uses consistent categories: `Agents/`, `Prompts/`, `Skills/`, `Information/`, `Instructions/`.

---

## Standard Folder Naming (applies to product repos)

```
apps/       ← user-facing products
services/   ← backend microservices
packages/   ← shared utilities, components, types
docs/       ← internal system documentation
data/       ← seeds, migrations, schemas, raw imports
infra/      ← Docker, deployment, CI/CD
```

---

## Working in This Repo

- There is no build or test command. All changes are documentation or asset edits.
- When adding a new agent, follow the `.agent.md` pattern in `Automations/Agents/`.
- When adding a new prompt, skill, or instruction, add a corresponding entry to `Automations/master-list.md`.
- When updating architecture or changelog files (`System/`), keep entries concise and dated.
- Always check `In Action.md` to understand what is currently being worked on before making additions.
