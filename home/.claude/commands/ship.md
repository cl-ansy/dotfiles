Prepare the current work to be merged. $ARGUMENTS

Run through this checklist in order — stop and report if anything fails:

1. **Understand the change** — read the diff (`git diff main...HEAD`), summarize what it does in one sentence
2. **Run tests** — execute the test suite; if no tests exist, flag it
3. **Type check** — run `tsc --noEmit` or the project's type check command
4. **Lint** — run the project linter if configured
5. **Review for obvious issues** — quick self-review of the diff for anything embarrassing
6. **Stage changes** — add relevant files (never `git add .` blindly)
7. **Write commit message** — imperative mood, explain the WHY, not the what
8. **Create PR** — short title, body includes: what changed, why, how to test

Do not skip steps. Do not commit or push without running checks first.
If the project has a CI pipeline, note what checks will run.
