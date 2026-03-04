Review the code changes in this project. $ARGUMENTS

Focus on:

1. **Correctness** — logic errors, edge cases, off-by-ones, null/undefined issues
2. **Types** — missing or overly broad TypeScript types, unsafe casts
3. **Error handling** — unhandled rejections, missing try/catch at boundaries, swallowed errors
4. **Security** — injection risks, exposed secrets, unsafe input handling, insecure defaults
5. **Complexity** — unnecessary abstractions, duplicated logic, functions doing too much
6. **Naming** — ambiguous names, misleading variable/function names

Format your output as:

### Critical
Issues that must be fixed before merging (bugs, security, broken types).

### Suggestions
Improvements worth considering but not blocking.

### Looks Good
What's well done — be specific, not just "good job".

Be direct. Skip praise for mediocre code. If something is wrong, say exactly what and why.
