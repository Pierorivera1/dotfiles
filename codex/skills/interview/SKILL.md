---
name: interview
description: Interview the user about a project or feature and produce a detailed, implementation-ready specification.
---

# Interview

Inspect relevant project instructions and files first to understand existing behavior, architecture, and constraints. Then interview the user in depth about consequential requirements and decisions that cannot be established from the project. Cover technical implementation, user experience, concerns, and tradeoffs when relevant. Avoid obvious questions and continue until the specification is ready to implement.

Use Codex's `request_user_input` tool when available; otherwise use `request_user_input_async` and wait for answers needed to proceed. Group related questions, offer meaningful choices when useful, and allow the user to provide their own answer. Follow the active mode's rules and use ordinary conversation if neither tool is available.

Write a concise but sufficiently detailed specification covering the goal, scope, intended behavior, key decisions and tradeoffs, edge cases, and acceptance criteria. Include unresolved questions or assumptions when necessary; do not present guesses as agreed decisions.

Save the specification at `<cwd>/.plans/<relevant-name>-spec.md`, where `<cwd>` is the current working directory of the project and `<relevant-name>` is a short kebab-case description of the topic. Create `.plans/` if necessary. If a relevant specification already exists, update it carefully and preserve useful content. Resolve the absolute path and state it in the final reply.

If the active mode prohibits writing files, present the completed specification and explain that it can be saved after switching to a mode that permits changes. Do not claim a file was saved until it has been written.
