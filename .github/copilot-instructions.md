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
---
applyTo: "**"
---
# Project general coding standards

## Naming Conventions
- Use PascalCase for component names, interfaces, and type aliases
- Use camelCase for variables, functions, and methods
- Prefix private class members with underscore (_)
- Use ALL_CAPS for constants

## Error Handling
- Use try/catch blocks for async operations
- Implement proper error boundaries in React components
- Always log errors with contextual information
- 
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

- When adding a new agent, follow the `.agent.md` pattern in `Automations/Agents/`.
- When adding a new prompt, skill, or instruction, add a corresponding entry to `Automations/master-list.md`.
- When updating architecture or changelog files (`System/`), keep entries concise and dated.
- Always check `In Action.md` to understand what is currently being worked on before making additions.
