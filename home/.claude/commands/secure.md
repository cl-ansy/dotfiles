Perform a security audit of: $ARGUMENTS

If no target is specified, audit the entire codebase.

Check for:

### Input Validation
- Unvalidated user input reaching sensitive operations (DB queries, file paths, shell commands, HTML output)
- Missing or bypassable input sanitization

### Injection
- SQL injection, NoSQL injection
- Command injection (shell exec with user data)
- XSS (unsanitized output to HTML/JS)
- Path traversal

### Authentication & Authorization
- Missing auth checks on routes/functions
- Insecure session handling
- Privilege escalation paths

### Secrets & Config
- Hardcoded secrets, API keys, passwords in source
- Secrets logged or exposed in error messages
- Insecure defaults (open CORS, debug mode in prod)

### Dependencies
- Notably outdated or known-vulnerable packages (flag, don't enumerate all)

### TypeScript-Specific
- Unsafe `as` casts that bypass type safety at security boundaries
- `any` types on untrusted data

Format findings by severity: **Critical → High → Medium → Low → Informational**

For each finding: what it is, where it is (file:line), why it's a risk, how to fix it.
