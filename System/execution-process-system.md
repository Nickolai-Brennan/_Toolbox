# Execution Guide

> Type: Execution Process System — 9-Step Lifecycle

This guide defines the standard process for shipping any feature, document, or change in this repository.

---

## The 9-Step Lifecycle

### Step 1 — Define the Task

Write a clear, one-sentence task statement and add it to `In Action.md` with status `Backlog`.

**Output:** A task row in `In Action.md`.

---

### Step 2 — Gather Context

Collect the background information needed to complete the task:

- Read relevant files in `Docs/`.
- Review `System/architecture.md` for structural context.
- Check `Workflow/AI Execution Methods.md` for the appropriate execution mode.

**Output:** A list of relevant files and decisions.

---

### Step 3 — Select Execution Mode

Using the decision framework in `Workflow/AI Execution Methods.md`, choose:

- Single-Agent
- Sequential Pipeline
- Parallel Dispatch
- Supervisor/Worker

**Output:** Documented execution mode choice.

---

### Step 4 — Select & Configure Agent(s)

1. Browse `Automations/Agents/` and select the agent(s) best suited to the task.
2. Populate the meta-prompt template from `Workflow/AI Execution Methods.md`.
3. Inject relevant `Automations/Information/` files as context.

**Output:** A configured prompt ready to run.

---

### Step 5 — Execute

Run the configured prompt. Move the task status in `In Action.md` to `In Progress`.

**Output:** Raw agent output.

---

### Step 6 — Review Output

Check the agent output against the task's acceptance criteria:

- [ ] Does the output address the task statement?
- [ ] Are all files correctly named and front-mattered?
- [ ] Are there any factual errors or inconsistencies?

If the output fails review, revise the prompt and return to Step 5.

**Output:** Reviewed, approved content.

---

### Step 7 — Integrate

Place the approved output in the correct location:

- New doc → `Docs/<type>/<Title>.md`
- New automation asset → `Automations/<type>/<name>.md` + update `master-list.md`
- System change → Update `System/architecture.md` or `System/changelog.md`

**Output:** Files committed to the repository.

---

### Step 8 — Update Trackers

- Move the task in `In Action.md` to `Review` (or `Done` if no review is needed).
- Add a changelog entry in `System/changelog.md`.

**Output:** Updated `In Action.md` and `System/changelog.md`.

---

### Step 9 — Close & Reflect

1. Move the task to `Done` in `In Action.md`.
2. Note any lessons learned or process improvements.
3. If a new reusable asset was created, ensure it is in `Automations/` and indexed in `master-list.md`.

**Output:** Closed task. Improved process.

---

## Task Status Flow

```
Backlog → In Progress → Review → Done
                ↑            |
                └────────────┘ (revision loop)
```

---

## Quick Reference

| Step | Action | Updates |
|---|---|---|
| 1 | Define task | `In Action.md` |
| 2 | Gather context | — |
| 3 | Select execution mode | — |
| 4 | Configure agent | — |
| 5 | Execute | `In Action.md` (→ In Progress) |
| 6 | Review | — |
| 7 | Integrate | Target file(s), `master-list.md` |
| 8 | Update trackers | `In Action.md`, `System/changelog.md` |
| 9 | Close & reflect | `In Action.md` (→ Done) |
