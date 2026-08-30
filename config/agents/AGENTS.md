- **Always** re-read files before writing them in case I've edited them manually.

## Using git and GitHub

- When writing git commit messages **always** use proper sentence case.

- Write bullet points in sentence case starting each bullet with a capital
  letter.

- When writing git commit messages **always** make sure they have a body as well
  as a subject that explains what the commit does. You can omit this for very
  small changes which are inconsequential such as commits which only fix
  formatting, fix typos, update documentation etc.

- When creating Pull Requests if there is a pull request template in the current
  directory located at `.github/pull_request_template.md` use it as a template
  and fill in the relevant details.

- **Always** put git worktrees in the current project directory under .worktrees/
  Do not use the system temp directory for them.

- **Never** merge main/master directly into feature branches. **Always** rebase
  main/master instead.

- When using the Superpowers plugin **always** create a git worktree when
  implementing a feature unless otherwise instructed.

- When fixing issues pointed out through code review create "fix up" commits
  like `git commit --fixup=<sha>` which fix the original commit rather than
  creating new commits.

- When altering existing code create logical commits which tell the story of the
  change. When adding new code single commits are ok.

- See `docs/git/commit-message.md` for an example of a good git commit message

## Writing Markdown

- When writing prose and referring to code functions, modules, values, or cli
  commands like mix format, **always** format them as code in Markdown by
  surrounding them in backticks ` like `Example.code` or  `mix format`.

- When outputting multi-step plans to be manually followed Markdown task list
  syntax for the points. For example:

      - [ ] Incomplete task
      - [ ] Another incomplete task
        - [ ] Nested subtask

## Writing Elixir code

- **Do not** overuse the pipe(|>). It's fine to use it in a proper pipeline, but
  if a function accepts an argument pass it conventionaly.

- Don't add multiple function heads that delegate to other functions with
  different arity unless they are actually used. Helper functions are fine, but
  only when they're actually called from somewhere.

