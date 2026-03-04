Refactor the following: $ARGUMENTS

Rules:
- **Do not change behavior** — refactoring means same inputs, same outputs
- **Do not add features** — if you spot something to add, note it separately
- **Do not expand scope** — only touch what's asked

Priorities (in order):
1. Eliminate duplication — extract repeated logic into shared helpers
2. Improve naming — rename anything that obscures intent
3. Simplify control flow — flatten nested conditions, prefer early returns
4. Tighten types — narrow overly broad types, remove unnecessary casts
5. Remove dead code — delete unreachable branches, unused variables

After refactoring:
- Run tests to confirm behavior is unchanged
- Show a brief diff summary of what changed and why
- Note anything you deliberately left alone and why
