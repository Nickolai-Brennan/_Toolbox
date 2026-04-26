# AI Execution Methods

> Type: AI Orchestration Meta-Prompt & Decision Framework

This document is the master reference for how AI agents are invoked, composed, and governed within this repository.

---

## 1. Execution Modes

| Mode | Description | When to Use |
|---|---|---|
| **Single-Agent** | One agent handles the entire task end-to-end | Simple, self-contained tasks |
| **Sequential Pipeline** | Agents hand off outputs to the next agent in a chain | Multi-step workflows where each step depends on the previous |
| **Parallel Dispatch** | Multiple agents run simultaneously on independent sub-tasks | Tasks that can be decomposed without dependencies |
| **Supervisor/Worker** | A supervisor agent breaks down a task and delegates to workers | Complex tasks requiring planning + execution |

---

## 2. Agent Selection Decision Framework

```
Is the task well-defined and self-contained?
├── YES → Use Single-Agent mode.
│         Select the agent whose Role best matches the task.
└── NO  → Does the task have clear sequential steps?
          ├── YES → Use Sequential Pipeline.
          │         Map each step to the most appropriate agent.
          └── NO  → Can the task be split into independent sub-tasks?
                    ├── YES → Use Parallel Dispatch.
                    └── NO  → Use Supervisor/Worker.
                              Assign a planning agent as Supervisor.
```

---

## 3. Meta-Prompt Template

Use this template to instantiate any agent defined in `Automations/Agents/`.

```
SYSTEM:
You are {{agent_name}}. {{agent_role_description}}

Your goals are:
{{agent_goals}}

You must respect the following constraints:
{{agent_constraints}}

You have access to the following tools:
{{agent_tools}}

CONTEXT:
{{injected_information}}

USER TASK:
{{task_description}}

Begin by stating your understanding of the task and your planned approach, then execute.
```

**Variables:**

| Variable | Source |
|---|---|
| `{{agent_name}}` | `title` field in the `.agent.md` file |
| `{{agent_role_description}}` | `Role` section of the `.agent.md` file |
| `{{agent_goals}}` | `Goals` section of the `.agent.md` file |
| `{{agent_constraints}}` | `Constraints` section of the `.agent.md` file |
| `{{agent_tools}}` | `Tools` section of the `.agent.md` file |
| `{{injected_information}}` | Relevant files from `Automations/Information/` |
| `{{task_description}}` | The specific task provided by the user or upstream agent |

---

## 4. Output Handling

- **Structured outputs** (tables, lists, code) → write directly to the appropriate file.
- **Decisions** → record in `System/changelog.md` under the current date.
- **Task status changes** → update `In Action.md`.
- **New automation assets** → place in the appropriate `Automations/` sub-folder and register in `master-list.md`.

---

## 5. Quality Gates

Before an agent's output is accepted as final, verify:

- [ ] Output matches the task's acceptance criteria.
- [ ] All created/modified files include valid front-matter.
- [ ] `Automations/master-list.md` is updated if new assets were created.
- [ ] `In Action.md` reflects the current task status.
- [ ] `System/changelog.md` records any structural changes.
