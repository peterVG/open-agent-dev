---
<<<<<<< HEAD
description: Ensure all code is comprehensively documented using the standard inline documentation formats for this stack.
=======
description: Ensure all code is comprehensively documented using Elixir's native documentation attributes.
>>>>>>> 75685009fa5eedecd68f81efe52bac3207996175
---

# Inline Documentation Enforcement

**Purpose:** This rule dictates how an AI agent MUST document the codebase to satisfy the Inline Documentation Mandate in `AGENTS.md`.

## Active Enforcement

Before declaring any coding task "complete" or writing tests, the agent MUST verify that the following components include verbose inline documentation that clearly explains their function and intended usage:

<<<<<<< HEAD
1.  **ALL** Classes
2.  **ALL** Functions / Methods
3.  **ALL** Modules
4.  **ALL** Complex or non-obvious code blocks

### Python (Backend) Standards
The agent MUST use standard Python docstrings (using `"""`) adhering strictly to either the **Google** or **NumPy** docstring format.
These docstrings MUST be parseable by `pdoc` to generate the final developer documentation site.

### Javascript/TypeScript (Frontend) Standards
The agent MUST use standard `JSDoc` syntax (using `/** ... */`) for all frontend logic, hooks, utility functions, and complex React/Vue components.
=======
1.  **ALL** Modules (using `@moduledoc`)
2.  **ALL** Public Functions and Macros (using `@doc`)
3.  **ALL** Complex or non-obvious private functions / code blocks (using inline `#` comments)

### Elixir (Backend) Standards
The agent MUST use standard Elixir documentation attributes. These attributes expect Markdown strings and MUST be placed immediately before the module/function definition.
These attributes MUST be parseable by `ex_doc` to generate the final developer documentation site.

### Javascript/CSS (Frontend) Standards
For custom frontend scripts in `assets/`, the agent MUST use standard `JSDoc` syntax (using `/** ... */`) for all functions and logic blocks.
>>>>>>> 75685009fa5eedecd68f81efe52bac3207996175

*Failure to document code according to these standards violates the core AGENTS.md manifesto.*
