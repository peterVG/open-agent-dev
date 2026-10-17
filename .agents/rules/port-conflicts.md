---
copyright: Pieter Van Garderen (2026)
license: MIT
---

# Language-Agnostic Port Conflict Resolution

When the user encounters an error indicating that a network port is already in use (e.g., `EADDRINUSE`, `address already in use`), you MUST provide a framework-agnostic command to forcefully terminate the lingering process. 

This happens frequently during development when server processes crash or fail to shut down gracefully, regardless of the technology stack (Node.js, Python, Elixir, Go, etc.).

## The Port-Freeing Command
Suggest the command for the user's operating system, instructing them to replace `<port>` with the port number they are trying to free (e.g., 3000, 4000, 8080).

**macOS / Linux:**

```bash
lsof -ti:<port> | xargs kill -9
```

**Windows (Command Prompt or PowerShell):**

```bat
netstat -ano | findstr LISTENING | findstr :<port>
taskkill /PID <pid> /F
```

Replace `<pid>` with the process ID shown in the last column of the `netstat` output.

**Rule Application:**
1. Do not assume the user knows how to clear a port just because they use a specific framework (e.g. Next.js, Phoenix).
2. Explicitly provide the command for the user's OS as a helpful hint whenever an `EADDRINUSE` failure is detected. If the OS is unknown, provide both variants.
3. This is a stack-agnostic troubleshooting step; it does not depend on the framework that bound the port.
