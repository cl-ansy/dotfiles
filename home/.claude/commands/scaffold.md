Scaffold a new: $ARGUMENTS

Before writing anything, explore the codebase to understand existing conventions:
- Find 2-3 similar existing files and read them
- Note the naming patterns, file structure, import style, and export conventions
- Identify shared utilities, types, or base classes that should be reused

Then generate the new file(s) that:
- Match the existing patterns exactly — do not introduce new conventions
- Include only the structure, not placeholder business logic
- Use the same import style (absolute vs relative, named vs default)
- Wire into existing entry points (index files, routers, registries) if applicable

After scaffolding:
- List every file created or modified
- Note anything you couldn't infer from the codebase that the user needs to fill in
- Flag if no clear convention exists and you had to make a judgment call
