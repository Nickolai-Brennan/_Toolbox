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
