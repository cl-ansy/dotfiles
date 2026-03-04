Clean up: $ARGUMENTS

If no target is given, clean up the entire codebase.

Remove or fix the following — do not change behavior:

### Dead Code
- Unused variables, functions, classes, and types
- Unreachable code paths (after `return`, impossible conditions)
- Exported symbols that are never imported anywhere

### Unused Imports
- Imported but unused modules, types, and values
- Duplicate imports from the same module

### Stale Comments
- Commented-out code blocks
- TODO/FIXME comments older than the current feature (note them, ask before deleting)
- Comments that describe what the code does rather than why

### Redundancy
- Variables that are assigned and immediately returned
- Conditions that are always true or always false
- Identical logic duplicated in multiple places (flag only — do not refactor without asking)

Rules:
- Run the type checker and tests after changes to confirm nothing broke
- Do not delete TODOs without flagging them first — list them and ask
- Do not reformat code that doesn't need cleanup — keep diffs minimal
- Report a summary of what was removed and why
