Debug the following issue: $ARGUMENTS

Work through this systematically — do not guess.

1. **Reproduce** — confirm you can trigger the problem. Show the exact input and observed output vs expected output.
2. **Locate** — trace the execution path. Read relevant code, logs, and stack traces. Identify the smallest scope where the bug lives.
3. **Hypothesize** — form 2-3 specific hypotheses about the root cause. Be explicit: "I think X because Y."
4. **Test each hypothesis** — use the codebase, add temporary logging, or inspect state to confirm or eliminate each one.
5. **Fix** — implement the minimal fix for the confirmed root cause. Do not fix symptoms.
6. **Verify** — confirm the original issue is resolved and no regressions are introduced.

Rules:
- Do not jump to solutions before completing steps 1-4
- Do not change multiple things at once — one hypothesis at a time
- If you cannot reproduce it, stop and say so — do not guess at a fix
- Note any related issues you spotted but did not fix
