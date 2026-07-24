---
name: kick-off
description: Start working on an issue from a issue tracking system
argument-hint: [issue-id]
---

# Start working on a new issue

Instructions:

- The user may provide the issue ID as an argument to this skill. Prompt the
  user to provide the issue ID if not received as an argument.

- If the issue ID is an integer look for the issue in GitHub issues using `gh` utility

- If the issue ID is in the form ABC-123 look for the issue in Linear using the `linear` utility

- Retrieve the issue from the relevant issue tracking software and read it.

- Summarise the ticket back to the user and await further instructions.
