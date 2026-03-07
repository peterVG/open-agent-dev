# Architecture Decision Record - Memory Garden
001-testing-frameworks.md

1. **Title:** Selection of Testing Frameworks (Unit, UI, Integration, Performance, Reporting)
2. **Status:** Accepted
3. **Context / Requirement Reference:** The AGENTS.md manifesto requires Test-Driven Extensibility (NFR-004), UI testing, Integration testing, Performance testing, and Test Reporting mandates. We need robust Node.js/JavaScript frameworks compatible with Express.js, Postgres, HTML5 Canvas, and Geckos.io.
4. **Decision:** 
   - **Unit & Integration Test Runner:** Jest
   - **UI Testing Framework:** Playwright
   - **Performance Testing Framework:** Artillery
   - **Test Reporting:** Allure
5. **Rationale:** 
   - **Jest** provides an all-in-one mocking and assertion library well-suited for Express.js and generic JavaScript logic.
   - **Playwright** effectively handles HTML5 Canvas interactions and visual assertions across multiple browsers.
   - **Artillery** is designed for Node.js backends and can easily load-test Geckos.io websockets and Express.js REST endpoints.
   - **Allure** generates structured, visual test reports that satisfy the test reporting mandate.
6. **Assumptions:** The team possesses sufficient JavaScript/Node.js testing expertise.
7. **Alternatives Considered:** 
   - *Unit/Integration:* Mocha/Chai (rejected for requiring multiple separate libraries, increasing boilerplate).
   - *UI:* Cypress (rejected for weaker support of multiple contexts/iframes compared to Playwright).
   - *Performance:* k6 (rejected in favor of Artillery's native Node/JS ecosystem alignment, though it remains a viable alternative).
8. **Consequences / Implications:** 
   - Developers must write tests using Jest syntax.
   - CI/CD pipelines must support Playwright browser installations.
9. **Related Decisions / Notes:** Ensure Jest is configured to support ES modules.
