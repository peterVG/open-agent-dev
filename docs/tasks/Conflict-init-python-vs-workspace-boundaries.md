# Initialization Conflict Artifact

## 1. Conflict Description
There is a direct contradiction between the instructions in the `@.agents/skills/init-python/init-python.md` skill and the mandatory project rules defined in `@.agents/rules/workspace-boundaries.md` and `@.agents/rules/src-isolation.md`.

The skill instructs the agent to create the Python application structure (e.g., `requirements.txt`, `pyproject.toml`, `app/`, `tests/`) directly in the **project root**. However, the global rules explicitly forbid placing language-specific tooling at the root and mandate a monorepo structure where applications must be isolated inside the `apps/` or `services/` directories.

## 2. PRD/Skill Reference
**From `@.agents/skills/init-python/init-python.md` (Step 1):**
> "When scaffolding a new project, you MUST create the following directory structure at the root... project-root/ ├── .env ├── requirements.txt ├── pyproject.toml ├── pytest.ini ├── Dockerfile ├── docker-compose.yml ├── .dockerignore ├── app/..."

## 3. ADR/Rule Reference
**From `@.agents/rules/workspace-boundaries.md` (Structure & Tooling Isolation):**
> "You MUST NOT place language-specific dependency manifests (e.g., `package.json`, `mix.exs`, `requirements.txt`) or framework configuration files in the global repository root... NEVER run a scaffolding command targeting the repository root."

**From `@.agents/rules/src-isolation.md` (Source Directory Isolation Rule):**
> "All application code, environment configuration files, and dependency manifests necessary to build and deploy the application MUST reside within the workspace directory... (e.g., `apps/backend/app/`)"

## 4. Recommended Resolution
**Recommendation:** We should follow the stricter rules defined in `workspace-boundaries.md` and `src-isolation.md` to ensure the monorepo architecture remains pristine. We should target the application scaffolding to a dedicated workspace folder, e.g., `apps/api/` or `services/backend/`, instead of the repository root. The only file that should be placed in the root is `docker-compose.yml` per the `centralized-infrastructure.md` rule.

**Artifacts to update:** 
- The `@.agents/skills/init-python/init-python.md` file should ideally be updated to reflect the `apps/` and `services/` scaffolding approach to avoid confusing agents in the future.

## 5. Impact Assessment
If this conflict is not resolved and the skill is followed blindly:
- The global repository root will be polluted with Python-specific tooling (`requirements.txt`, `pyproject.toml`), violating the language-agnostic monorepo architecture.
- Future frontend scaffolding (e.g. Next.js) will struggle to exist cleanly alongside root Python files.
- The `workspace-boundaries.md` and `src-isolation.md` rules will be fundamentally broken from day one.
