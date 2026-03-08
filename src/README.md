# Source Code Directory (`/src`)

This directory contains the entire application codebase and everything required to run the application in production. 

## Purpose

The primary design principle for the `/src` directory is to be **standalone and exportable**.

You should be able to copy or export *only* the `/src` directory from this repository, and have a fully functional application without needing any other files from the parent project structure (such as documentation, AI rules, or CI/CD pipelines intended for development).

## Design Principles

1. **Self-Contained Execution:** All application dependencies, configurations necessary for running the application, and the application code itself reside here.
2. **Separation from Dev Tooling:** Project-level management tools, architectural decision records, and AI agent configuration (`.ai`, `docs`, etc.) live completely outside this directory.
3. **Deployment Ready:** When building a Docker image or zipping a deployment package, pointing to the `/src` directory should be sufficient.

## What Goes Here

- **Application Logic:** The core codebase (e.g., Python scripts, Elixir modules, JS frameworks).
- **Application Configuration:** Settings needed to run the app (e.g., `application.yml`, `config.exs`).
- **Dependency Manifests:** Files that define the runtime packages needed (e.g., `requirements.txt`, `mix.exs`, `package.json` for the core app).
- **Public Assets:** Static files served by the application.

## What Does NOT Go Here

- Project documentation (`/docs`)
- AI Agent configurations and knowledge base (`/.ai`)
- Project-level planning and task files
- Architectural Decision Records
