# Architecture Decision Record - Memory Garden
002-documentation-frameworks.md

1. **Title:** Selection of Code and Developer Documentation Frameworks
2. **Status:** Accepted
3. **Context / Requirement Reference:** The project requires maintainable inline code documentation and developer documentation generation to ensure system transparency and ease of onboarding.
4. **Decision:** 
   - **Inline Code Documentation:** JSDoc
   - **Developer Documentation Generation:** JSDoc
5. **Rationale:** JSDoc is the industry standard for annotating JavaScript code. It is universally supported by IDEs (like VSCode) for intellisense and typing, and can automatically generate static HTML sites for developer reference via standard templates (e.g., Docdash or Minami).
6. **Assumptions:** The codebase remains predominantly JavaScript. If migrating to TypeScript in the future, TypeDoc will supersede this.
7. **Alternatives Considered:** 
   - ESDoc (deprecated/unmaintained compared to JSDoc).
   - Docusaurus (overkill for simple API/inline docs, better suited for user guides).
8. **Consequences / Implications:** 
   - All exported functions, classes, and complex logic blocks must include JSDoc block comments.
9. **Related Decisions / Notes:** Documentation generation should be wired into a generic `npm run docs` command.
