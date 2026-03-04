# gang

A reusable Claude Code configuration: global instructions and slash commands shared across all projects.

## Structure

```
gang/
├── CLAUDE.md           # Global agent instructions (symlinked to ~/.claude/CLAUDE.md)
└── commands/           # Custom slash commands (symlinked to ~/.claude/commands/)
    ├── review.md       # /review   — deep code review
    ├── ship.md         # /ship     — test, commit, PR
    ├── refactor.md     # /refactor — targeted refactoring
    ├── spec.md         # /spec     — idea → implementation plan
    ├── secure.md       # /secure   — security audit
    ├── debug.md        # /debug    — systematic debugging
    ├── explain.md      # /explain  — plain-English code explanation
    ├── perf.md         # /perf     — performance audit
    ├── scaffold.md     # /scaffold — generate new modules from existing conventions
    ├── cleanup.md      # /cleanup  — remove dead code, unused imports, stale comments
    └── docs.md         # /docs     — write or update documentation
```

## Install

Symlink this repo's config into `~/.claude/` so it applies globally:

```bash
# Back up anything existing first
cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.bak 2>/dev/null

# Symlink global instructions
ln -sf ~/Code/gang/CLAUDE.md ~/.claude/CLAUDE.md

# Symlink commands directory
ln -sf ~/Code/gang/commands ~/.claude/commands
```

After this, all 11 commands (`/review`, `/ship`, `/refactor`, `/spec`, `/secure`, `/debug`, `/explain`, `/perf`, `/scaffold`, `/cleanup`, `/docs`) are available in any Claude Code session.

## Per-Project Overrides

Add a `CLAUDE.md` at the root of any project to extend or override the global config:

```markdown
# Project: my-api

Extends global config. Project-specific rules:
- Use Zod for all input validation
- Postgres via Drizzle ORM — never raw SQL
- All endpoints require JWT auth middleware
```

## Customizing

- Edit `CLAUDE.md` to change your global coding standards and workflow rules
- Add new `.md` files to `commands/` to create new slash commands
- Use `$ARGUMENTS` in a command file to capture what's typed after the command name
