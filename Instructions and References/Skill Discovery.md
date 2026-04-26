Which directories you scan depends on your agent's environment. Most locally-running agents scan at least two scopes:

* **Project-level** (relative to the working directory): Skills specific to a project or repository.
* **User-level** (relative to the home directory): Skills available across all projects for a given user.

Other scopes are possible too — for example, organization-wide skills deployed by an admin, or skills bundled with the agent itself. The right set of scopes depends on your agent's deployment model.

Within each scope, consider scanning both a **client-specific directory** and the **`.agents/skills/` convention**:

| Scope   | Path                               | Purpose                       |
| ------- | ---------------------------------- | ----------------------------- |
| Project | `<project>/.<your-client>/skills/` | Your client's native location |
| Project | `<project>/.agents/skills/`        | Cross-client interoperability |
| User    | `~/.<your-client>/skills/`         | Your client's native location |
| User    | `~/.agents/skills/`                | Cross-client interoperability |
