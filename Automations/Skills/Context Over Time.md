## Manage skill context over time

Once skill instructions are in the conversation context, keep them effective for the duration of the session.

### Protect skill content from context compaction

If your agent truncates or summarizes older messages when the context window fills up, **exempt skill content from pruning**. Skill instructions are durable behavioral guidance — losing them mid-conversation silently degrades the agent's performance without any visible error. The model continues operating but without the specialized instructions the skill provided.

Common approaches:

* Flag skill tool outputs as protected so the pruning algorithm skips them
* Use the [structured tags](#structured-wrapping) from Step 4 to identify skill content and preserve it during compaction
