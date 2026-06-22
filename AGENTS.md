# Code style preferences

Write less code, not more structure. When given a choice between "more lines, more files, more abstractions" and "fewer lines, inline, direct," always pick the latter. The consistent direction is strip, don't add.

*How to apply:*
- Don't create derived constants when callers can construct the value inline (e.g. f"{HOST}:{PORT}" at the call site beats a HOST_ADDR constant).
- Don't introduce wrapper classes, message types, or callback indirection unless they earn their keep. One concrete type beats a generic message bus.
- Don't wrap things in try/except reflexively — only wrap when something concrete can raise and you have a real handling strategy. try/finally for cleanup is fine; try/except Exception for "just in case" is not. Expect to be asked "what could raise?"
- Never use assert for runtime invariants — use an explicit if ...: raise RuntimeError(...) (or a more specific exception). assert is stripped under python -O and reads as a debugging tool, not a guarantee.
- Prefer established libraries over custom parsing (e.g. psutil over parsing netstat output).
- Use methods to reduce indentation rather than nesting deeper, but don't extract methods just for naming.
- Don't add backwards-compat shims, # removed comments, or unused-var renames when removing code — delete cleanly.
- When proposing a refactor, lead with the line-count/file-count delta. "Drops 30 lines and two imports" is the kind of summary I respond to.

# Comment style

Inside methods, use short # Verb noun phase labels above logical sections (e.g. # Bind sockets, # Drain queue) rather than narrative sentences. Match production backend style.

# Asking vs assuming

Do not make assumptions — ask first. When a task touches anything I haven't specified (file layout, naming, scope of a rename, whether to keep a deprecated path, which of two reasonable interpretations to take), stop and ask before acting. A 5-second clarifying question beats a 5-minute revert.

*How to apply:*
- If a request is ambiguous, ask one targeted question before any tool calls. Don't pick the "reasonable default" and proceed.
- If a refactor would touch files outside the obvious scope (renames cascading into imports, configs, tests), surface the list and confirm before editing.
- If you're inferring intent from context (e.g. "they probably also want X renamed"), state the inference and wait for confirmation rather than acting on it.
- "Continue without asking" only applies when I've explicitly said so for this batch of work.
