Write or update documentation for: $ARGUMENTS

If no target is given, document the current module or most recently discussed code.

Before writing, read the target code fully. Do not document what you haven't read.

Choose the appropriate format based on what's needed:

### JSDoc (for functions, classes, types)
- Document params, return type, and thrown errors
- Include a one-line summary and a usage example for non-obvious functions
- Do not document things the types already express — only add what types can't capture

### Module/File README
- What this module does and why it exists
- Public API surface: what to import and how to use it
- What it does NOT do (scope boundary)
- Example usage — real, runnable code snippets

### README section
- Clear heading, concise prose
- Code examples that actually work
- No filler — every sentence must earn its place

Rules:
- Match the style and format of existing docs in the project
- Do not add docs to code you didn't touch
- If existing docs are wrong or outdated, fix them
- Flag any public APIs that have no clear intended use — they may need design clarification, not just docs
