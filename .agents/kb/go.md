---
type: Reference
title: Go — Official Documentation Agent Reference
description: Agent-facing synthesis of the full Go User Manual at go.dev/doc (tutorials, Effective Go, FAQ, language spec,
  memory model, modules and layout, go command, diagnostics, database/sql, and standard-library articles) as of go1.27.2.
resource: https://go.dev/doc/
tags:
- go
- golang
- language-spec
- modules
- module-layout
- effective-go
- tooling
- testing
- diagnostics
- database-sql
- coding-agents
status: stable
generated:
  by: process:kb-synthesizer
  at: 2026-10-19T00:00:00Z
stale_after: '2027-02-28'
sources:
- id: install
  resource: https://go.dev/doc/install
  title: Download and install
  author: process:go-project
- id: tut-start
  resource: https://go.dev/doc/tutorial/getting-started
  title: 'Tutorial: Get started with Go'
  author: process:go-project
- id: tut-module
  resource: https://go.dev/doc/tutorial/create-module
  title: 'Tutorial: Create a Go module'
  author: process:go-project
- id: tut-module-call
  resource: https://go.dev/doc/tutorial/call-module-code
  title: Call your code from another module
  author: process:go-project
- id: tut-module-errors
  resource: https://go.dev/doc/tutorial/handle-errors
  title: Return and handle an error
  author: process:go-project
- id: tut-module-random
  resource: https://go.dev/doc/tutorial/random-greeting
  title: Return a random greeting
  author: process:go-project
- id: tut-module-map
  resource: https://go.dev/doc/tutorial/greetings-multiple-people
  title: Return greetings for multiple people
  author: process:go-project
- id: tut-module-test
  resource: https://go.dev/doc/tutorial/add-a-test
  title: Add a test
  author: process:go-project
- id: tut-module-install
  resource: https://go.dev/doc/tutorial/compile-install
  title: Compile and install the application
  author: process:go-project
- id: tut-workspaces
  resource: https://go.dev/doc/tutorial/workspaces
  title: 'Tutorial: Getting started with multi-module workspaces'
  author: process:go-project
- id: tut-gin
  resource: https://go.dev/doc/tutorial/web-service-gin
  title: 'Tutorial: Developing a RESTful API with Go and Gin'
  author: process:go-project
- id: tut-generics
  resource: https://go.dev/doc/tutorial/generics
  title: 'Tutorial: Getting started with generics'
  author: process:go-project
- id: tut-fuzz
  resource: https://go.dev/doc/tutorial/fuzz
  title: 'Tutorial: Getting started with fuzzing'
  author: process:go-project
- id: wiki-webapp
  resource: https://go.dev/doc/articles/wiki/
  title: Writing Web Applications
  author: process:go-project
- id: code
  resource: https://go.dev/doc/code
  title: How to Write Go Code
  author: process:go-project
- id: tour
  resource: https://go.dev/tour/
  title: A Tour of Go
  author: process:go-project
- id: effective-go
  resource: https://go.dev/doc/effective_go
  title: Effective Go
  author: process:go-project
- id: faq
  resource: https://go.dev/doc/faq
  title: Frequently Asked Questions (FAQ)
  author: process:go-project
- id: editors
  resource: https://go.dev/doc/editors
  title: Editor plugins and IDEs
  author: process:go-project
- id: cw-functions
  resource: https://go.dev/doc/codewalk/functions
  title: 'Codewalk: First-Class Functions in Go'
  author: process:go-project
- id: cw-markov
  resource: https://go.dev/doc/codewalk/markov
  title: 'Codewalk: Generating arbitrary text: a Markov chain algorithm'
  author: process:go-project
- id: cw-sharemem
  resource: https://go.dev/doc/codewalk/sharemem
  title: 'Codewalk: Share Memory By Communicating'
  author: process:go-project
- id: blog-jsonrpc
  resource: https://go.dev/blog/json-rpc-tale-of-interfaces
  title: 'JSON-RPC: a tale of interfaces'
  author: process:go-project
- id: blog-decl
  resource: https://go.dev/blog/gos-declaration-syntax
  title: Go's Declaration Syntax
  author: process:go-project
- id: blog-defer
  resource: https://go.dev/blog/defer-panic-and-recover
  title: Defer, Panic, and Recover
  author: process:go-project
- id: blog-timeout
  resource: https://go.dev/blog/go-concurrency-patterns-timing-out-and
  title: 'Go Concurrency Patterns: Timing out, moving on'
  author: process:go-project
- id: blog-slices
  resource: https://go.dev/blog/go-slices-usage-and-internals
  title: 'Go Slices: usage and internals'
  author: process:go-project
- id: blog-gif
  resource: https://go.dev/blog/gif-decoder-exercise-in-go-interfaces
  title: 'A GIF decoder: an exercise in Go interfaces'
  author: process:go-project
- id: blog-errors
  resource: https://go.dev/blog/error-handling-and-go
  title: Error handling and Go
  author: process:go-project
- id: go-spec
  resource: https://go.dev/ref/spec
  title: The Go Programming Language Specification (Language version go1.27, May 26, 2026)
  author: process:go-project
- id: go-mem
  resource: https://go.dev/ref/mem
  title: The Go Memory Model (Version of June 6, 2022)
  author: process:go-project
- id: ref-mod
  resource: https://go.dev/ref/mod
  title: Go Modules Reference
  author: process:go-project
- id: gomod-ref
  resource: https://go.dev/doc/modules/gomod-ref
  title: go.mod file reference
  author: process:go-project
- id: managing-deps
  resource: https://go.dev/doc/modules/managing-dependencies
  title: Managing dependencies
  author: process:go-project
- id: mod-developing
  resource: https://go.dev/doc/modules/developing
  title: Developing and publishing modules
  author: process:go-project
- id: release-workflow
  resource: https://go.dev/doc/modules/release-workflow
  title: Module release and versioning workflow
  author: process:go-project
- id: managing-source
  resource: https://go.dev/doc/modules/managing-source
  title: Managing module source
  author: process:go-project
- id: mod-layout
  resource: https://go.dev/doc/modules/layout
  title: Organizing a Go module
  author: process:go-project
- id: major-version
  resource: https://go.dev/doc/modules/major-version
  title: Developing a major version update
  author: process:go-project
- id: mod-publishing
  resource: https://go.dev/doc/modules/publishing
  title: Publishing a module
  author: process:go-project
- id: version-numbers
  resource: https://go.dev/doc/modules/version-numbers
  title: Module version numbering
  author: process:go-project
- id: blog-using-modules
  resource: https://go.dev/blog/using-go-modules
  title: Using Go Modules (Go Blog, part 1)
  author: process:go-project
- id: blog-migrating-modules
  resource: https://go.dev/blog/migrating-to-go-modules
  title: Migrating to Go Modules (Go Blog, part 2)
  author: process:go-project
- id: blog-publishing-modules
  resource: https://go.dev/blog/publishing-go-modules
  title: Publishing Go Modules (Go Blog, part 3)
  author: process:go-project
- id: blog-v2-modules
  resource: https://go.dev/blog/v2-go-modules
  title: 'Go Modules: v2 and Beyond (Go Blog, part 4)'
  author: process:go-project
- id: blog-module-compat
  resource: https://go.dev/blog/module-compatibility
  title: Keeping Your Modules Compatible (Go Blog, part 5)
  author: process:go-project
- id: toolchain
  resource: https://go.dev/doc/toolchain
  title: Go Toolchains
  author: process:go-project
- id: cmd-index
  resource: https://go.dev/doc/cmd
  title: Command Documentation
  author: process:go-project
- id: cmd-go
  resource: https://pkg.go.dev/cmd/go
  title: go command (cmd/go)
  author: process:go-project
- id: go-command-article
  resource: https://go.dev/doc/articles/go_command
  title: About the go command
  author: process:go-project
- id: doc-comments
  resource: https://go.dev/doc/comment
  title: Go Doc Comments
  author: process:go-project
- id: diagnostics
  resource: https://go.dev/doc/diagnostics
  title: Diagnostics
  author: process:go-project
- id: gc-guide
  resource: https://go.dev/doc/gc-guide
  title: A Guide to the Go Garbage Collector
  author: process:go-project
- id: fuzzing
  resource: https://go.dev/security/fuzz
  title: Go Fuzzing
  author: process:go-project
- id: build-cover
  resource: https://go.dev/doc/build-cover
  title: Coverage profiling support for integration tests
  author: process:go-project
- id: pgo
  resource: https://go.dev/doc/pgo
  title: Profile-guided optimization
  author: process:go-project
- id: gdb
  resource: https://go.dev/doc/gdb
  title: Debugging Go Code with GDB
  author: process:go-project
- id: race-detector
  resource: https://go.dev/doc/articles/race_detector
  title: Data Race Detector
  author: process:go-project
- id: race-blog
  resource: https://go.dev/blog/race-detector
  title: Introducing the Go Race Detector
  author: process:go-project
- id: asm
  resource: https://go.dev/doc/asm
  title: A Quick Guide to Go's Assembler
  author: process:go-project
- id: cgo-blog
  resource: https://go.dev/blog/c-go-cgo
  title: C? Go? Cgo!
  author: process:go-project
- id: cmd-cgo
  resource: https://pkg.go.dev/cmd/cgo
  title: cgo command (cmd/cgo)
  author: process:go-project
- id: profiling-blog
  resource: https://go.dev/blog/profiling-go-programs
  title: Profiling Go Programs
  author: process:go-project
- id: gopls
  resource: https://go.dev/gopls/
  title: 'gopls: the Go language server'
  author: process:go-project
- id: contribute
  resource: https://go.dev/doc/contribute
  title: Contribution Guide
  author: process:go-project
- id: release-history
  resource: https://go.dev/doc/devel/release
  title: Release History
  author: process:go-project
- id: go1-27
  resource: https://go.dev/doc/go1.27
  title: Go 1.27 Release Notes
  author: process:go-project
- id: go1-26
  resource: https://go.dev/doc/go1.26
  title: Go 1.26 Release Notes
  author: process:go-project
- id: security-best-practices
  resource: https://go.dev/doc/security/best-practices
  title: Security Best Practices for Go Developers
  author: process:go-project
- id: govulncheck-tutorial
  resource: https://go.dev/doc/tutorial/govulncheck
  title: 'Tutorial: Find and fix vulnerable dependencies with govulncheck'
  author: process:go-project
- id: db-tutorial
  resource: https://go.dev/doc/tutorial/database-access
  title: 'Tutorial: Accessing a relational database'
  author: process:go-project
- id: db-index
  resource: https://go.dev/doc/database/index
  title: Accessing relational databases
  author: process:go-project
- id: db-open-handle
  resource: https://go.dev/doc/database/open-handle
  title: Opening a database handle
  author: process:go-project
- id: db-change-data
  resource: https://go.dev/doc/database/change-data
  title: Executing SQL statements that don't return data
  author: process:go-project
- id: db-querying
  resource: https://go.dev/doc/database/querying
  title: Querying for data
  author: process:go-project
- id: db-prepared
  resource: https://go.dev/doc/database/prepared-statements
  title: Using prepared statements
  author: process:go-project
- id: db-transactions
  resource: https://go.dev/doc/database/execute-transactions
  title: Executing transactions
  author: process:go-project
- id: db-cancel
  resource: https://go.dev/doc/database/cancel-operations
  title: Canceling in-progress operations
  author: process:go-project
- id: db-connections
  resource: https://go.dev/doc/database/manage-connections
  title: Managing connections
  author: process:go-project
- id: db-sql-injection
  resource: https://go.dev/doc/database/sql-injection
  title: Avoiding SQL injection risk
  author: process:go-project
- id: json-tutorial
  resource: https://go.dev/doc/tutorial/json
  title: 'Tutorial: Working with JSON'
  author: process:go-project
- id: jsonv2-migration
  resource: https://go.dev/doc/jsonv2-migration
  title: encoding/json/v2 Migration Guide
  author: process:go-project
- id: blog-gob
  resource: https://go.dev/blog/gobs-of-data
  title: Gobs of data
  author: process:go-project
- id: blog-reflection
  resource: https://go.dev/blog/laws-of-reflection
  title: The Laws of Reflection
  author: process:go-project
- id: blog-image
  resource: https://go.dev/blog/go-image-package
  title: The Go image package
  author: process:go-project
- id: blog-imagedraw
  resource: https://go.dev/blog/go-imagedraw-package
  title: The Go image/draw package
  author: process:go-project
- id: blog-context
  resource: https://go.dev/blog/context
  title: 'Go Concurrency Patterns: Context'
  author: process:go-project
- id: pkg-context
  resource: https://pkg.go.dev/context
  title: context package documentation
  author: process:go-project
kb-title: Go — Official Documentation Agent Reference
source-url: https://go.dev/doc/
spec-version: go1.27
research-as-of: '2026-10-19'
version-snapshot:
  go-latest-stable: go1.27.2 (2026-10-08)
  go-supported-majors:
  - '1.27'
  - '1.26'
  language-spec: go1.27 (2026-05-26)
  memory-model: '2022-06-06'
last-updated: '2026-10-19T00:00:00Z'
domain: Programming Language, Go Toolchain, Modules, Software Engineering
---

# Go — Official Documentation Agent Reference

**Purpose:** One synthesized, agent-facing reference for the whole **Go User Manual** at <https://go.dev/doc/>: getting started and tutorials, Effective Go and the FAQ, the language specification and memory model, modules and toolchains, the `go` command and diagnostics, database access, and the standard-library articles. Every claim carries a footnote whose label is a `sources[].id`, so an agent can follow it to the exact page.[^effective-go][^go-spec][^ref-mod]

**TL;DR:** Go code lives in a **module** (`go.mod` at the root, module path = import prefix) made of **packages** (one directory each).[^code][^ref-mod] `gofmt` owns layout,[^effective-go] errors are ordinary return values,[^blog-errors] concurrency is goroutines and channels ("share memory by communicating"),[^effective-go] and correctness under concurrency rests on the happens-before rules of the memory model.[^go-mem] As of this snapshot the latest release is **go1.27.2 (2026-10-08)**; the supported majors are **1.27 and 1.26**.[^release-history]

**Progressive disclosure:** This file is large. Read the [section map](#section-map), then open only the section the task needs. For normative detail, follow the footnote to the upstream page.

---

## Release snapshot

| Item | Value |
|------|-------|
| Latest stable | go1.27.2, 2026-10-08[^release-history] |
| Latest major | go1.27.0, 2026-08-19; previous major go1.26.0, 2026-02-10[^release-history] |
| Support policy | Each major release is supported until there are two newer major releases[^release-history] |
| Language spec version | go1.27 (May 26, 2026)[^go-spec] |
| Memory model version | June 6, 2022[^go-mem] |
| Release cadence | Six-month cycle; the last three months are a feature freeze[^contribute] |

Facts in this file are **dated to the research snapshot (2026-10-19)**. Re-check [Release status](#release-status-and-support-policy) and the release notes before relying on version-specific behaviour after `stale_after`.

---

## Novice Mental Model

| Everyday idea | Go equivalent |
|---------------|---------------|
| A project / library you version and publish | **Module**: a tree of packages with `go.mod` at the root[^ref-mod] |
| A namespace / compilation unit | **Package**: all `.go` files in one directory[^code] |
| The import name of a package | **Import path** = module path + subdirectory[^code] |
| An executable | `package main` with `func main`[^code] |
| Public vs private | Capitalized identifier = exported; lowercase = package-private[^effective-go] |
| Exceptions | Explicit `error` return values; `panic`/`recover` only for truly exceptional cases[^blog-errors][^blog-defer] |
| Threads | **Goroutines**, coordinated with **channels** or `sync`[^effective-go] |
| Request-scoped deadlines and cancellation | `context.Context`, passed as the first parameter `ctx`[^pkg-context] |
| Lockfile | `go.sum` (checksums), verified against the checksum database[^ref-mod] |
| Dependency resolution | **Minimal version selection (MVS)**[^ref-mod] |
| Multi-module local development | **Workspace** (`go.work`)[^tut-workspaces] |
| Private code inside a module | `internal/` directories, importable only from the parent tree[^mod-layout] |
| Formatter / linter / test runner | `gofmt`, `go vet`, `go test`, all built into the toolchain[^cmd-go] |

---

## Section map

| Section | Read it when you need to… |
|---------|---------------------------|
| [Install and first program](#install-and-first-program) · [Tutorials digest](#tutorials-digest) · [How to write Go code](#how-to-write-go-code) · [A Tour of Go](#a-tour-of-go-overview) | Set up Go, scaffold a module, or follow an official tutorial |
| [Effective Go](#effective-go) · [FAQ](#faq-design-decisions-and-gotchas) · [Editors and IDEs](#editors-and-ides) · [Codewalks](#codewalks-digest) · [Language articles](#language-articles-digest) | Write idiomatic Go: naming, errors, interfaces, concurrency, slices, defer |
| [Language specification](#language-specification) | Answer a precise question about syntax, types, assignability, method sets, generics, or evaluation order |
| [Memory model](#memory-model) | Reason about data races and synchronization |
| [Modules: concepts and reference](#modules-concepts-and-reference) · [Toolchains](#toolchains-go-and-toolchain-lines-gotoolchain) · [Managing dependencies](#managing-dependencies-workflow) | Edit `go.mod`/`go.work`, add or upgrade dependencies, configure proxies and private modules |
| [Developing and publishing modules](#developing-and-publishing-modules) · [Organizing a Go module](#organizing-a-go-module-layout) · [Major version updates](#major-version-updates-and-compatibility) · [Modules blog digest](#modules-blog-digest) | Choose a repository layout, tag releases, ship v2+ |
| [Release status](#release-status-and-support-policy) · [Recent release highlights](#recent-release-highlights) | Know which Go versions are current and what changed |
| [The go command](#the-go-command) · [Testing](#testing-benchmarks-examples-and-fuzzing) · [Coverage](#coverage) · [Doc comments](#doc-comments) | Build, test, vet, document |
| [Diagnostics](#diagnostics-profiling-tracing-debugging) · [GC tuning](#garbage-collector-tuning) · [PGO](#profile-guided-optimization) · [Race detector](#race-detector) · [GDB](#debugging-with-gdb-and-delve) | Profile, trace, debug, tune performance |
| [Assembler](#assembler-quick-guide) · [Cgo](#cgo) · [gopls](#gopls) · [Vulnerability management](#vulnerability-management) · [Contributing](#contributing-to-go) | Low-level interop, editor tooling, security, upstream contribution |
| [Database access](#database-access-databasesql) · [Context](#context) | Use `database/sql` safely: pooling, transactions, cancellation, SQL injection |
| [JSON](#json-encodingjson-and-jsonv2) · [Gob](#gob-encodinggob) · [Reflection](#reflection-laws-of-reflection) · [Image](#image-and-imagedraw) | Work with these standard-library packages |

---

## Agent rules for writing Go

These are distilled from the sections below; each points at its source.

1. **Format with `gofmt`.** If its output looks wrong, restructure the code; do not fight the formatter.[^effective-go]
2. **Return errors and check them.** Reserve `panic` for unrecoverable conditions, and keep panics inside a package: its exported API returns explicit `error` values.[^blog-errors][^blog-defer]
3. **Pass `ctx context.Context` as the first parameter.** Do not store a Context in a struct, and always call the `cancel` function returned by `WithCancel`/`WithTimeout`/`WithDeadline`.[^pkg-context][^db-cancel]
4. **Do not race.** Synchronize shared memory with channels or `sync`, and run tests with `-race`. A program with data races has no sequential-consistency guarantee.[^go-mem][^race-detector]
5. **Lay out modules by the official patterns.** One module per repository root, supporting packages under `internal/`, and commands in their own directories (often under `cmd/`).[^mod-layout]
6. **Let the tools edit `go.mod`.** Use `go get`, `go mod tidy` and `go mod edit` rather than hand-editing, and commit both `go.mod` and `go.sum`.[^ref-mod][^managing-deps]
7. **The `go` directive is a minimum version.** Since Go 1.21 it is mandatory, and it gates language features, including the per-iteration loop variables of Go 1.22.[^ref-mod][^go-spec]
8. **Ship v2+ under a new module path ending in `/vN`.** For v1 compatibility, add new functions instead of changing existing signatures.[^blog-v2-modules][^blog-module-compat]
9. **Never build SQL with `fmt.Sprintf`.** Use placeholder parameters, `defer rows.Close()` and check `rows.Err()`, and use `defer tx.Rollback()` after `BeginTx`.[^db-sql-injection][^db-querying][^db-transactions]
10. **Document every exported name.** Write it in complete sentences, immediately before the declaration, and mark deprecations with a `Deprecated:` paragraph.[^doc-comments]
11. **Scan dependencies before shipping.** Run `govulncheck ./...` from the module root.[^govulncheck-tutorial]
12. **Prefer clarity over cleverness under concurrency.** "If you must read the rest of this document to understand the behavior of your program, you are being too clever. Don't be clever."[^go-mem]

---

<!-- Part 1 — Getting started and idiomatic Go -->

## Install and first program

### Install per platform

| OS | Steps | PATH |
|---|---|---|
| Linux | `rm -rf /usr/local/go && tar -C /usr/local -xzf go<ver>.linux-amd64.tar.gz` | add `/usr/local/go/bin` (in `$HOME/.profile` or `/etc/profile`) |
| macOS | run the package installer; installs to `/usr/local/go`, adds `/etc/paths.d/go` | automatic |
| Windows | run the MSI; installs to Program Files by default | reopen command prompts |

- MUST NOT untar into an existing `/usr/local/go` tree; this "is known to produce broken Go installations". Remove the old tree first.[^install]
- Add `$(go env GOPATH)/bin` (default `$HOME/go/bin`) to `PATH` to run tools installed with `go install`.[^install]
- Verify with `go version`; restart open terminals so PATH changes apply.[^install]

### Hello, world

```sh
mkdir hello && cd hello
go mod init example/hello       # creates go.mod (module path)
go run .                        # compile and run package in current dir
go mod tidy                     # add missing requirements + go.sum
```

- A package is all files in the same directory; `package main` + `func main()` is the executable entry point.[^tut-start]
- The module path is typically the repository location; if the module will be published, the path MUST be a location from which Go tools can download it.[^tut-start]
- `go mod tidy` adds the module requirement and a `go.sum` file used to authenticate modules; it downloads the latest version by default.[^tut-start]
- Find packages on pkg.go.dev; packages are published in modules (e.g. `rsc.io/quote`).[^tut-start]

## Tutorials digest

### Create a Go module (7-part series)

| Step | Commands / code | Lesson |
|---|---|---|
| Create module | `go mod init example.com/greetings` | `go.mod` names the module and Go version; later lists dependency versions for reproducible builds.[^tut-module] |
| Exported names | `func Hello(name string) string` | Capitalised names are callable from other packages; `:=` declares and initialises with inferred type.[^tut-module] |
| Call local module | `go mod edit -replace example.com/greetings=../greetings` then `go mod tidy` | `replace` redirects a module path to a local dir; tidy adds `require ... v0.0.0-<pseudo-version>`. Published modules use `require` with a tagged version instead.[^tut-module-call] |
| Errors | `return "", errors.New("empty name")`; caller `if err != nil { log.Fatal(err) }` | "Return an error as a value so the caller can check for it." Return `nil` as the error on success.[^tut-module-errors] |
| Slices | `formats[rand.Intn(len(formats))]` | Lower-case `randomFormat` is unexported; `[]string` omits size.[^tut-module-random] |
| Maps / compat | `make(map[string]string)`; new func `Hellos` | Do not change a published function's signature; add a new function to keep backward compatibility.[^tut-module-map] |
| Test | `greetings_test.go`, `func TestHelloName(t *testing.T)`, `go test`, `go test -v` | `_test.go` suffix marks test files; `TestName` functions take `*testing.T`; report with `t.Errorf`.[^tut-module-test] |
| Build/install | `go build`; `go list -f '{{.Target}}'`; `go env -w GOBIN=...`; `go install` | `go run` does not produce a binary; `go build` compiles without installing; `go install` compiles and installs.[^tut-module-install] |

### Multi-module workspaces

```sh
go work init ./hello            # creates go.work: "go 1.18" + "use ./hello"
go work use ./example/hello     # add a local module checkout
go run ./hello                  # run from workspace root
```

- `go.work` has `go.mod`-like syntax; `use` directives make listed modules main modules for builds in any subdirectory of the workspace.[^tut-workspaces]
- `go.work` can be used instead of adding `replace` directives to work across multiple modules.[^tut-workspaces]
- Other subcommands: `go work use [-r] [dir]` (recursive with `-r`; removes the entry if dir no longer exists), `go work edit`, `go work sync` (syncs workspace build list into each module).[^tut-workspaces]
- To release, tag the dependency (e.g. `v0.1.0`) and `go get golang.org/x/example/hello@v0.1.0` so resolution works outside the workspace.[^tut-workspaces]

### RESTful API with Gin

- Setup: `go mod init example/web-service-gin`; `go get .` resolves imports for the current directory (adds `github.com/gin-gonic/gin`); `go run .`.[^tut-gin]
- Struct tags such as `` `json:"artist"` `` set serialized field names; without them JSON uses capitalised Go field names.[^tut-gin]
- Routing: `router := gin.Default(); router.GET("/albums", getAlbums); router.POST(...); router.GET("/albums/:id", ...); router.Run("localhost:8080")`. A leading colon marks a path parameter, read with `c.Param("id")`.[^tut-gin]
- Pass the handler name (`getAlbums`), not its result (`getAlbums()`).[^tut-gin]
- `gin.Context` carries request details, validates and serializes JSON; it is different from Go's `context` package. `c.BindJSON(&v)`, `c.IndentedJSON(status, v)` (`c.JSON` for compact output).[^tut-gin]
- Data is held in memory in the tutorial; a typical API would use a database.[^tut-gin]

### Generics

```go
type Number interface { int64 | float64 }        // constraint as interface
func SumNumbers[K comparable, V Number](m map[K]V) V {
    var s V
    for _, v := range m { s += v }
    return s
}
SumIntsOrFloats[string, int64](ints)  // explicit type args
SumNumbers(floats)                    // type args inferred
```

- Type parameters go in square brackets; each has a constraint that defines permissible type arguments. A type argument outside the constraint does not compile.[^tut-generics]
- A type parameter MUST support every operation the generic code performs on it.[^tut-generics]
- `comparable` is predeclared and allows `==`/`!=`; map keys MUST be comparable, so `K comparable` is required for `map[K]V`.[^tut-generics]
- `|` declares a union. Type arguments can be omitted when inferable from function arguments; not possible for a generic function with no arguments.[^tut-generics]

### Fuzzing

```go
func FuzzReverse(f *testing.F) {
    for _, tc := range []string{"Hello, world", " ", "!12345"} { f.Add(tc) } // seed corpus
    f.Fuzz(func(t *testing.T, orig string) { /* check properties */ })
}
```

| Command | Effect |
|---|---|
| `go test` | runs seed corpus only (no fuzzing)[^tut-fuzz] |
| `go test -run=FuzzReverse` | only that fuzz test[^tut-fuzz] |
| `go test -fuzz=Fuzz` | fuzz until a failure; runs forever otherwise (ctrl-C)[^tut-fuzz] |
| `go test -fuzz=Fuzz -fuzztime 30s` | bound fuzzing time[^tut-fuzz] |
| `go test -run=FuzzReverse/<hash>` | rerun one failing corpus entry[^tut-fuzz] |

- Fuzz tests are named `FuzzXxx`, take `*testing.F`; the fuzz target takes `*testing.T` plus fuzzed-type args. Unit tests, benchmarks and fuzz tests MAY share one `_test.go` file.[^tut-fuzz]
- Since outputs cannot be predicted, assert properties (e.g. double reverse == original; output stays valid UTF-8).[^tut-fuzz]
- Failing inputs are written to `testdata/fuzz/FuzzXxx/` and rerun by plain `go test` thereafter.[^tut-fuzz]
- Coverage-instrumented fuzzing is only available on AMD64 and ARM64; only a subset of built-in types is supported.[^tut-fuzz]
- Lessons from the bugs: reverse strings by rune, not byte; a Go string is a read-only byte slice that can hold invalid UTF-8, and converting to `[]rune` replaces invalid bytes with U+FFFD. Return or `t.Skip()` for inputs the function rejects.[^tut-fuzz]

### Writing Web Applications (wiki)

- `os.WriteFile(name, body, 0600)` / `os.ReadFile`; `0600` = read-write for current user only.[^wiki-webapp]
- Ignoring errors with `_` "is generally considered bad practice"; return `(*Page, error)` instead.[^wiki-webapp]
- `http.HandleFunc("/view/", h)`; `log.Fatal(http.ListenAndServe(":8080", nil))`. `ListenAndServe` always returns an error (only on unexpected failure).[^wiki-webapp]
- `html/template` escapes output automatically. Parse templates once at init: `var templates = template.Must(template.ParseFiles("edit.html", "view.html"))`; render with `ExecuteTemplate`. `template.Must` panics on error, which is appropriate when templates cannot load.[^wiki-webapp]
- Report failures with `http.Error(w, err.Error(), http.StatusInternalServerError)`; redirect with `http.Redirect(w, r, url, http.StatusFound)`.[^wiki-webapp]
- Security: validate user-supplied paths (`regexp.MustCompile("^/(edit|save|view)/([a-zA-Z0-9]+)$")`) to prevent arbitrary file read/write; `MustCompile` panics, `Compile` returns an error.[^wiki-webapp]
- Factor repeated validation into a closure: `makeHandler(fn func(http.ResponseWriter, *http.Request, string)) http.HandlerFunc`.[^wiki-webapp]

## How to write Go code

### Code organisation

| Term | Definition |
|---|---|
| Package | source files in one directory compiled together; declarations are visible across files in the package.[^code] |
| Module | collection of related packages released together; `go.mod` at its root declares the module path.[^code] |
| Repository | contains one or more modules; typically one at the root.[^code] |
| Module path | import path prefix for all packages in the module; also tells `go` where to download it.[^code] |
| Import path | module path + subdirectory (e.g. `github.com/google/go-cmp/cmp`); standard library has no module prefix.[^code] |

- A module covers its directory and subdirectories up to the next directory containing another `go.mod`.[^code]
- No need to publish before building, but organising code as if it will be published is "a good habit".[^code]
- First statement of a file MUST be `package name`; executable commands MUST use `package main`.[^code]

### go tool commands

- `go install example/user/hello` == `go install .` == `go install` (in module dir). Commands apply within the module containing the working directory; outside it `go install` may fail.[^code]
- Install dir: `GOBIN` if set; else `bin` of first `GOPATH` entry; else `$HOME/go/bin` (`%USERPROFILE%\go\bin`). Set persistently with `go env -w GOBIN=...`, unset with `go env -u GOBIN`.[^code]
- `go build` on a library package writes nothing; it saves the compiled package in the build cache.[^code]
- `go mod tidy` adds missing requirements and removes unused ones. Downloaded modules live read-only under `$GOPATH/pkg/mod`; clear with `go clean -modcache`.[^code]
- `go` locates a module's repository via an HTTPS request and HTML metadata; making the module path match the repository URL is the easiest way to make it available.[^code]

### Testing

- Test files end in `_test.go`; functions `TestXXX(t *testing.T)`; a test fails if it calls `t.Error`, `t.Fail`, etc. Run with `go test`.[^code]
- Table-driven pattern (convention):[^code]

```go
cases := []struct{ in, want string }{{"Hello, world", "dlrow ,olleH"}, {"", ""}}
for _, c := range cases {
    if got := ReverseRunes(c.in); got != c.want {
        t.Errorf("ReverseRunes(%q) == %q, want %q", c.in, got, c.want)
    }
}
```

## A Tour of Go (overview)

The Tour is an interactive, in-browser course (the page itself is a JavaScript app; contents read from its lesson index).[^tour]

| Module | Covers |
|---|---|
| Welcome | using the tour, running locally/offline, the Playground[^tour] |
| Basics | packages, imports, exported names, functions, multiple/named results, variables, `:=`, basic types, zero values, conversions, type inference, constants[^tour] |
| Flow control | `for` (incl. as "while" and forever), `if` with short statement, `switch` (evaluation order, no condition), `defer` and stacking[^tour] |
| More types | pointers, structs, arrays, slices (len/cap, nil, `make`, `append`), `range`, maps, function values, closures[^tour] |
| Methods and interfaces | methods, pointer receivers, value vs pointer receiver choice, interfaces (implicit, nil underlying values, empty), type assertions/switches, Stringer, errors, Readers, images[^tour] |
| Generics | type parameters, generic types[^tour] |
| Concurrency | goroutines, channels, buffered channels, range/close, `select`, default selection, `sync.Mutex`, web crawler exercise[^tour] |

## Effective Go

Caveat: written for Go's 2009 release and not actively updated; it does not cover generics, modules or newer libraries.[^effective-go]

### Formatting and commentary

- Let `gofmt` (`go fmt` at package level) handle layout; if its output looks wrong, rearrange the program rather than work around it.[^effective-go]
- Tabs for indentation; no line-length limit (wrap and indent with an extra tab); control structures take no parentheses.[^effective-go]
- `//` line comments are the norm; `/* */` mostly for package comments or disabling code. Comments directly before top-level declarations (no blank line) are doc comments.[^effective-go]

### Names

| Rule | Detail |
|---|---|
| Visibility | upper-case first letter = exported.[^effective-go] |
| Package names | convention: lower case, single word, no underscores or mixedCaps; name = base of source directory (`encoding/base64` → `base64`).[^effective-go] |
| Avoid stutter | `bufio.Reader` not `BufReader`; sole constructor in package `ring` is `ring.New`.[^effective-go] |
| `import .` | avoid, except tests that must run outside the package under test.[^effective-go] |
| Getters | field `owner` → getter `Owner()` (not `GetOwner`), setter `SetOwner`.[^effective-go] |
| Interfaces | one-method interfaces: method name + `-er` (`Reader`, `Writer`, `Formatter`).[^effective-go] |
| Canonical methods | `Read`, `Write`, `Close`, `Flush`, `String` have canonical signatures; do not reuse those names with other meanings; call a converter `String` not `ToString`.[^effective-go] |
| Multiword | convention: `MixedCaps`/`mixedCaps`, never underscores.[^effective-go] |

### Semicolons

- The lexer inserts a semicolon after a line's last token if it is an identifier, basic literal, or one of `break continue fallthrough return ++ -- ) }`.[^effective-go]
- Consequence: the opening brace of `if`/`for`/`switch`/`select` MUST be on the same line.[^effective-go]

### Control structures

- `if` and `switch` accept an init statement: `if err := f.Chmod(0664); err != nil { ... }`.[^effective-go]
- Omit `else` when the body ends in `break`/`continue`/`goto`/`return`; let the success path run down the page.[^effective-go]
- `:=` redeclaration: an existing `v` may appear if it is in the same scope, the value is assignable, and at least one other new variable is created (so `err` is reused). In an inner scope `:=` creates a new variable. Parameters and results share the function body's scope.[^effective-go]
- `for` has three forms (`for init; cond; post {}`, `for cond {}`, `for {}`); no `while`/`do`. `range` over array, slice, string, map, channel; use `_` to drop the index.[^effective-go]
- `range` over a string yields runes, decoding UTF-8; invalid bytes yield U+FFFD and consume one byte.[^effective-go]
- `++`/`--` are statements; use parallel assignment: `for i, j := 0, len(a)-1; i < j; i, j = i+1, j-1`.[^effective-go]
- `switch` cases need not be constants, evaluate top to bottom, no automatic fallthrough; comma-separated case lists; expressionless `switch` replaces if-else chains (idiomatic). Use labelled `break Loop` to exit an enclosing loop.[^effective-go]
- Type switch: `switch t := t.(type) { case int: ... }`; reusing the name is idiomatic.[^effective-go]

### Functions

- Multiple results replace in-band error codes and out-parameters: `func (file *File) Write(b []byte) (n int, err error)`.[^effective-go]
- Named results are zero-initialised and returned by a bare `return`; they serve as documentation.[^effective-go]
- `defer` runs a call just before the function returns; canonical uses: unlock a mutex, close a file. Keeps the close next to the open and covers all return paths.[^effective-go]
- Deferred call arguments (including the receiver) are evaluated when `defer` executes; deferred calls run LIFO. `defer` is function-scoped, not block-scoped.[^effective-go]

### Data: allocation, composite literals

| | `new(T)` | `make(T, args)` |
|---|---|---|
| Types | any | slices, maps, channels only |
| Returns | `*T` to zeroed storage | initialised (not zeroed) `T`, not a pointer |

- Since Go 1.26 `new` also accepts an expression giving the initial value, e.g. `new(int64(300))`.[^effective-go]
- Design types so the zero value is useful (`bytes.Buffer`, `sync.Mutex`); this works transitively for structs that embed them.[^effective-go]
- Returning the address of a local is safe; `&File{fd: fd, name: name}` allocates fresh each evaluation; omitted labelled fields are zero. `new(File)` == `&File{}`.[^effective-go]
- `new([]int)` gives a pointer to a nil slice ("rarely useful"); idiomatic: `v := make([]int, 100)`.[^effective-go]

### Arrays, slices, maps

- Arrays are values (assignment and passing copy all elements); size is part of the type. Prefer slices over pointers to arrays.[^effective-go]
- Slices reference an underlying array; element changes are visible to callers. The slice header is passed by value, so functions that may reallocate MUST return the new slice (as `append` does).[^effective-go]
- 2-D: allocate rows independently if they may grow; otherwise one allocation sliced into rows is more efficient.[^effective-go]
- Map keys: any type with equality (not slices). Missing key returns the zero value. Use comma-ok `v, ok := m[k]` to distinguish absence; `_, present := m[k]`; `delete(m, k)` is safe for absent keys. A set is `map[T]bool`.[^effective-go]

### Printing

- `%v` default format (any value); `%+v` adds struct field names; `%#v` full Go syntax; `%T` type; `%q` quoted; `%x` hex (also on strings/byte slices). Maps print sorted by key.[^effective-go]
- Numeric verbs take no size/sign flags; the argument type decides.[^effective-go]
- Define `String() string` to control formatting. Do not call `Sprintf` with `%s`/`%v` on the receiver inside `String` (infinite recursion); convert to the base type: `fmt.Sprintf("MyString=%s", string(m))`.[^effective-go]
- If both `T` and `*T` values must print via `String`, the receiver must be a value type.[^effective-go]
- Forward variadic args with `v...`: `fmt.Sprintln(v...)`; without `...` the slice is passed as one argument.[^effective-go]

### append

- `func append(slice []T, elements ...T) []T` is built in because (as the 2009-era doc says) a user function cannot have a caller-determined `T`. Always assign the result: `x = append(x, y...)`.[^effective-go]

### Initialization

- Constants are compile-time only: numbers, runes, strings, booleans; expressions must be constant (`1<<3` yes, `math.Sin(...)` no).[^effective-go]
- `iota` builds enumerations; implicit repetition of the last expression:[^effective-go]

```go
const (
    _           = iota // skip 0
    KB ByteSize = 1 << (10 * iota)
    MB
)
```

- Package variables may use run-time initialisers. `init()` (multiple per file allowed) runs after all package variable initialisers, which run after imported packages are initialised; use it for setup or to verify program state.[^effective-go]

### Methods: pointer vs value receivers

- Methods can be defined on any named type except pointers and interfaces.[^effective-go]
- Rule: value methods can be invoked on pointers and values; pointer methods only on pointers. If the value is addressable, `b.Write` is rewritten to `(&b).Write` automatically.[^effective-go]
- Only `*ByteSlice` satisfies `io.Writer` when `Write` has a pointer receiver; pass `&b`.[^effective-go]

### Interfaces, conversions, embedding

- Interfaces specify behaviour; one- or two-method interfaces are common. A type can implement many.[^effective-go]
- Converting between types with identical underlying types (`[]int(s)`, `sort.IntSlice(s)`) creates no new value and changes the method set; idiomatic to access different methods.[^effective-go]
- Type assertion `value.(T)` panics on mismatch; use comma-ok `str, ok := value.(string)` (on failure `str` is the zero value).[^effective-go]
- Generality: if a type exists only to implement an interface, export the interface, not the type, and have the constructor return the interface (e.g. `crc32.NewIEEE` returns `hash.Hash32`).[^effective-go]
- Function types can have methods: `type HandlerFunc func(ResponseWriter, *Request)` with `ServeHTTP` calling `f(w, req)`; adapt with `http.HandlerFunc(ArgServer)`.[^effective-go]
- Interface embedding forms unions (`ReadWriter { Reader; Writer }`); only interfaces embed in interfaces.[^effective-go]
- Struct embedding promotes methods, but the receiver of a promoted method is the inner value, not the outer struct (differs from subclassing). Refer to an embedded field by its unqualified type name (`job.Logger`).[^effective-go]
- Name conflicts: a shallower name hides a deeper one; same-depth duplicates are an error only if referenced.[^effective-go]

### Blank identifier

- Discard unneeded values in multiple assignment; discarding errors "is terrible practice. Always check error returns."[^effective-go]
- Unused imports and variables are compile errors. Temporarily silence with `var _ = fmt.Printf` / `_ = fd` placed right after imports and commented (convention), and remove later.[^effective-go]
- Side-effect import: `import _ "net/http/pprof"`.[^effective-go]
- Compile-time interface check: `var _ json.Marshaler = (*RawMessage)(nil)`; convention: only when no static conversion already exists in the code.[^effective-go]

### Concurrency

- Slogan: "Do not communicate by sharing memory; instead, share memory by communicating." A mutex around a counter can still be best for e.g. reference counts.[^effective-go]
- Goroutines: functions running concurrently in the same address space; cheap, small growable stacks, multiplexed onto OS threads. `go f()` returns immediately; the goroutine exits silently when done. Function literals are closures.[^effective-go]
- Channels: `make(chan T)` unbuffered (synchronous), `make(chan T, n)` buffered. Receivers block until data; unbuffered senders block until received; buffered senders block only when the buffer is full.[^effective-go]
- Semaphore: buffered channel `sem` limits concurrency; gate goroutine creation in the loop (`sem <- 1` before `go`) to avoid unbounded goroutines; before Go 1.22 the loop variable was shared across goroutines. Alternative: a fixed pool of N goroutines ranging over a request channel.[^effective-go]
- Channels of channels: put a reply channel in the request struct for parallel demultiplexing without mutexes.[^effective-go]
- Parallelization: split work across `runtime.NumCPU()` goroutines and drain a completion channel; honour the user's setting with `runtime.GOMAXPROCS(0)` (0 queries). Concurrency ≠ parallelism; Go is a concurrent language.[^effective-go]
- Leaky buffer: free list as buffered channel; `select` with `default` makes get/put non-blocking; overflow buffers go to the GC.[^effective-go]

### Errors, panic, recover

- Return errors as an extra result of type `error` (`interface { Error() string }`); richer types such as `*os.PathError{Op, Path, Err}` carry context.[^effective-go]
- Error strings SHOULD identify their origin when feasible, e.g. prefix with package/operation (`"image: unknown format"`).[^effective-go]
- Inspect details with type switch/assertion: `if e, ok := err.(*os.PathError); ok && e.Err == syscall.ENOSPC { ... }`.[^effective-go]
- `panic` for unrecoverable states; real library functions SHOULD avoid panic. Panicking in `init` when a library truly cannot set itself up may be reasonable.[^effective-go]
- `recover` stops unwinding and returns the panic value; it is only useful inside deferred functions and returns nil unless called directly by one. Use it to keep one failing goroutine from killing a server.[^effective-go]
- Internal panic-to-error pattern: deferred `recover` sets named results (`err = e.(Error)` re-panics on unexpected values). Use only within a package; never expose panics to clients.[^effective-go]

### A web server

- `flag.String`, `template.Must(template.New("qr").Parse(...))`, `http.Handle("/", http.HandlerFunc(QR))`, `http.ListenAndServe(*addr, nil)` (blocks). `html/template` escapes data automatically; `{{if .}}...{{end}}` renders only for non-empty dot.[^effective-go]

## FAQ: design decisions and gotchas

### Design decisions

| Feature | Decision and reason |
|---|---|
| Exceptions | None. try-catch-finally makes code convoluted and labels ordinary errors exceptional; use multi-value returns plus `panic`/`recover` for truly exceptional conditions.[^faq] |
| Assertions | None; programmers use them to avoid proper error handling and reporting. Same applies to test helpers: report and keep running.[^faq] |
| Type hierarchy / inheritance | None. Types satisfy interfaces implicitly by implementing a subset of methods; no `implements`.[^faq] |
| Dynamic dispatch | Only through interfaces; methods on concrete types resolve statically.[^faq] |
| Overloading | No method or operator overloading; match by name only.[^faq] |
| Generics | Added in Go 1.18. Constraints are mandatory; square brackets keep parsing free of type information.[^faq] |
| Generic methods | Not supported and not anticipated; use top-level generic functions or parameterise the receiver type.[^faq] |
| Variant/union types | No variant types (overlap with interfaces); no untagged unions (memory safety).[^faq] |
| Covariant results | None; method types must match exactly.[^faq] |
| Numeric conversion | No implicit conversions; `int` and `int64` are distinct. Untyped constants are arbitrary-precision "ideal" numbers.[^faq] |
| `?:` | No ternary; use if-else.[^faq] |
| Pointer arithmetic | None, for safety and simpler GC.[^faq] |
| `++`/`--` | Statements, postfix only.[^faq] |
| Warnings | Compiler reports only errors; unused variables/imports are errors. `goimports` (also in gopls) fixes imports.[^faq] |
| Goroutine IDs | None; goroutines are anonymous so the full language stays usable.[^faq] |
| GC | Mark-and-sweep, concurrent with the program; pause times often sub-millisecond.[^faq] |
| Runtime | A library (GC, scheduling, stacks), not a VM; programs compile ahead of time to native code.[^faq] |
| Binaries | Statically linked by default; `-ldflags=-w` drops DWARF to shrink size.[^faq] |

### Gotchas

- **Nil interface vs nil pointer:** an interface is nil only if both type and value are unset. Returning a nil `*MyError` as `error` yields a non-nil error. MUST `return nil` explicitly; SHOULD declare `error` (not a concrete type) as the return type.[^faq]

```go
func returnsError() error {
    var p *MyError = nil
    if bad() { p = ErrBad }
    return p // always non-nil
}
```

- **Method sets:** `*T`'s method set includes `T`'s, not the reverse. A `T` in an interface cannot be used for pointer methods (`io.Copy(buf, ...)` with a `bytes.Buffer` value is disallowed).[^faq]
- **Receiver choice:** pointer if the method modifies the receiver (incl. changing a slice's length); pointer for large structs; be consistent across the type's methods; value for basic types, slices, small structs.[^faq]
- **Pass by value:** everything is copied; map/slice values are descriptors so data is shared; copying an interface copies its stored value.[^faq]
- **Pointer to interface:** almost never correct; `fmt.Fprintf(&w, ...)` fails to compile.[^faq]
- **Maps are not thread-safe:** concurrent reads are safe; any write during concurrent access is unsafe and can crash the program. Some implementations detect it at run time. `sync.Map` suits patterns like static caches but is not a general replacement.[^faq]
- **Loop variables before Go 1.22:** closures launched in a loop shared one variable; Go 1.22 creates a new variable per iteration. `go vet` helps detect such issues.[^faq]
- **Slice conversions:** `[]T` → `[]interface{}` requires an element-wise copy; `[]T1` → `[]T2` is not allowed even with the same underlying type.[^faq]
- **Interface satisfaction is exact:** `func (t T) Equal(u T) bool` does not satisfy `Equal(Equaler) bool`; `Open() *os.File` does not satisfy `Open() Reader`.[^faq]
- **Compile-time check:** `var _ I = T{}` or `var _ I = (*T)(nil)`.[^faq]
- **Zero-size types:** pointers to distinct zero-size variables may or may not compare equal; a trailing zero-size field pads the struct.[^faq]
- **Generic receiver names:** `func (s S[string]) ...` declares a type parameter named `string`, shadowing the predeclared type.[^faq]
- **Type inference** is intentionally limited; you can always pass explicit type arguments.[^faq]
- **Sizes:** `int`/`uint` are implementation-specific (64-bit on 64-bit machines); use sized types when it matters. Untyped float constants default to `float64`.[^faq]
- **Heap vs stack** does not affect correctness; escape analysis decides.[^faq]
- **GOMAXPROCS** defaults to the number of cores; more CPUs can slow communication-heavy programs.[^faq]

### Modules, style, testing

- `go mod init example/project`; `go get golang.org/x/text@v0.3.5` to add/upgrade/downgrade. Modules have been production-ready since Go 1.14.[^faq]
- Import compatibility rule: same import path ⇒ new package MUST be backward compatible. Breaking changes need a new major version with a `/v2` path suffix. Add new names rather than changing old ones.[^faq]
- `go get` uses HTTPS; configure `.netrc` or a git `insteadOf` rule for SSH; set `GOPRIVATE` for private modules.[^faq]
- No style guide; `gofmt` enforces layout; see Effective Go and Go Code Review Comments.[^faq]
- Tests: `_test.go` files, `func TestFoo(t *testing.T)`, `go test`. Prefer table-driven tests with good failure messages over assertion libraries.[^faq]
- Docs: `go doc` on the command line; pkg.go.dev online.[^faq]
- Most new code belongs outside the standard library.[^faq]

## Editors and IDEs

| Tool | Support |
|---|---|
| Visual Studio Code | Go extension[^editors] |
| GoLand | standalone IDE or plugin for IntelliJ IDEA Ultimate[^editors] |
| vim | vim-go plugin[^editors] |

- The Go team supports `gopls`, an LSP language server that any LSP-capable editor can use.[^faq]
- A fuller community list is on the Go Wiki.[^editors]

## Codewalks digest

### First-class functions (Pig dice game)

- User-defined function types (`action`, `strategy`); multiple returns; higher-order functions (a strategy returns an action); function literals are closures that inherit enclosing scope (`stayAtK` encloses `k`); variadic args arrive as a slice.[^cw-functions]

### Markov chain text generator

- `map[string][]string` with prefix joined into a string, because map keys need equality and slices have none.[^cw-markov]
- Unexported fields plus a `NewChain` constructor document that only methods access state ("good practice").[^cw-markov]
- Named type `Prefix []string` allows methods on non-struct types.[^cw-markov]
- Wrap readers with `bufio.NewReader` for many small reads; `fmt.Fscan` reads space-separated words and returns an error at EOF.[^cw-markov]
- `append` to a nil slice from a missing map key allocates; `len(nil)` is 0. Shift with `copy(p, p[1:])`.[^cw-markov]
- Flags via `flag.Int` return pointers; `flag.Parse` prints usage on bad flags.[^cw-markov]

### Share memory by communicating (URL poller)

- Convention: sending a pointer on a channel transfers ownership; no two goroutines touch the `Resource` at once, so no locks.[^cw-sharemem]
- Initial sends run in a separate goroutine: unbuffered sends block, and sending from `main` with fewer pollers than items would deadlock.[^cw-sharemem]
- Idiom: a function run as a goroutine takes a channel to report completion.[^cw-sharemem]
- `StateMonitor` goroutine owns its map and `select`s over `ticker.C` and the updates channel, so the map is accessed sequentially.[^cw-sharemem]

## Language articles digest

### JSON-RPC: a tale of interfaces

- Introducing a small `ServerCodec` interface in place of the concrete `*gob.Encoder` let a JSON codec be added in about 20 minutes, without the subclass hierarchy an inheritance language would need. Composition-oriented types scale for maintainability.[^blog-jsonrpc]

### Declaration syntax

- Go declarations read left to right, name first: `x int`, `p *int`, `a [3]int`, `f func(func(int,int) int, int) func(int, int) int`.[^blog-decl]
- Type syntax is separate from expression syntax, except pointers: `*` is prefix in both, so a conversion to a pointer type needs parentheses: `(*int)(nil)`.[^blog-decl]

### Defer, panic, recover

1. Deferred call arguments are evaluated when the `defer` statement runs (`defer fmt.Println(i)` prints the earlier value).[^blog-defer]
2. Deferred calls run LIFO after the surrounding function returns.[^blog-defer]
3. Deferred functions may read and assign named results (`defer func() { i++ }(); return 1` returns 2).[^blog-defer]

- Put `defer f.Close()` right after a successful open so every return path closes it; also `mu.Lock(); defer mu.Unlock()`.[^blog-defer]
- `panic` stops the function, runs its defers, and propagates up the goroutine; unrecovered, the program crashes. Runtime errors (out-of-bounds) also panic.[^blog-defer]
- `recover` is only useful inside deferred functions; it returns nil during normal execution.[^blog-defer]
- Convention: even when a package uses panic internally, its external API presents explicit error return values (e.g. `encoding/json`).[^blog-defer]

### Timing out, moving on

```go
select {
case v := <-ch:       // got it
case <-time.After(1 * time.Second): // timed out
}
```

- Timeout channel pattern: a goroutine sleeps then sends on `make(chan bool, 1)`; the buffer of 1 lets it send and exit even if no one receives. In real programs use `time.After`.[^blog-timeout]
- First-response-wins: each goroutine does a non-blocking send (`select` + `default`); the result channel MUST be buffered so the first send always succeeds, otherwise there is a race where no receiver is ready yet.[^blog-timeout]

### Slices: usage and internals

- Arrays are fixed-size values; `[4]int` and `[5]int` are distinct types; `[...]T{...}` lets the compiler count.[^blog-slices]
- A slice is a descriptor: pointer to array, length, capacity. `make([]T, len, cap)`; cap defaults to len. Nil slice has len and cap 0.[^blog-slices]
- Slicing does not copy; writes through a re-slice modify the original. Re-slicing past capacity panics.[^blog-slices]
- `copy(dst, src)` copies min(len) elements and handles overlap; `append(s, x...)` grows when needed; appending to a nil slice works.[^blog-slices]
- Gotcha: a small sub-slice keeps the entire underlying array alive (e.g. regexp match into a whole file). Copy the needed bytes into a new slice before returning.[^blog-slices]

```go
c := make([]byte, len(b)); copy(c, b); return c
```

### GIF decoder: interfaces

- Wrap an `io.Reader` in a type whose `Read` method deblocks GIF data, then chain it into `lzw.NewReader`: a type-safe Unix pipeline built from implicit `io.Reader` implementations.[^blog-gif]
- Coupling a slice to a fixed backing array (`b.slice = b.tmp[0:n]`) avoids allocation; `copy` bounds the transfer; `Read` may return fewer bytes than requested (unlike `io.ReadFull`).[^blog-gif]
- Note: the article predates Go 1 and shows `os.Error`/`os.EOF`, now `error`/`io.EOF`.[^blog-gif]

### Error handling and Go

- `error` is a predeclared interface; `errors.New` returns `*errorString`; `fmt.Errorf` adds formatted context.[^blog-errors]
- It is the error implementation's responsibility to summarise context (`"open /etc/passwd: permission denied"`).[^blog-errors]
- Custom error types (`type NegativeSqrtError float64`, `*json.SyntaxError{Offset}`) let callers type-assert for details; `net.Error` adds `Timeout()`/`Temporary()` for retry decisions.[^blog-errors]
- appHandler pattern removes repetitive error handling in HTTP handlers:[^blog-errors]

```go
type appHandler func(http.ResponseWriter, *http.Request) *appError
func (fn appHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
    if e := fn(w, r); e != nil { // log e.Error for developers, show e.Message to user
        http.Error(w, e.Message, e.Code)
    }
}
http.Handle("/view", appHandler(viewRecord))
```

- Returning a concrete error type rather than `error` is usually a mistake (see the FAQ nil-interface gotcha); it is acceptable here only because `ServeHTTP` is the sole consumer.[^blog-errors]
- Suggested extensions: HTML error template, stack traces for admins, recover from panics inside the handler and show a generic message.[^blog-errors]

---

<!-- Part 2 — Language reference -->

## Language specification

Version read: "Language version go1.27 (May 26, 2026)". A marker `[Go 1.xx]` in the spec means the feature was added or changed in that language version and requires at least that version to build.[^go-spec]

### Source and lexical elements

- Source is UTF-8 Unicode text, not canonicalized; upper and lower case letters are distinct characters. `_` counts as a lowercase letter. A compiler MAY disallow NUL and MAY ignore a leading BOM (Spec: "Source code representation").[^go-spec]
- Comments: `//` runs to end of line; `/* */` stops at the first `*/`. A general comment with no newline acts like a space, and any other comment acts like a newline (Spec: "Comments").[^go-spec]
- Tokenizing is longest-match. Whitespace is space, tab, CR and LF (Spec: "Tokens").[^go-spec]
- Identifier: a letter followed by letters or digits. An identifier is **exported** if its first character is Unicode uppercase (Lu) **and** it is declared in the package block or is a field or method name (Spec: "Exported identifiers").[^go-spec]

**Semicolon insertion** (Spec: "Semicolons"): a `;` is inserted after a line's final token if that token is:[^go-spec]

- an identifier
- an integer, floating-point, imaginary, rune or string literal
- `break`, `continue`, `fallthrough` or `return`
- `++`, `--`, `)`, `]` or `}`

A `;` MAY also be omitted before a closing `)` or `}`.

**Keywords (25, reserved)** (Spec: "Keywords"):[^go-spec]
`break case chan const continue default defer else fallthrough for func go goto if import interface map package range return select struct switch type var`

**Operators and punctuation** (Spec: "Operators and punctuation"; `~` added in [Go 1.18]):[^go-spec]

```
+  &  +=  &=  &&  ==  !=  (  )    -  |  -=  |=  ||  <  <=  [  ]
*  ^  *=  ^=  <-  >   >=  {  }    /  << /=  <<= ++  =  :=  ,  ;
%  >> %=  >>= --  !   ... .  :    &^ &^= ~
```

**Predeclared identifiers** (universe block) (Spec: "Predeclared identifiers"):[^go-spec]

| Kind | Names |
|---|---|
| Types | `any bool byte comparable complex64 complex128 error float32 float64 int int8 int16 int32 int64 rune string uint uint8 uint16 uint32 uint64 uintptr` |
| Constants | `true false iota` |
| Zero value | `nil` |
| Functions | `append cap clear close complex copy delete imag len make max min new panic print println real recover` |

### Literals

| Literal | Rules |
|---|---|
| Integer | Prefixes `0b/0B`, `0`/`0o/0O`, `0x/0X` [Go 1.13]. A `_` MAY appear after a prefix or between digits, one at a time (`4__2` and `42_` are invalid). |
| Float | Decimal (`e` exponent) or hex (`0x` mantissa, `p` exponent required) [Go 1.13]. `0x15e-2` is an integer subtraction. |
| Imaginary | Literal followed by `i`. A decimal-only integer part is read as decimal even with a leading 0 (`0123i == 123i`). |
| Rune | One code point in `'…'`. Escapes: `\x` + 2 hex, `\u` + 4 hex, `\U` + 8 hex, `\` + 3 octal (≤255). Surrogate halves and values above 0x10FFFF are illegal. `\'` is valid only in rune literals. |
| Interpreted string | `"…"`. `\"` is legal and `\'` is illegal. `\nnn` and `\xnn` produce single **bytes**, while other escapes produce UTF-8 sequences. |
| Raw string | `` `…` ``. Any character except a back quote. No escapes, newlines allowed, **CR characters are discarded**. |

Single-character escapes: `\a \b \f \n \r \t \v \\ \' \"` (Spec: "Rune literals", "String literals").[^go-spec]

### Constants

- Kinds: boolean, rune, integer, floating-point, complex and string. The last four numeric kinds are **exact, arbitrary precision, and never overflow**. There are no constants for −0, Inf or NaN (Spec: "Constants").[^go-spec]
- Literals, `true`, `false`, `iota` and expressions built only from untyped operands are **untyped**. A constant gets a type explicitly through a declaration or conversion, or implicitly when used in a var declaration, an assignment or as an operand. It is an error if the value is not representable in that type. Converting a constant to a type parameter gives a **non-constant** value.[^go-spec]
- **Default types:** bool, rune, int, float64, complex128 and string, matching the six constant kinds.[^go-spec]
- An implementation MUST represent integer constants with at least 256 bits and float mantissas with at least 256 bits (exponent at least 16 bits). It MUST report an error on integer imprecision or float overflow, and MUST round on float precision limits (Spec: "Constants").[^go-spec]
- **iota:** inside a `const` declaration, iota is the index of the ConstSpec, starting at 0. Every use within one ConstSpec has the same value. Omitting the expression list repeats the previous list and its type (Spec: "Iota", "Constant declarations").[^go-spec]

```go
const ( a = 1 << iota; b; _; d )              // 1, 2, 8
const ( bit0, mask0 = 1 << iota, 1<<iota - 1; bit1, mask1 )
const x = iota  // 0; each const decl restarts iota
```

**Representability** (Spec: "Representability"): a constant `x` is representable by type T if it is in T's value set. A float rounds to T's precision without overflow, using round-to-even with −0 simplified to 0. A complex value is representable if both parts are representable by the component type. For a type parameter T, `x` MUST be representable by every type in T's type set. Examples: `42.0`→`byte` OK, `1e10`→`uint64` OK, `-1e-1000`→`float64` gives 0.0, `1.1`→`int` fails, `1e1000`→`float64` fails (overflows to +Inf).[^go-spec]

**Constant expressions** (Spec: "Constant expressions"):[^go-spec]

- They are evaluated exactly at compile time. Comparisons give an untyped bool. A shift with an untyped left operand gives an integer constant.
- When operands are mixed untyped kinds, the result is the later kind in the order integer < rune < floating-point < complex. Examples: `15/4 == 3`, `15/4.0 == 3.75`, `const Θ float64 = 3/2` gives 1.0.
- Division by a constant zero is illegal. Typed constants MUST remain representable, so `uint(-1)`, `int(3.14)` and `Four*100` (on an `int8`) are illegal.
- The `^` mask is all 1s for unsigned constants and −1 for signed and untyped constants, so `^1 == -2` and `uint8(^1)` is illegal.

### Variables and zero values

- A variable is a storage location. Its **static type** comes from its declaration, a `new` call or a composite literal. An interface variable also has a **dynamic type**: the non-interface type of the value it holds at run time, or none if the value is `nil` (Spec: "Variables").[^go-spec]
- Before a variable is assigned, its value is the zero value (Spec: "Variables").[^go-spec]
- **Zero values:** `false` for booleans, `0` for numeric types, `""` for strings, and `nil` for pointers, functions, interfaces, slices, channels and maps. Zeroing is recursive through struct fields and array elements (Spec: "The zero value").[^go-spec]
- Values of predeclared types (except `any` and `error`), arrays and structs are self-contained copies. Non-nil pointer, function, slice, map and channel values hold **references to shared data**. An interface value may be either, depending on its dynamic type (Spec: "Representation of values").[^go-spec]

### Types

**Named types** are the predeclared types (except `any`), defined types and type parameters. An alias denotes a named type if the type it names is a named type (Spec: "Types").[^go-spec]

| Type | Key rules |
|---|---|
| `bool` | Predeclared named type holding `true` and `false`. |
| Integers | `int8/16/32/64`, `uint8/16/32/64` (two's complement). `uint` is 32 or 64 bits, `int` is the same size as `uint`, and `uintptr` can hold a pointer's bits. `byte` = alias of `uint8`, `rune` = alias of `int32`. All other numeric types are distinct, so mixing them requires an explicit conversion (`int32` ≠ `int`). |
| Floats, complex | `float32` and `float64` are IEEE 754. `complex64` uses float32 parts and `complex128` uses float64 parts. |
| `string` | An immutable sequence of bytes. `len(s)` is constant if `s` is constant. `&s[i]` is **invalid**. |
| `[N]T` array | The length is part of the type: a non-negative constant representable as `int`. An array MUST NOT contain itself through array or struct components alone. |
| `[]T` slice | A descriptor (length, capacity, reference) over an underlying array. Uninitialized value is `nil`. `make([]int,50,100)` ≡ `new([100]int)[0:50]`. |
| `struct` | Non-blank field names MUST be unique. Supports embedded fields and tags (see below). |
| `*T` pointer | Uninitialized value is `nil`. |
| `func(...)` | Parameter names are all present or all absent. The final parameter MAY be `...T` (variadic). Uninitialized value is `nil`. |
| `interface` | Defines a type set (see below). |
| `map[K]V` | `==` and `!=` MUST be fully defined for K, so K MUST NOT be a func, map or slice. An interface key with a non-comparable dynamic value causes a **run-time panic**. A nil map behaves like an empty map, but adding to it panics. |
| `chan T`, `chan<- T`, `<-chan T` | `<-` binds to the leftmost `chan` (`chan<- chan int` = `chan<- (chan int)`). Capacity 0 means unbuffered. A nil channel is never ready. Channels are FIFO and safe for any number of goroutines. |

Sources: (Spec: "Numeric types", "String types", "Array types", "Slice types", "Map types", "Channel types").[^go-spec]

**Struct details** (Spec: "Struct types"):[^go-spec]

- An embedded field is written `T` or `*T`, where T is a type name. T MUST NOT be a pointer type or a type parameter. The unqualified type name is the field name.
- A field or method `f` of an embedded field is **promoted** if `x.f` is a legal selector. Method-set rules for promoted methods:
  - If S embeds `T`, both S and `*S` get T's value-receiver methods, and `*S` also gets T's `*T`-receiver methods.
  - If S embeds `*T`, both S and `*S` get both T's and `*T`'s methods.
- **Tags:** an optional string literal after a field. A tag is visible through reflection and **takes part in type identity**. An empty tag equals no tag.

**Interfaces** (Spec: "Interface types"):[^go-spec]

- A **basic interface** is a list of methods only. A type implements it if it has all the methods. `any` is an alias for `interface{}` [Go 1.18] and is not a named type.
- **Embedding:** an interface `E` inside `T` [Go 1.14]. T's type set is the intersection. Methods with the same name MUST have identical signatures.
- **General interfaces** [Go 1.18] add type terms `T`, `~T` (all types whose underlying type is T) and unions `t1|t2`.
  - In `~T`, the underlying type of T MUST be T itself, and T MUST NOT be an interface.
  - A term MUST NOT be a type parameter.
  - Non-interface terms in a union MUST be pairwise disjoint.
  - A union with more than one term MUST NOT contain `comparable` or interfaces that have methods.
- **Type sets:**
  - `interface{}` = all non-interface types.
  - A method's set = all types whose method set includes it.
  - A non-empty interface's set = the intersection of its elements' sets.
  - A type set never contains an interface type.
- Non-basic interfaces MAY be used **only as constraints**, or inside other interfaces used as constraints. They cannot be the type of a value, variable or field. An interface MUST NOT embed itself directly or indirectly.
- **Implements:** a non-interface T implements I if T is in I's type set. An interface T implements I if T's type set ⊆ I's type set (Spec: "Implementing an interface").

### Underlying types, identity, assignability

- **Underlying type** (Spec: "Underlying types"):[^go-spec]
  - For predeclared boolean, numeric and string types and for type literals, it is the type itself.
  - Otherwise it is the underlying type of the type named in the declaration.
  - For a type parameter, it is the underlying type of its constraint, which is always an interface.
- **Core types:** the go1.27 spec has no "Core types" section. Rules for type-parameter operands are written out per operation, typically "all types in the type set MUST have the same underlying type".[^go-spec]
- **Identity** (Spec: "Type identity"): a named type is always different from every other type. Otherwise, types are identical if they are structurally the same:[^go-spec]
  - **Structs:** same field names, types and tags in order, with the same embedded status. Non-exported names from different packages always differ.
  - **Functions:** same parameter and result types and same variadic status. Parameter names do not matter.
  - **Interfaces:** same type set.
  - **Channels:** same element type and direction.
  - **Instantiated types:** same defined type and same type arguments.
- **Assignability** (Spec: "Assignability"): x of type V is assignable to T if any of the following holds.[^go-spec]
  1. V and T are identical.
  2. V and T have identical underlying types, neither is a type parameter, and at least one is not named.
  3. Both are channel types with identical element types, V is bidirectional, and at least one is not named.
  4. T is an interface (not a type parameter) and x implements T.
  5. x is a (possibly partially instantiated) generic function, T is a function type, and the missing type arguments can be inferred [Go 1.27].
  6. x is `nil` and T is a pointer, function, slice, map, channel or interface type (not a type parameter).
  7. x is an untyped constant representable by T.

  Extra rules apply when type parameters are involved: x MUST be assignable to every type in the type set.

### Method sets

| Type | Method set (Spec: "Method sets") |
|---|---|
| Defined type `T` | Methods with receiver `T` |
| `*T` (T is not a pointer or interface) | Methods with receiver `*T` **or** `T` |
| Interface | Intersection of the method sets of the types in its type set (usually the declared methods) |
| Any other type | Empty, plus the struct-embedding rules above |

Each method name in a method set MUST be unique and non-blank.[^go-spec]

### Blocks and scope

- **Implicit blocks:**
  - the universe block
  - the package block
  - the file block
  - each `if`, `for` and `switch` statement
  - each `switch` or `select` clause

  (Spec: "Blocks").[^go-spec]
- **Declarations:** no identifier may be declared twice in the same block, or in both the file block and the package block. `_` does not bind. At package level, `init` may only declare init functions and does not bind (Spec: "Declarations and scope").[^go-spec]
- **Scope rules:**
  - Top-level const, type, var and func (but not methods): the package block.
  - Imported package names: the **file block**.
  - Parameters, results and receivers: the function body.
  - Function-local const and var: from the end of their ConstSpec, VarSpec or ShortVarDecl to the end of the innermost block.
  - Local types: from the identifier itself, which allows recursive types.

  An inner block MAY redeclare (shadow) an identifier. The package clause is not a declaration.[^go-spec]
- **Labels** are scoped to the function body, excluding nested function literals. They are not block-scoped, and an unused label is illegal (Spec: "Label scopes").[^go-spec]

### Declarations

**Type alias vs. type definition** (Spec: "Type declarations"):[^go-spec]

```go
type nodeList = []*Node            // alias [Go 1.9]: identical types
type set[P comparable] = map[P]bool // generic alias [Go 1.24]
type Point struct{ x, y float64 }  // definition: new, distinct defined type
```

- A defined type **does not inherit methods** of the type it is defined from. The method sets of an interface, or of the elements of a composite type, are unchanged (`type NewMutex Mutex` has an empty method set, while a struct that embeds `Mutex` keeps Lock and Unlock).
- In an alias or a type definition, the given type MUST NOT be a type parameter declared in the same declaration. A generic type or alias MUST be instantiated when used.

**Type parameters and constraints** (Spec: "Type parameter declarations", "Type constraints") [Go 1.18]:[^go-spec]

- Syntax: `[P any]`, `[S ~[]E, E any]`, `[_ any]`. Non-blank names MUST be unique.
- `[T ~int]` is shorthand for `[T interface{~int}]`, but `type C ~int` is illegal.
- Parse ambiguity: `type T[P *C] …` is parsed as an array type. Write `[P interface{*C}]` or `[P *C,]` instead.
- `comparable` = all non-interface types that are **strictly comparable**. Ordinary interfaces are comparable but not strictly comparable, so they *satisfy* `comparable` without *implementing* it [Go 1.20]. Because of this, comparing type-parameter operands MAY panic at run time.
- `comparable`, and interfaces that embed it, MAY only be used as constraints.
- **Satisfying a constraint:** T satisfies C if T implements C, or if C has the form `interface{ comparable; E }` with E basic and T comparable and implementing E (Spec: "Satisfying a type constraint").

**var and short var declarations** (Spec: "Variable declarations", "Short variable declarations"):[^go-spec]

- Without an initializer, each variable gets its zero value. Without a type, untyped constants take their default type. `var n = nil` is illegal.
- A compiler MAY reject unused variables inside function bodies.
- `:=` is allowed **only inside functions**. It MAY **redeclare** variables declared earlier in the same block (or in the parameter lists, for a function body) if their types are the same and at least one non-blank variable on the left is new. Redeclaration only assigns, and names on the left MUST be unique.

```go
field1, offset := nextField(str, 0)
field2, offset := nextField(str, offset) // redeclares offset
```

**Functions and methods** (Spec: "Function declarations", "Method declarations"):[^go-spec]

- If a function has result parameters, its body MUST end in a terminating statement. A function without type parameters MAY omit its body (implemented externally).
- A receiver is a single non-variadic parameter of type `T` or `*T`, where T is a defined type in the **same package**. T MUST NOT be a pointer or interface type. Method and field names on a struct base type MUST be distinct.
- A generic receiver declares type parameters by name: `func (p Pair[A, B]) Swap()`. A receiver alias MUST NOT be generic or name an instantiated type.
- **Generic methods** [Go 1.27]: `func (l List[E]) Apply[F any](f func(E) F) List[F]`. They MUST be instantiated before use.

### Expressions

**Composite literals** (Spec: "Composite literals"):[^go-spec]

- Composite literals exist for struct, array, slice and map types. Each evaluation creates a **new value**. Elements MUST be assignable to their types, with no conversion. Duplicate field or constant keys are errors, and `{}` gives the zero value.
- **Struct literals:** either no keys and every field in order, or every element keyed. A key MAY be any valid field selector, including a promoted field [Go 1.27]. A key MUST NOT go through embedded pointer fields or overlap another key.
- **Arrays and slices:** a key is an index constant. An unkeyed element takes the previous index + 1. `[...]T{}` gets length = maximum index + 1.
- **Maps:** every element MUST have a key.
- The element type MAY be omitted in nested literals, and `&T` MAY be omitted for `*T` elements.
- `&T{}` gives a pointer to a unique new variable. `&[]int{}` ≠ `new([]int)`: the first is empty and non-nil, the second points to a nil slice.
- Inside the header of `if`, `for` or `switch`, a `T{…}` literal MUST be parenthesized.

**Function literals** are closures that share the surrounding function's variables. They cannot declare type parameters (Spec: "Function literals").[^go-spec]

**Selectors** (Spec: "Selectors"):[^go-spec]

- `x.f` picks the `f` at the **shallowest depth**. It is illegal if there is not exactly one `f` at that depth.
- An automatic `(*x).f` applies to fields, including through a defined pointer type, but not to methods.
- `x.f` panics if x is a nil pointer and f is a field, or if x is a nil interface and f is called.

**Method expressions and method values** (Spec: "Method expressions", "Method values"):[^go-spec]

- `T.Mv` is a function of type `func(tv T, a int) int`.
- `(*T).Mv` is legal. `T.Mp`, where `Mp` has a pointer receiver, is **illegal**.
- A method value `x.M` **evaluates and saves x immediately**, and later calls use that copy.
- `pt.Mv` ≡ `(*pt).Mv` and `t.Mp` ≡ `(&t).Mp` when t is addressable. `makeT().Mp` is invalid.

**Index expressions** (Spec: "Index expressions"):[^go-spec]

- The index MUST be an integer or an untyped constant. A constant index MUST be ≥0, fit in `int`, and is given type `int` if untyped. It is in range when `0 <= x < len(a)`, and an out-of-range index panics at run time.
- Strings: `s[i]` is a non-constant `byte` and is **not assignable**.
- Maps: a missing key, or a nil map, yields the zero value. `v, ok := m[k]` returns an untyped bool. **Assigning into a nil map panics.**

**Slice expressions** (Spec: "Slice expressions"):[^go-spec]

- `a[low:high]` has length high−low. Missing low defaults to 0 and missing high to `len(a)`.
- Bounds are `0 <= low <= high <= len` for arrays and strings, and `<= cap` for slices.
- Slicing an array requires the array to be **addressable**. The result shares the underlying array. Slicing a nil slice gives nil.
- **Full form** `a[low:high:max]` (not for strings): cap = max−low, with `0<=low<=high<=max<=cap(a)`. Only `low` MAY be omitted.

**Type assertions** `x.(T)` (Spec: "Type assertions"):[^go-spec]

- x MUST be an interface and not a type parameter.
- For a non-interface T, the dynamic type MUST be identical to T, and T MUST implement x's type, otherwise it is a compile error.
- On failure the assertion panics. The form `v, ok := x.(T)` never panics and gives the zero value with false.

**Calls** (Spec: "Calls", "Passing arguments to ... parameters"):[^go-spec]

- Arguments are evaluated before the call and assigned to new parameter variables. Calling a nil function value panics.
- `f(g())` is allowed when g's results match f's parameters.
- `x.m()` is shorthand for `(&x).m()` when x is addressable and `&x`'s method set contains m.
- Variadic `...T` arrives as a `[]T`. With no arguments it is `nil`. With arguments, a new slice is created. `s...` passes s **unchanged** and shares its array.

**Instantiation and inference** (Spec: "Instantiations", "Type inference") [Go 1.18][Go 1.27]:[^go-spec]

- Instantiation substitutes the type arguments, then each argument MUST satisfy its constraint.
- Type arguments MAY be omitted if they can be inferred for calls, assignments to typed variables, arguments and returns.
- A partial argument list is a non-empty prefix (`apply[]` is illegal, `apply[[]int]` is OK). A **generic type always needs explicit type arguments.**
- Inference solves type equations (≡A for assignability, ≡C for constraints) by **unification**. Typed operands are considered before untyped constants. Untyped constants alone give the default type of their kind, and conflicting kinds make inference fail.

**Operators and precedence** (Spec: "Operator precedence"):[^go-spec]

| Prec | Operators |
|---|---|
| 5 | `*  /  %  <<  >>  &  &^` |
| 4 | `+  -  \|  ^` |
| 3 | `==  !=  <  <=  >  >=` |
| 2 | `&&` |
| 1 | `\|\|` |

- Unary operators bind tightest. Binary operators associate left to right. `++` and `--` are statements, so `*p++` is `(*p)++`.
- Operand types MUST be identical except in shifts or with untyped constants. A non-shift untyped constant is converted to the other operand's type (Spec: "Operators").[^go-spec]
- **Shifts:** the right operand MUST be an integer type [Go 1.13] or an untyped constant representable as `uint`. A negative count panics at run time, and there is no upper limit. In a non-constant shift, an untyped left operand takes the type it would have alone. Example: `var u = 1.0<<s` is illegal because 1.0 is float64. Signed values shift arithmetically and unsigned values shift logically (Spec: "Operators", "Integer operators").[^go-spec]
- **Division:** truncates toward zero (`-5/3 == -1`, `-5%3 == -2`). Exception: for the most negative int, `x / -1 == x` and `r == 0`. A constant divisor MUST NOT be zero, and a run-time zero divisor panics (Spec: "Integer operators").[^go-spec]
- **Overflow:** unsigned `+ - * <<` wrap modulo 2ⁿ. Signed overflow is defined, deterministic and **never panics**. A compiler MUST NOT assume no overflow (for example, that `x < x+1`) (Spec: "Integer overflow").[^go-spec]
- **Floats:** whether float division by zero panics is implementation-specific. An implementation MAY fuse operations such as FMA. An explicit conversion like `float64(x*y)` forces rounding and prevents fusion (Spec: "Floating-point operators").[^go-spec]
- `+` concatenates strings into a new string. `&&` and `||` short-circuit (Spec: "Logical operators").[^go-spec]
- **Addressable operands:**
  - variables
  - pointer indirections
  - slice index expressions
  - field selectors of addressable structs
  - index expressions on addressable arrays
  - composite literals, as a special case

  `*nil` panics (Spec: "Address operators").[^go-spec]
- **Receive** `<-ch`: blocks until a value is available. A nil channel blocks forever. A closed channel yields the zero value after the buffer drains, and `x, ok := <-ch` sets ok=false (Spec: "Receive operator").[^go-spec]

**Comparison** (Spec: "Comparison operators"):[^go-spec]

- In every comparison, one operand MUST be assignable to the other's type. The result is an untyped bool.

| Type | `==` | Ordered |
|---|---|---|
| bool, complex | yes | no |
| integer, float, string (byte-wise) | yes | yes |
| pointer | yes (same variable or both nil; distinct zero-size variables MAY compare equal) | no |
| channel | yes (same `make` call or both nil) | no |
| interface | yes (identical dynamic type and equal value). **Panics** if the dynamic type is not comparable. | no |
| struct, array | yes if all fields or elements are comparable. Compared in order and stops at the first difference. | no |
| slice, map, func | **no**, except comparison to `nil` | no |

- A non-interface value MAY be compared with an interface value if its type is comparable and implements the interface.
- **Strictly comparable:** comparable and containing no interfaces. Applies to bool, numeric, string, pointer and channel types, and to structs or arrays made only of strictly comparable parts.

**Conversions** `T(x)` (Spec: "Conversions"):[^go-spec]

- Parenthesize when T starts with `*`, `<-` or with `func` without results: `(*Point)(p)`, `(<-chan int)(c)`.
- A constant MAY be converted if it is representable. Converting to a non-type-parameter type gives a typed constant.
- A non-constant x converts to T when:
  - x is assignable to T
  - the underlying types are identical, ignoring struct tags
  - both are unnamed pointer types whose base types have identical underlying types
  - both are integer or float types
  - both are complex types
  - x is an integer, `[]byte` or `[]rune` and T is a string type
  - x is a string and T is `[]byte` or `[]rune`
  - x is a slice and T is an array [Go 1.20] or an array pointer [Go 1.17]
- **Numeric conversions:**
  - Integer to integer: sign- or zero-extend, then truncate. There is no overflow signal.
  - Float to integer: truncates toward zero.
  - To float: rounds to the target precision. If a non-constant float result is out of range, the value is implementation-dependent.
- **Strings:**
  - `string([]byte)` copies the bytes.
  - `string([]rune)` concatenates UTF-8 encodings.
  - `[]byte(s)` gives a non-nil slice whose capacity MAY exceed its length.
  - `[]rune(s)` gives the code points.
  - `string(int)` gives the UTF-8 of that code point, or `"�"` if invalid. This is historical, flagged by vet, and MAY be removed (use `utf8.AppendRune`).
- **Slice to array:** `[N]T(s)` or `(*[N]T)(s)` panics if `len(s) < N`. `(*[0]T)(nilSlice)` is nil (Spec: "Conversions from slice to array or array pointer").
- There is no conversion between pointers and integers except through `unsafe`.

### Order of evaluation

- In expressions, assignments and `return`, function calls, method calls, receives and `&&`/`||` run in **left-to-right lexical order**. The order relative to plain operand evaluation (for example `a` vs. `f()` in `[]int{a, f()}`, or map key vs. value) is **unspecified** (Spec: "Order of evaluation").[^go-spec]
- At package level, initialization dependencies override left-to-right order between initialization expressions, but not within one expression. Floating-point operations follow associativity, and parentheses override it.[^go-spec]

### Statements

**Terminating statements** (Spec: "Terminating statements"):[^go-spec]

1. `return` or `goto`.
2. A call to `panic`.
3. A block whose statement list ends in a terminating statement.
4. An `if` with an `else` where both branches terminate.
5. A `for` with no condition, no `range` and no `break` targeting it.
6. A `switch` with a `default`, no `break` targeting it, and every clause ending in a terminating statement or `fallthrough`.
7. A `select` with no `break` targeting it and every clause terminating.
8. A labeled terminating statement.

**Simple statements:**

- Expression statements: the built-ins `append cap complex imag len make max min new real` and the `unsafe.*` functions are **not allowed** as statements (Spec: "Expression statements").[^go-spec]
- **Send:** both operands are evaluated first. A send blocks until it can proceed. Sending on a closed channel **panics**, and sending on a nil channel blocks forever (Spec: "Send statements").[^go-spec]
- `x++` ≡ `x += 1`. The operand MUST be addressable or a map index (Spec: "IncDec statements").[^go-spec]

**Assignment** (Spec: "Assignment statements"):[^go-spec]

- The left side MUST be addressable, a map index, or `_` (for `=` only). `x op= y` evaluates x once.
- **Tuple assignment** runs in two phases. First, index and pointer-indirection operands on the left and all expressions on the right are evaluated. Second, assignments run left to right. So `a, b = b, a` swaps, and `i, x[i] = 1, 2` sets `x[0]`.
- An untyped constant assigned to an interface or to `_` takes its default type. Assignment copies references, not the data they point to.

**if / switch** (Spec: "If statements", "Switch statements"):[^go-spec]

- Both MAY start with a simple statement, such as `if x := f(); x < y {}`.
- **Expression switch:** the tag is evaluated once and MUST be comparable, and `nil` is not allowed as the tag. A missing tag means `true`. Cases are evaluated left to right and top to bottom, and the first match wins. There is at most one `default`, anywhere in the switch. Untyped case values are converted to the tag's type. A compiler MAY reject duplicate constant cases.
- **`fallthrough`** MUST be the last non-empty statement of a non-final clause of an **expression** switch. It is not allowed in a type switch.
- **Type switch** `switch v := x.(type)`: x MUST be an interface and not a type parameter. Case types MUST be distinct. In a single-type clause, `v` has that type. Otherwise, including the `nil` and `default` clauses, `v` has x's type. A case MAY be a type parameter, and if instantiation creates duplicates, the first matching case wins.

**for** (Spec: "For statements"):[^go-spec]

- Three forms: a condition, a ForClause (`init; cond; post`, where post MUST NOT be `:=`) or a range clause.
- **Per-iteration variables [Go 1.22]:** each iteration has its own variables. A new variable is declared before `post` runs, initialized from the previous iteration's value. Before 1.22, all iterations shared one variable (the spec's example prints `6 6 6` instead of `1 3 5`).

| Range expression | 1st value | 2nd value |
|---|---|---|
| `[n]E`, `*[n]E`, `[]E` | index `int` | `a[i]` E |
| string | byte index `int` | `rune` (0xFFFD on invalid UTF-8, then advances 1 byte) |
| `map[K]V` | key | value |
| channel | element | — |
| integer `n` [Go 1.22] | 0…n−1 | — |
| `func(yield func() bool)` [Go 1.23] | — | — |
| `func(yield func(V) bool)` | v | — |
| `func(yield func(K, V) bool)` | k | v |

- The range expression is evaluated **once** before the loop, unless at most one iteration variable is used and `x` or `len(x)` is constant. Map order is **unspecified**: entries removed before they are reached are skipped, and entries added during iteration MAY or MAY NOT appear. A nil map or slice gives 0 iterations, and a nil channel blocks forever.[^go-spec]
- For `range n`, the iteration values have n's type, or the default `int` for untyped n (or the type of a preexisting loop variable). `n <= 0` gives no iterations. `for range 1e3` is invalid.[^go-spec]
- **Iterator functions:** the loop calls `f` with a synthesized `yield`. Each `yield` call runs the body once. `yield` returns true to continue. If the body terminates (for example with `break`), `yield` returns false and **MUST NOT be called again**. `yield` cannot be variadic.[^go-spec]

```go
for x := range fibo { if x >= 1000 { break } }
for k, v := range t.Walk { /* in-order tree walk */ }
```

**go, select, return, branches, defer:**

- **`go f(x)`:** the function value and arguments are evaluated in the calling goroutine, then f runs in a new goroutine. Its results are discarded, and built-in calls are restricted as for expression statements (Spec: "Go statements").[^go-spec]
- **`select`** (Spec: "Select statements"):[^go-spec]
  - All channel operands and send values are evaluated once, in source order, on entry.
  - If several cases are ready, one is picked by **uniform pseudo-random** choice. Otherwise `default` runs, or the statement blocks.
  - Receive left-hand sides are evaluated only for the chosen case.
  - `select {}` blocks forever, as does a select over only nil channels with no default.
- **`return`** (Spec: "Return statements"):[^go-spec]
  - Results MAY be listed explicitly, given as one multi-valued call, or left empty when results are named.
  - Results start as zero values. `return` sets them **before** deferred functions run.
  - A compiler MAY reject a bare `return` when a result name is shadowed.
- **`break` / `continue`:** `break` ends the innermost `for`, `switch` or `select`, or the labeled one. `continue` applies only to `for` loops, optionally labeled. Both stay within the same function (Spec: "Break statements", "Continue statements").[^go-spec]
- **`goto`:** it MUST NOT jump over variable declarations into their scope, or into a block from outside it (Spec: "Goto statements").[^go-spec]
- **`defer f(x)`** (Spec: "Defer statements"):[^go-spec]
  - The function value and arguments are evaluated **when the defer statement runs**.
  - Deferred calls run in **LIFO** order when the function returns, reaches the end of its body, or panics. They run after `return` has set the results, so a deferred closure MAY modify named results.
  - A nil deferred function panics when invoked, not when deferred.

```go
func f() (result int) { defer func() { result *= 7 }(); return 6 } // returns 42
```

### Built-in functions

Built-ins have no standard Go types: they can only be called and cannot be used as function values (Spec: "Built-in functions").[^go-spec]

| Built-in | Behaviour |
|---|---|
| `append(s S, x ...E) S` | Reuses the underlying array if capacity allows, otherwise allocates a new one. `append([]byte, string...)` is allowed. Correct even when arguments overlap. |
| `copy(dst, src) int` | Copies `min(len(src), len(dst))` elements. Accepts `copy([]byte, string)`. Handles overlap. |
| `cap(v)` | Array length; slice capacity; channel buffer capacity. 0 for nil. |
| `clear(x)` [Go 1.21] | Map: deletes all entries. Slice: zeroes elements up to `len`. No-op on nil. |
| `close(ch)` | Not allowed on a receive-only channel. Closing a closed or nil channel **panics**, and later sends panic. Receives drain the buffer, then return zero values. |
| `complex/real/imag` | `float32` ↔ `complex64` and `float64` ↔ `complex128`. Constant arguments give a constant result. Type-parameter arguments are not allowed. |
| `delete(m, k)` | No-op if m is nil or k is missing. |
| `len(v)` | String bytes; array length; slice length; map key count; queued channel elements. Constant for constant strings, and for arrays without receives or non-constant calls. Result always fits in `int`. |
| `make(T, …)` | Slice: `(T, n[, m])`. Map: `(T[, hint])`. Channel: `(T[, buf])`. Returns T, not *T. Constant sizes MUST be ≥0 and fit in int, with n ≤ m. A run-time negative n or n > m panics. |
| `max/min(x, …)` [Go 1.21] | Need at least one argument of an ordered type. Same type rules as `+`. If any argument is NaN, the result is NaN. −0.0 < 0.0. Strings compare byte-wise. Constant arguments give a constant. |
| `new(T)` / `new(expr)` | Pointer to a new variable that holds the zero value (for T) or the expression's value (`new(123)` is `*int`). `new(nil)` is illegal. |
| `panic(v)` | Starts panicking (see below). `panic(nil)` causes a run-time panic. |
| `recover()` | Returns the panic value only when called **directly by a deferred function** while panicking, otherwise nil. |
| `print/println` | For bootstrapping only. Not guaranteed to stay in the language. |

**Panicking** (Spec: "Handling panics"):[^go-spec]

- A panic stops F, runs F's deferred calls, then unwinds through the callers up to the top of the goroutine, and then the **program terminates**.
- If deferred function D in G calls `recover` and returns normally, panicking stops and G returns normally to its caller.

### Packages and imports

- A source file is: a `package` clause, then `import` declarations, then top-level declarations. The package name MUST NOT be `_`. An implementation MAY require all files of a package to be in one directory (Spec: "Source file organization", "Package clause").[^go-spec]

| Import | Access |
|---|---|
| `import "lib/math"` | `math.Sin` |
| `import m "lib/math"` | `m.Sin` |
| `import . "lib/math"` | `Sin`. Exported names are declared in the file block. |
| `import _ "lib/math"` | Imported for side effects (init) only. |

- A package MUST NOT import itself, directly or indirectly. Importing a package without using any of its exported identifiers is illegal. Import path interpretation is implementation-dependent (Spec: "Import declarations").[^go-spec]

### Program initialization and execution

**Package variables** (Spec: "Package initialization"):[^go-spec]

- Variables are initialized repeatedly: at each step, the variable that is earliest in declaration order and has no uninitialized dependencies goes next. Leftover variables form an initialization cycle, which is invalid.
- Dependencies are **lexical references**, analysed transitively through function and method bodies. Only references within the current package count. Hidden dependencies (for example through interface calls) leave the order unspecified.
- Variables in multiple files follow the order the files are given to the compiler. Build systems are encouraged to present files in lexical filename order.
- Variables assigned from one multi-valued expression are initialized together.

**init functions:**

- Any number of `func init()` with no arguments or results are allowed per package, even per file. They cannot be referenced.
- A package is initialized by assigning all its variables, then calling the init functions in source order (Spec: "Package initialization").[^go-spec]

**Program** (Spec: "Program initialization", "Program execution"):[^go-spec]

- Packages are taken sorted by import path. At each step, the first uninitialized package whose imports are all initialized is initialized. Each package is initialized once.
- Initialization runs in **one goroutine, sequentially**. An init function MAY start goroutines, but the next init does not start until the previous one returns.
- `package main` MUST declare `func main()` with no arguments and no results. The program exits when `main` returns and **does not wait for other goroutines**.

### Errors and run-time panics

- `type error interface { Error() string }` is predeclared. A `nil` error means no error (Spec: "Errors").[^go-spec]
- Run-time errors such as an index out of range panic with a value of the implementation-defined `runtime.Error` interface, which embeds `error`. The exact error values are unspecified (Spec: "Run-time panics").[^go-spec]

### System considerations

**package unsafe** (Spec: "Package unsafe"):[^go-spec]

- A package that uses unsafe MUST be vetted manually and MAY not be portable.
- `unsafe.Pointer` cannot be dereferenced. Any pointer or `uintptr` value converts to and from it. The effect of converting between Pointer and uintptr is implementation-defined.

| Function | Notes |
|---|---|
| `Sizeof(x)`, `Alignof(x)`, `Offsetof(s.f)` | Return `uintptr`. Compile-time constants unless the size is variable (type parameters). `Offsetof` MUST NOT go through pointer indirections. |
| `Add(ptr, len)` [Go 1.17] | Equivalent to `Pointer(uintptr(ptr)+uintptr(len))`. |
| `Slice(ptr, len)` [Go 1.17] | `nil` for (nil, 0). Panics if len is negative, or if ptr is nil and len ≠ 0. |
| `SliceData(s)`, `String(ptr,len)`, `StringData(s)` [Go 1.20] | The bytes passed to `String`, and the bytes from `StringData`, MUST NOT be modified. |

**Size and alignment guarantees** (Spec: "Size and alignment guarantees"):[^go-spec]

| Types | Size in bytes |
|---|---|
| `byte`, `uint8`, `int8` | 1 |
| `uint16`, `int16` | 2 |
| `uint32`, `int32`, `float32` | 4 |
| `uint64`, `int64`, `float64`, `complex64` | 8 |
| `complex128` | 16 |

- `Alignof(x)` is at least 1.
- A struct's alignment is the maximum of its fields' alignments, and at least 1.
- An array's alignment equals its element's alignment.
- A struct or array with no fields or elements of size > 0 has size zero. Distinct zero-size variables MAY share an address.

### Language version table (appendix)

Source: (Spec: "Language versions").[^go-spec] Go 1 compatibility: a program that works with one language version keeps working with later versions.

| Version | Additions |
|---|---|
| 1.9 | Alias declarations |
| 1.13 | `0b`/`0o` prefixes, hex floats, `i` suffix on any literal, `_` digit separators, signed shift counts |
| 1.14 | The same method may be embedded more than once through different interfaces |
| 1.17 | Slice → array-pointer conversion; `unsafe.Add` and `unsafe.Slice` |
| 1.18 | Generics: `~` token, type parameters, general interfaces, `any` and `comparable` |
| 1.20 | Slice → array conversion; `unsafe.SliceData`, `String` and `StringData`; comparable (non-strict) types satisfy `comparable` |
| 1.21 | `min`, `max` and `clear`; inference uses interface methods and works for generic functions passed or assigned |
| 1.22 | Per-iteration loop variables; `range` over integers |
| 1.23 | `range` over iterator functions |
| 1.24 | Generic type aliases |
| 1.27 | Function type inference in all assignment contexts; generic methods; any valid field selector as a struct-literal key |

## Memory model

Version read: "Version of June 6, 2022". The memory model defines when a read in one goroutine is guaranteed to observe a write made in another goroutine.[^go-mem]

### Advice

- Programs that modify data accessed by several goroutines at once MUST serialize that access, using channels or `sync` / `sync/atomic` primitives.[^go-mem]
- Quote: "If you must read the rest of this document to understand the behavior of your program, you are being too clever. Don't be clever."[^go-mem]

### Core definitions

- **Data race:** a write to a memory location concurrent with another read or write of the same location, unless all the accesses involved are `sync/atomic` accesses.[^go-mem]
- **DRF-SC:** data-race-free programs behave as if all goroutines were multiplexed onto a single processor (sequential consistency). This matches the guarantee in C, C++, Java, JavaScript, Rust and Swift. The formal model follows Boehm and Adve (PLDI 2008).[^go-mem]
- **Memory operations** are described by kind, program location, memory location and the value read or written.
  - **Read-like:** read, atomic read, mutex lock, channel receive.
  - **Write-like:** write, atomic write, mutex unlock, channel send, channel close.
  - Compare-and-swap is both.[^go-mem]
- **Sequenced before:** the order required by the spec's control flow and evaluation order rules (Requirement 1). Synchronizing operations MUST be explainable by a total order consistent with sequencing (Requirement 2).[^go-mem]
- **Synchronized before:** if a synchronizing read r observes a synchronizing write w (W(r)=w), then w is synchronized before r.
- **Happens before:** the transitive closure of sequenced before ∪ synchronized before.[^go-mem]
- **Visibility (Requirement 3):** an ordinary read r of x MUST observe a write w such that w happens before r, and w does not happen before another write w′ to x that itself happens before r.[^go-mem]
- **Read-write / write-write race:** two conflicting accesses to x, at least one non-synchronizing, that are unordered by happens before.[^go-mem]
- Certain language operations, such as goroutine creation and memory allocation, act as synchronization operations. Each package MUST document its own synchronization guarantees.[^go-mem]

### Implementation restrictions for racy programs

- An implementation MAY report a race and halt; `go build -race` (ThreadSanitizer) does exactly this.[^go-mem]
- Array, struct and complex reads and writes MAY be split into their sub-values, in any order.[^go-mem]
- A read of a location no larger than a machine word MUST observe some preceding or concurrent write, never one overwritten in between. Acausal and "out of thin air" values are disallowed.[^go-mem]
- Multi-word values are **not required** to be read atomically. Races on interface values, maps, slices or strings (internal pointer/length or pointer/type pairs) can cause **arbitrary memory corruption**.[^go-mem]

### Synchronization rules

| Mechanism | Guarantee (Mem: "Synchronization") |
|---|---|
| Initialization | Runs in one goroutine, which MAY start others. If p imports q, q's init functions complete **before** any of p's start. All init functions are synchronized before `main.main` starts. |
| Goroutine creation | The `go` statement is synchronized before the new goroutine starts running. |
| Goroutine exit | **Not** synchronized before any event. A write in an unsynchronized goroutine MAY never be observed, and a compiler MAY delete the whole `go` statement. |
| Channel send | A send is synchronized before the **completion** of the corresponding receive. |
| Channel close | `close` is synchronized before a receive that returns a zero value because the channel is closed. |
| Unbuffered receive | A receive is synchronized before the **completion** of the corresponding send. |
| Buffered capacity C | The k-th receive is synchronized before the completion of the (k+C)-th send. This makes a buffered channel usable as a **counting semaphore**. |
| `sync.Mutex` / `RWMutex` | For n < m, call n of `l.Unlock()` is synchronized before call m of `l.Lock()` returns. |
| `RLock` | For each `l.RLock`, some n-th `l.Unlock` is synchronized before RLock returns, and the matching `RUnlock` is synchronized before call n+1 of `l.Lock` returns. |
| `TryLock` / `TryRLock` | Success counts as Lock/RLock. Failure has no synchronizing effect and MAY happen even when the mutex is unlocked. |
| `sync.Once` | Completion of the single `f()` from `once.Do(f)` is synchronized before **any** `once.Do(f)` returns. |
| `sync/atomic` | If atomic op A's effect is observed by atomic op B, A is synchronized before B. All atomics behave as one sequentially consistent order (like C++ SC atomics and Java `volatile`). |
| Finalizers | `runtime.SetFinalizer(x, f)` is synchronized before the call `f(x)`. |
| Other primitives | Condition variables, lock-free maps, pools and wait groups document their own guarantees. Other packages SHOULD do the same. |

Sources for the table: [^go-mem]

```go
var limit = make(chan int, 3) // at most 3 concurrent workers
go func(w func()) { limit <- 1; w(); <-limit }(w)
```

### Incorrect synchronization

- A racy read MAY observe any concurrent write, and that does **not** mean later reads observe earlier writes. For example, with `a=1; b=2` in f, a goroutine g can print `2` then `0`.[^go-mem]
- **Double-checked locking** (`if !done { once.Do(setup) }; print(a)`): seeing `done` does not imply seeing `a`, so it MAY print an empty string.[^go-mem]
- **Busy waiting** (`for !done {}`): it MAY never see `done`, so the loop is not guaranteed to finish. A variant that publishes a pointer `g` MAY see `g != nil` without seeing the initialized `g.msg`.[^go-mem]
- In every case the fix is the same: **use explicit synchronization**.[^go-mem]

### Incorrect compilation (rules for compilers)

A compiler MUST NOT introduce writes, let one read observe several values, or let one write store several values. Specifically:[^go-mem]

- It MUST NOT move writes out of conditionals (`*p=1; if cond {*p=2}` cannot become `*p=2; if !cond {*p=1}`).
- It MUST NOT assume loops terminate, or that called functions return or contain no synchronization, when hoisting accesses to `*p` or `*q`.
- It MUST NOT reload a local from shared memory (`i := *p` cannot later become a re-read of `*p`; it may spill `i` to the stack instead).
- It MUST NOT use a shared location as scratch space (`*p = i + *p/2` cannot become `*p /= 2; *p += i`).
- These optimizations are allowed in C/C++, so a backend shared with C/C++ MUST disable them for Go.
- Exception: a rewrite is allowed if it provably does not affect correct execution on the target. For example, hoisting a non-faulting `*shared` read out of a loop is valid on essentially all CPUs, but not in a source-to-source translator.

Conclusion: data-race-free programs can rely on sequential consistency. For racy programs, "don't be clever".[^go-mem]

---

<!-- Part 3 — Modules -->

## Modules: concepts and reference

### Core terms

- A **module** is a collection of packages released, versioned and distributed together; it is identified by a module path declared in `go.mod`. The **module root directory** contains `go.mod`; the **main module** contains the directory where `go` is invoked.[^ref-mod]
- A **package path** = module path + subdirectory (e.g. `golang.org/x/net` + `html` = `golang.org/x/net/html`). Import path is a synonym.[^ref-mod]
- The **build list** is the list of module versions used for a build, computed by MVS; it is not stored in a lock file.[^ref-mod]
- **Direct dependency**: a package imported by a `.go` file in the main module (or the module containing it). **Indirect dependency**: transitively imported but not directly imported.[^ref-mod]

### Module paths

- A module path SHOULD describe what the module does and where to find it: repository root path + module subdirectory (usually empty) + major version suffix (v2+ only).[^ref-mod]
- Module subdirectory also prefixes version tags (module `golang.org/x/tools/gopls` → tags `gopls/vX.Y.Z`).[^ref-mod]
- A module never fetched as a dependency MAY use any valid package path, but MUST NOT collide with dependencies or the standard library. Std paths have no dot in the first element. `example` and `test` are reserved for users.[^ref-mod]
- Lexical rules: one or more `/`-separated elements, not starting/ending with `/`; elements use ASCII letters, digits, `-` `.` `_` `~`; no leading/trailing dot; element prefix before first dot MUST NOT be a Windows reserved name (`CON`, `com1`, `NuL`) or end with `~` + digits.[^ref-mod]
- Downloadable paths additionally: first element (by convention a domain) uses only lower-case ASCII letters, digits, `.`, `-`, MUST contain a dot and MUST NOT start with `-`; a final `/vN` element MUST NOT have a leading zero, MUST NOT be `/v1`, MUST NOT contain dots (`gopkg.in/` follows gopkg.in conventions).[^ref-mod]
- Naming advice: form `<prefix>/<descriptive-text>`; prefix is the repo location (required if publishing, e.g. `github.com/<project-name>/`) or a name you control (company name; avoid `widgets`, `utilities`, `app`). Package names carry most of the description.[^managing-deps]
- Using the repository path from the start avoids renaming if you publish later; otherwise use a safe substitute such as `<company-name>/stringtools`.[^gomod-ref]

### Versions and semver

| Part | Rule |
|---|---|
| Major | MUST be incremented (minor/patch reset to 0) after a backwards-incompatible change to public API or documented functionality |
| Minor | MUST be incremented (patch reset) after a backwards-compatible change, e.g. new function |
| Patch | MUST be incremented after a change not affecting the public interface (bug fix, optimization) |
| Pre-release `-pre` | Sorts before the release (`v1.2.3-pre` < `v1.2.3`) |
| Build metadata `+meta` | Ignored for comparison; converted to pseudo-versions |
| `+incompatible` | v2+ version released before migrating to modules |
| `+dirty` | Appended to binary version info built with Go 1.24+ in a VCS checkout with uncommitted changes |

- Versions start with `v` + Semantic Versioning 2.0.0. A version is **unstable** if major is 0 or it has a pre-release suffix; unstable versions carry no compatibility requirement.[^ref-mod]
- Canonical version = no build metadata except `+incompatible`. Non-canonical versions (e.g. `master`) are allowed only in the main module's `go.mod`; elsewhere they are errors. The `go` command rewrites them to canonical form.[^ref-mod]

### Pseudo-versions

- Format: base version prefix + UTC timestamp `yyyymmddhhmmss` (Git commit time, not author time) + 12-char commit hash prefix (Subversion: zero-padded revision).[^ref-mod]

| Form | Used when |
|---|---|
| `vX.0.0-yyyymmddhhmmss-abcdefabcdef` | no known base version (X MUST match major version suffix) |
| `vX.Y.Z-pre.0.yyyymmddhhmmss-abcdefabcdef` | base is pre-release `vX.Y.Z-pre` |
| `vX.Y.(Z+1)-0.yyyymmddhhmmss-abcdefabcdef` | base is release `vX.Y.Z` (e.g. `v1.2.4-0.20191109021931-daa7c04131f5`) |

- Checks: base version tag MUST be an ancestor of the revision; timestamp MUST match the revision; revision MUST be an ancestor of a branch or tag.[^ref-mod]
- Pseudo-versions never need typing by hand: `go get example.com/mod@master`, `go list -m -json example.com/mod@abcd1234`.[^ref-mod] Best practice: always let Go tools generate them.[^version-numbers]

### Major version suffixes

- From v2, module paths MUST end with `/vN` matching the major version (`example.com/mod` → `example.com/mod/v2` at `v2.0.0`). Suffixes are NOT allowed at v0/v1.[^ref-mod]
- Implements the **import compatibility rule**: "If an old package and a new package have the same import path, the new package must be backwards compatible with the old package."[^ref-mod]
- `gopkg.in/` paths always need a suffix, with a dot (`gopkg.in/yaml.v2`), even at v0/v1.[^ref-mod]
- Different suffixes = distinct modules; multiple major versions can coexist in one build (resolves the diamond dependency problem).[^ref-mod]

### Resolving a package to a module

- The `go` command searches the build list for modules whose paths prefix the package path; a directory needs at least one `.go` file (build constraints not applied). Exactly one provider → used; zero or 2+ → error.[^ref-mod]
- For a new package, for each `GOPROXY` entry it requests latest versions of every path prefix in parallel; the longest module path containing the package wins; if none found it tries the next entry (after 404/410 for comma lists). The new requirement is added to `go.mod` (`// indirect` if not imported by the main module).[^ref-mod]

### go.mod file: syntax

- UTF-8, line-oriented, one directive per line; a keyword can be factored into a `( ... )` block. Comments are `//` only (`/* */` not allowed). Punctuation: `(`, `)`, `=>`. Identifiers and strings (interpreted `"..."` or raw `` `...` ``) are interchangeable.[^ref-mod]
- `go.mod` is required for the main module and for local-path replacements; a module without `go.mod` can still be required.[^ref-mod]
- Edit via `go get`, `go mod tidy`, `go mod edit`, or programmatically with `golang.org/x/mod/modfile`.[^ref-mod]

```
GoMod = { Directive } .
Directive = ModuleDirective | GoDirective | ToolDirective | IgnoreDirective |
            RequireDirective | ExcludeDirective | ReplaceDirective | RetractDirective .
```

```go-mod
module example.com/my/thing

go 1.23.0

require example.com/other/thing v1.0.2
require example.com/new/thing/v2 v2.3.4
exclude example.com/old/thing v1.2.3
replace example.com/bad/thing v1.4.5 => example.com/good/thing v1.4.5
retract [v1.9.0, v1.9.5]
```

### Directives

| Directive | Semantics |
|---|---|
| `module path` | Exactly one per file. Deprecate with a `// Deprecated: msg` paragraph immediately before or on the same line; applies to all minor versions (each major version is separate); read from the `@latest` version.[^ref-mod] |
| `go 1.23.0` | Minimum Go version (mandatory since Go 1.21; advisory before). At most one; missing ⇒ `go 1.16` assumed. Gates language features and command behaviour (see table below). Input to toolchain selection.[^ref-mod] |
| `toolchain go1.21.0` | Suggested toolchain; MUST NOT be less than `go`; effective only in the main module when default toolchain is older. `default` disables switching.[^gomod-ref] |
| `godebug key=value` | GODEBUG setting for main packages and test binaries of this module when it is main module; no effect as a dependency. Unknown key is an error. Equivalent to `//go:debug key=value` in each main package; overridden by explicit `//go:debug`.[^ref-mod][^gomod-ref] |
| `require path vX` | Minimum required version; `// indirect` marks modules not directly imported by the main module.[^ref-mod] |
| `tool pkgpath` | Go 1.24+: adds package as a dependency and makes it runnable via `go tool`; requires a `require` for out-of-module tools. `tool` meta-pattern = all tools (union in workspace mode).[^ref-mod] |
| `ignore path` | Ignore directories when matching package patterns. `./x` = relative to module root; bare name = any depth. Main module only; files remain in the module tree.[^ref-mod][^gomod-ref] |
| `exclude path vX` | Prevents a version from loading; main module only. Since Go 1.16 an excluded required version is ignored (may cause higher requirement to be added); before 1.16 next higher non-excluded version was used.[^ref-mod] |
| `replace a [v] => b [v]` | Replace one version (left version given) or all versions. Right side local path (`./`, `../` or absolute) MUST contain `go.mod`, no version; module-path right side REQUIRES a version. Replacement's `module` line MUST match. Main module only; conflicting replaces across workspace modules MUST be overridden in `go.work`. Does not add a module to the graph by itself — needs a `require`.[^ref-mod] |
| `retract v` / `retract [lo, hi]` | Version(s) should not be depended on; publish in a new higher version (it may retract itself). Hidden from `go list -m -versions` and `@latest`/`@>=` queries; builds still work. Rationale comment SHOULD be given. Added in Go 1.16.[^ref-mod] |

`go` directive effects by version:[^ref-mod][^gomod-ref]

| `go` line | Effect |
|---|---|
| ≥ 1.14 | Automatic vendoring if `vendor/modules.txt` present and consistent |
| ≥ 1.16 | `all` = packages transitively imported by main-module packages and tests only |
| ≥ 1.17 | Explicit `require` for every module providing a transitively imported package; indirect deps in a separate block; enables graph pruning and lazy loading; `go mod vendor` omits deps' `go.mod`/`go.sum` and records their `go` versions in `vendor/modules.txt` |
| ≥ 1.21 | `go` line is a required minimum; MUST be ≥ `go` line of all dependencies; no compatibility with prior Go version maintained; stricter `go.sum` checksums of `go.mod` files |

Retract examples:[^ref-mod]

```go-mod
retract (
    v1.0.0 // Published accidentally.
    v1.0.1 // Contains retractions only.
)
retract [v0.0.0, v1.0.1]     // return to unversioned; v1.0.1 contains this
retract [v0.0.0-0, v0.15.2]  // wipe out incl. pseudo-versions
```

Local replace with fake version (breaks dependents, since replace applies only in main module):[^gomod-ref]

```go-mod
require example.com/mod v0.0.0-replace
replace example.com/mod v0.0.0-replace => ./mod
```

### Automatic updates

- Since Go 1.16 commands act as if `-mod=readonly`: if `go.mod` needs changes they error and suggest a fix (Go ≤1.15 defaulted to `-mod=mod`). `-mod=mod` canonicalizes versions, respects exclusions, drops redundant/misleading requirements, and reformats.[^ref-mod]

### Minimal version selection (MVS)

- MVS traverses the module graph from the main module(s), tracking the highest required version of each module; those highest versions form the build list (minimum versions satisfying all requirements). Deterministic; new upstream releases don't change it.[^ref-mod]
- **Replacement** swaps a module's content (and deps); **exclusion** removes a version and redirects requirements to the next higher one; **upgrade** adds edges to upgraded versions (and records `// indirect` reqs to preserve them); **downgrade** removes versions above target and modules depending on them; `@none` removes a module entirely.[^ref-mod]
- Inspect with `go list -m all`.[^ref-mod]

### Module graph pruning and lazy loading

- If main module is `go 1.17`+, the graph includes only immediate requirements of each `go 1.17`+ dependency (transitive deps pruned), unless also required by a ≤1.16 dependency. Pruned modules still appear in `go list -m all`, but `go build`/`go test` can't take their packages as args until `go get` promotes them.[^ref-mod]
- `go mod tidy` keeps `go.sum` checksums needed by the Go version one below the `go` directive; override with `-compat`.[^ref-mod]
- Lazy loading (1.17+): load only main `go.mod`, try to resolve imports; load the full graph only on demand.[^ref-mod]

### Workspaces (`go.work`)

- A workspace is a set of on-disk modules used as main modules for MVS. Without `go.work`, the workspace is the single current module.[^ref-mod]
- `GOWORK=off` → single-module mode; empty → search cwd and parents for `go.work`; path ending in `.work` → that file; other values error. `go env GOWORK` shows the file in use.[^ref-mod]
- `go mod init/why/edit/tidy/vendor` and `go get` always operate on a single main module.[^ref-mod]
- Directives: `go` (REQUIRED; implicit `go 1.18` if omitted per toolchain doc), `toolchain`, `godebug` (go.mod `godebug` lines ignored in workspace), `use ./dir` (adds the module at that dir; not subdirectory modules), `replace` (overrides workspace modules' replaces; wildcard replace overrides version-specific ones).[^ref-mod][^toolchain]
- `go.work.sum` tracks hashes not in modules' `go.sum`.[^ref-mod]
- Committing `go.work` is generally inadvisable (overrides developer's own; CI may test wrong versions). Exception: modules developed exclusively together.[^ref-mod]
- Commands: `go work init [moddirs]`, `go work use [-r] [dirs]`, `go work edit (-fmt|-use|-dropuse|-replace|-dropreplace|-go|-print|-json)`, `go work sync` (writes workspace build list back into each module's `go.mod`).[^ref-mod]

```go-work
go 1.23.0
use (
    ./my/first/thing
    ./my/second/thing
)
replace example.com/bad/thing v1.4.5 => example.com/good/thing v1.4.5
```

### Vendoring

- `go mod vendor` builds `vendor/` with all packages needed to build and test main-module packages (not tests of external packages), plus `vendor/modules.txt`. Build constraints except `ignore` are not considered.[^ref-mod]
- With `go 1.14`+ and `vendor/` present, vendoring is automatic; `-mod=vendor` enables explicitly; `-mod=readonly` or `-mod=mod` disables. Inconsistency between `go.mod` and `modules.txt` is an error → rerun `go mod vendor`.[^ref-mod]
- Vendored packages MUST NOT be edited locally; `go mod vendor` deletes and recreates `vendor/`. Only the main module's root `vendor/` is used; vendor dirs are excluded from module zips. `go mod download/tidy` and `go get` behave the same with vendoring.[^ref-mod]
- Flags: `-e`, `-v`, `-o dir` (Go 1.18+).[^ref-mod]

### Compatibility with non-module repositories

- If a repo root has no `go.mod`, the `go` command synthesizes one containing only `module`; proxies are expected to serve the synthetic file.[^ref-mod]
- `+incompatible`: v2+ tag in a repo-root module without `go.mod` (e.g. `require example.com/m v4.1.2+incompatible`). Treated as same module as lower majors, so may be auto-upgraded even if breaking. The tag itself MUST NOT carry `+incompatible`. Migrating such a repo SHOULD release a new major (`example.com/m/v5` at `v5.0.0`).[^ref-mod]
- Minimal module compatibility (Go 1.11, backported to 1.9.7/1.10.3): in GOPATH mode `$modpath/$vn/$dir` resolves to `$GOPATH/src/$modpath/$dir` when that `go.mod` declares `$modpath/$vn` and other conditions hold.[^ref-mod]

### Module-aware mode

- Default since Go 1.16 regardless of `go.mod`. `GO111MODULE=off` → GOPATH mode; `on`/unset → module mode; `auto` → module mode only if `go.mod` in cwd or parents.[^ref-mod]
- Module cache in `GOPATH/pkg/mod`; installed commands in `GOPATH/bin` unless `GOBIN`.[^ref-mod]
- Common flags: `-mod=mod|readonly|vendor`, `-modcacherw`, `-modfile=file.mod` (alternate `.sum` derived by name).[^ref-mod]

### Module-aware commands

| Command | Purpose / key facts |
|---|---|
| `go get [-t] [-u] [-tool] pkgs@query` | Update `require`s in main `go.mod`. Default query `@upgrade`. `-u` upgrades deps, `-u=patch` patch-only, `-t` include test deps, `-tool` add/remove `tool` line. `-d` deprecated, always on since 1.18. `@none` removes. Warns on retracted/deprecated. Rejects `-mod`.[^ref-mod] |
| `go get go` / `go get toolchain[@patch]` | Upgrade min Go version / suggested toolchain.[^ref-mod] |
| `go install pkg@version` | Recommended since 1.16 to install programs; ignores current `go.mod`. With version: args MUST be main package paths/patterns from one module at one version, same suffix; no std/meta-patterns/file paths; module MUST NOT have `replace`/`exclude` changing interpretation. `go install tool` installs module tools.[^ref-mod] |
| `go tool [-n] cmd` | Run tools declared by `tool` directive, by full path or unique last element.[^ref-mod] |
| `go list -m [-u] [-retracted] [-versions] [-json]` | List modules; `all` = build list; `-u` shows `[upgrade]`, `(retracted)`, `(deprecated)`.[^ref-mod] |
| `go mod download [-x] [-json] [-reuse=old.json]` | Pre-fill module cache.[^ref-mod] |
| `go mod edit` | Low-level edits: `-module`, `-go`, `-require/-droprequire`, `-exclude/-dropexclude`, `-replace=old[@v]=new[@v]/-dropreplace`, `-retract/-dropretract`, `-tool/-droptool`, `-fmt`, `-print`, `-json`.[^ref-mod] |
| `go mod graph [-go=version]` | Print requirement graph edges `path@version dep@version`.[^ref-mod] |
| `go mod init [path]` | Create `go.mod`; MUST NOT already exist.[^ref-mod] |
| `go mod tidy [-e] [-v] [-x] [-diff] [-go=V] [-compat=V]` | Add missing / remove unused requirements and `go.sum` lines; all build tags enabled except `ignore`; skips `testdata`, `.`/`_` dirs. `-diff` prints diff and exits non-zero if changes.[^ref-mod] |
| `go mod vendor [-e] [-v] [-o]` | Build `vendor/`.[^ref-mod] |
| `go mod verify` | Check cached zips/dirs unmodified since download; prints "all modules verified".[^ref-mod] |
| `go mod why [-m] [-vendor] pkgs` | Shortest import path from main module.[^ref-mod] |
| `go version -m file` | Print embedded module info (`path`, `mod`, `dep`, `=>` rows); same data via `runtime/debug.ReadBuildInfo`.[^ref-mod] |
| `go clean -modcache` | Remove whole module cache (best way; cache is read-only).[^ref-mod] |

Outside a module: build commands only load std and `.go` files on command line; `go list -m`/`go mod download` need explicit version queries; `go mod edit` needs a file arg; `graph/tidy/vendor/verify/why` error.[^ref-mod]

### Version queries

| Query | Selects |
|---|---|
| `v1.2.3` | that version |
| `v1`, `v1.2` | highest with prefix |
| `<v1.2.3`, `>=v1.5.6` | nearest matching version |
| commit hash / tag / branch | tagged version or pseudo-version (`v2` means prefix, not branch) |
| `latest` | highest release, else pre-release, else pseudo-version of default branch tip |
| `upgrade` | like `latest` but keeps a higher current version |
| `patch` | latest with same major.minor as current |

- Release versions are preferred over pre-releases; excluded and retracted versions are not considered.[^ref-mod]

### Module proxies and the GOPROXY protocol

| Endpoint | Returns |
|---|---|
| `$base/$module/@v/list` | known versions, one per line (no pseudo-versions) |
| `$base/$module/@v/$version.info` | JSON `{Version, Time}` (Time RFC 3339) |
| `$base/$module/@v/$version.mod` | `go.mod` (synthetic `module` line if none) |
| `$base/$module/@v/$version.zip` | module zip |
| `$base/$module/@latest` | optional; JSON info of latest |

- Plain GET, no query params/headers; even `file://` works. 200 = success; 404/410 = not here, try elsewhere. Uppercase letters case-encoded as `!` + lowercase (`example.com/!m`).[^ref-mod]
- In `GOPROXY`, `,` falls back only on 404/410; `|` falls back on any error. Keywords `direct`, `off`. Default `https://proxy.golang.org,direct`.[^ref-mod]
- A proxy MUST serve identical `.mod`/`.zip` content forever; `.info` and lists are not authenticated. `$GOPATH/pkg/mod/cache/download` has the proxy layout and can be served as a proxy.[^ref-mod]
- `go-import` VCS `mod` serves a module directly via proxy protocol: `<meta name="go-import" content="example.com/gopher mod https://modproxy.example.com">`.[^ref-mod]

### VCS lookup and go-import meta tags

- Supported VCS: Git, Subversion, Mercurial, Bazaar, Fossil (tool MUST be on `PATH`).[^ref-mod]
- A path with a VCS qualifier (`.git`, `.hg`, `.svn`, `.bzr`, `.fossil`) uses everything up to it as repo URL; otherwise GET `https://<path>?go-get=1` (HTTP fallback only with `GOINSECURE`).[^ref-mod]
- Meta tag (in `<head>`, early, before JS/CSS): `<meta name="go-import" content="root-path vcs repo-url [subdirectory]">`; `subdirectory` recognized only by Go 1.25+.[^ref-mod]
- Tags: repo-root or major-subdir module → tag equals version; subdirectory module → `subdir/vX.Y.Z`. Tag major MUST match path suffix. Tags MUST NOT be deleted or moved once created.[^ref-mod]
- A module with suffix `/v2` may live in `foo/bar` or `foo/bar/v2` (major version subdirectory).[^ref-mod]
- If a subdirectory module lacks `LICENSE`, the repo-root `LICENSE` (exact name) is copied into its zip.[^ref-mod]

| VCS | Cmd | GOVCS default | Secure schemes |
|---|---|---|---|
| Bazaar | `bzr` | private only | https, bzr+ssh |
| Fossil | `fossil` | private only | https |
| Git | `git` | public and private | https, git+ssh, ssh |
| Mercurial | `hg` | public and private | https, ssh |
| Subversion | `svn` | private only | https, svn+ssh |

### Module zip constraints

- Zip ≤ 500 MiB, uncompressed ≤ 500 MiB; `go.mod` and `LICENSE` ≤ 16 MiB each.[^ref-mod]
- Every file prefixed `$module@$version/`; metadata ignored; symlinks/irregular files, `vendor/` contents and nested-module dirs excluded; empty dirs not extracted; no paths equal under Unicode case-folding; `go.mod` only at top level; names limited to Unicode letters, ASCII digits, space and ``!#$%&()+,-.=@[]^_{}~``; no Windows reserved names.[^ref-mod]
- `//go:embed` MUST NOT match files in nested modules; an empty `go.mod` in `testdata` can exclude large files.[^ref-mod]

### Private modules

| Variable | Meaning |
|---|---|
| `GOPRIVATE` | glob patterns of private module prefixes; default for `GONOPROXY`/`GONOSUMDB`; also defines "private" for `GOVCS` |
| `GONOPROXY` | fetch matches directly from VCS |
| `GONOSUMDB` | do not verify matches with checksum DB |
| `GOINSECURE` | matches may use HTTP/insecure schemes (does not disable checksum validation) |
| `GOVCS` | `pattern:vcslist,...` (e.g. `github.com:git,evil.com:off,*:git\|hg`); default `public:git\|hg,private:all`; first match wins (Go 1.16+) |

Patterns:[^ref-mod]

```sh
# Private proxy serving all modules
GOPROXY=https://proxy.corp.example.com
GONOSUMDB=corp.example.com
# Private proxy serving only private modules
GOPROXY=https://proxy.corp.example.com,https://proxy.golang.org,direct
GONOSUMDB=corp.example.com
# Direct access
GOPRIVATE=corp.example.com
```

- Credentials: `.netrc` (`NETRC` var; `$HOME/.netrc` or `%USERPROFILE%\_netrc`), `GOAUTH` (Go 1.24+: netrc, `git credential fill`, or custom header command; HTTPS only), or user:pass in `GOPROXY` URL (caution: logs/history). Git runs with `GIT_TERMINAL_PROMPT=0`; `.gitconfig` `insteadOf` can rewrite `https://github.com/` to SSH.[^ref-mod]
- Privacy: misrouted private paths can leak to `proxy.golang.org` if a private proxy returns 404/410 for typos.[^ref-mod]

### Authenticating modules: go.sum and checksum database

- Each downloaded `.mod`/`.zip` is hashed and compared to the main module's `go.sum`; mismatch → security error, file not cached. Missing hash → verified via checksum DB unless `GOPRIVATE`/`GONOSUMDB` match or `GOSUMDB=off`.[^ref-mod]
- `go.sum` line: `module version[/go.mod] h1:base64`. `h1` = SHA-256 (only algorithm). May hold multiple/obsolete versions; `go mod tidy` cleans.[^ref-mod]
- Checksum DB `sum.golang.org` is a transparent log (Merkle tree, Trillian); endpoints `/latest`, `/lookup/$module@$version`, `/tile/$H/$L/$K[.p/$W]`, `/tile/$H/data/$K[.p/$W]`; client performs inclusion and consistency proofs.[^ref-mod]
- `GOSUMDB="sum.golang.org[+<publickey>] [url]"`; `sum.golang.google.cn` known alias; other DBs need explicit key; `off` disables.[^ref-mod]

### Module cache

- Default `$GOPATH/pkg/mod` (`GOMODCACHE`); no max size, never auto-pruned; shared and concurrency-safe; files read-only.[^ref-mod]
- Layout: `$module@$version/` (extracted), `cache/download/$module/@v/{list,.info,.mod,.zip,.ziphash}`, `cache/download/sumdb/`, `cache/vcs/`. Capitals escaped (`Azure` → `!azure`).[^ref-mod]

### Environment variables

| Var | Summary |
|---|---|
| `GO111MODULE` | `off` / `on` (or unset) / `auto` |
| `GOMODCACHE` | module cache dir, default `$GOPATH/pkg/mod` |
| `GOINSECURE`, `GONOPROXY`, `GONOSUMDB`, `GOPRIVATE` | comma-separated `path.Match` globs (see above) |
| `GOPATH` | module cache in first entry's `pkg/mod`; default `~/go` |
| `GOPROXY` | proxy list with `,`/`\|`; schemes https/http/file; `file://$(go env GOMODCACHE)/cache/download` usable |
| `GOSUMDB` | checksum DB name/key/URL |
| `GOVCS` | allowed VCS tools |
| `GOWORK` | `go.work` path or `off` (`GOWORK=off go build .`) |
| `GOFLAGS` | e.g. `go env -w GOFLAGS=-modcacherw` |

[^ref-mod]

## Toolchains (go and toolchain lines, GOTOOLCHAIN)

### Versions and names

- Since Go 1.21 the distribution is a `go` command plus bundled toolchain; the command may run other toolchains from `PATH` or download them.[^toolchain]
- Version syntax `1.N.P` (initial `1.N.0`), RCs `1.NrcR`; `1.N` is the language version. Ordering: `1.21 < 1.21rc1 < 1.21rc2 < 1.21.0 < 1.21.1`; for N < 21, `1.N` sorts after RCs (`1.20rc3 < 1.20 < 1.20.1`); betas precede RCs.[^toolchain]
- Toolchain names `goV` (`go1.21.0`, `go1.21rc1`; `go1.21` is not valid, `go1.20` is); non-standard `goV-suffix` compares equal to `goV`.[^toolchain]

### Configuration rules

- `go` line = minimum required Go version; implicit `go 1.16` in `go.mod`, `go 1.18` in `go.work`. Missing `toolchain` ⇒ implicit `toolchain go<go-version>`.[^toolchain]
- A toolchain refuses to load a module/workspace requiring a newer Go (e.g. Go 1.21.2 refuses `go 1.21.3`). Partly backported: Go 1.19.13+ and 1.20.8+ refuse `go 1.22`+.[^toolchain]
- A module's `go` line MUST be ≥ every required module's `go` line; a workspace's ≥ every `use`d module's.[^toolchain]
- Per-file language version via build constraint, e.g. `//go:build go1.22`.[^toolchain]

### GOTOOLCHAIN

- Lookup: process env → `go env -w` file → `$GOROOT/go.env` (standard sets `auto`; if missing assume `local`).[^toolchain]

| Value | Behaviour |
|---|---|
| `local` | always bundled toolchain |
| `go1.21.0` (`<name>`) | always that toolchain (PATH, else download) |
| `<name>+auto` / `auto` (= `local+auto`) | default `<name>`, switch to newer per `toolchain`/`go` lines, download if needed |
| `<name>+path` / `path` | like auto but no download fallback |

- Selection: `toolchain <tname>` newer than default → run it; `toolchain default` → no switching; else `go <version>` newer → run `go<version>`.[^toolchain]
- Trace selection with `GODEBUG=toolchaintrace=1` (Go 1.24+). `GOTOOLCHAIN=go1.21rc3 go test` forces a version.[^toolchain]
- Mid-command switches (`go get`, `go work use/sync`, `go install/run pkg@version`) choose the oldest supported candidate (latest RC of unreleased, latest patch of the two latest releases) satisfying the requirement, and print e.g. `go: module example.com/widget@v1.2.3 requires go >= 1.24rc1; switching to go 1.27.9`. Commands that bump `go` also write `toolchain`.[^toolchain]
- Toolchains are downloaded as module `golang.org/toolchain` `v0.0.1-goVERSION.GOOS-GOARCH`; proxied via `GOPROXY`, verified by checksum DB; fail if `GOSUMDB=off`; `GOPRIVATE`/`GONOSUMDB` do not apply.[^toolchain]

### Managing with go get / go work

```sh
go get go@1.22.1 toolchain@1.24rc1   # go 1.22.1 + toolchain go1.24rc1
go get go@1.25.0                     # also bumps toolchain; drops line if equal
go get toolchain@none                # remove toolchain line
go get go@1.22                       # latest 1.22 release
go work use                          # resync go.work go version
go work edit -toolchain=none
```

- Preferred over the older `go mod tidy -go=1.22`. `go get`/`go mod tidy` keep `go` ≥ dependencies' `go` lines; downgrading `go` downgrades/removes incompatible deps.[^toolchain]

## Managing dependencies (workflow)

1. Locate packages on pkg.go.dev; 2. import them; 3. `go mod init` to enable tracking; 4. `go get` to add; 5. upgrade/downgrade over time.[^managing-deps]

| Task | Command |
|---|---|
| Enable tracking | `go mod init example/mymodule` |
| Add deps for current package | `go get .` |
| Add specific dep | `go get example.com/theirmodule` |
| Specific / latest version | `go get example.com/theirmodule@v1.3.4` / `@latest` |
| Specific commit / branch | `@4cf76c2` / `@bugfixes` (pseudo-version recorded) |
| Discover updates | `go list -m -u all`, `go list -m -u example.com/theirmodule` |
| Sync / prune | `go mod tidy` |
| Remove dep | `go get example.com/theirmodule@none` |
| Tool dep (1.24+) | `go get -tool golang.org/x/tools/cmd/stringer`; `go tool stringer`; `go get tool`; `go install tool` |
| Proxy | `GOPROXY="https://proxy.example.com,https://proxy2.example.com"` (`,` 404/410; `\|` any error) |

- `go.mod` and `go.sum` MUST be committed with the code.[^managing-deps][^blog-using-modules]
- Reserved prefixes: `test` (modules created by tests) and `example` (docs/tutorials).[^managing-deps]
- Local unpublished module: `go mod edit -replace=example.com/theirmodule@v0.0.0-unpublished=../theirmodule` then `go get example.com/theirmodule@v0.0.0-unpublished`. Fork: `go mod edit -replace=example.com/theirmodule@v1.2.3=example.com/myfork/theirmodule@v1.2.3-fixed`. Replaced modules are not authenticated; keep import statements unchanged.[^managing-deps][^gomod-ref]
- Before Go 1.24, emulate tools with a blank import in a build-constrained file plus `go run`.[^managing-deps]
- Use `exclude` e.g. for an indirectly required version with an invalid checksum: `go mod edit -exclude=example.com/theirmodule@v1.3.0`.[^gomod-ref]

## Developing and publishing modules

### Workflow

- Steps: design/code packages → commit to repo with conventions → publish (tag) → revise with semver versions.[^mod-developing]
- Keep the public API focused; design for backward compatibility; use `replace` to code against an unpublished module. Publishing is decentralized: tag in your repo; Go tools fetch from repo or proxy; module appears on pkg.go.dev after someone fetches it.[^mod-developing]

### Release workflow

| Stage | Example | Notes |
|---|---|---|
| Pre-release | `v0.2.1-beta.1`, `v1.2.3-alpha` | users MUST request explicitly: `go get example.com/theirmodule@v1.2.3-alpha` |
| First unstable | `v0.1.3` | no guarantees; breaking changes allowed |
| First stable | `v1.0.0` | commits to no breaking API changes, no removed exported types; additions in minor, fixes in patch |
| Patch | `v1.0.0` → `v1.0.1` | no public API changes; SHOULD NOT bump transitive deps by more than a patch |
| Minor | `v1.0.1` → `v1.1.0` | new functions/methods/fields/types, dependency changes |
| Major | `v1.5.2` → `v2.0.0` | last resort; new module path `/v2`, update internal imports, pre-release first |

[^release-workflow]

### Repository source

- Initial commit: `LICENSE`, `go.mod`, `go.sum` (edit only via `go mod tidy`), package directories and `.go` files.[^managing-source]
- One module per repo with `go.mod` at the root is simplest (no tag prefix). Multiple modules: each module root has its own `go.mod`, and tags MUST be prefixed with the subdirectory.[^managing-source]

| Item | Value (module `example.com/mymodules/module1` v1.2.3) |
|---|---|
| Version tag | `module1/v1.2.3` |
| Package import | `example.com/mymodules/module1/package1` |
| User require | `example.com/mymodules/module1 v1.2.3` |

- `go get` flow: module path from import → URL to proxy/repo → match version to tag (latest release if unknown) → download into module cache.[^managing-source]

### Publishing steps

```sh
go mod tidy
go test ./...
git commit -m "mymodule: changes for v0.1.0"
git tag v0.1.0
git push origin v0.1.0
GOPROXY=proxy.golang.org go list -m example.com/mymodule@v0.1.0
```

- Do NOT change a tagged version after publishing — tools authenticate against the first downloaded copy; publish a new version instead.[^mod-publishing]

### Version numbering

| Stage | Example | Message |
|---|---|---|
| In development | pseudo-version, `v0.x.x` | unstable, no guarantees |
| Major | `v1.x.x` | backward-incompatible public API changes |
| Minor | `vx.4.x` | backward-compatible API changes |
| Patch | `vx.x.1` | no API or dependency changes |
| Pre-release | `vx.x.x-beta.2` | milestone, no stability guarantee |

- v1+ MAY break code using v0; consumers of v0 adapt until v1. Bump past v1 only when necessary; v2+ changes the module path (`module example.com/mymodule/v2`).[^version-numbers]

## Organizing a Go module (layout)

File/package names below are arbitrary; module path assumed `github.com/someuser/modname`.[^mod-layout]

### Basic package

```
project-root-directory/
  go.mod
  modname.go
  modname_test.go
```

- Single module, single package; package name matches the last module path element (`package modname`); import `github.com/someuser/modname`. May split into more files in the same dir (`auth.go`, `hash.go`, …), all `package modname`.[^mod-layout]

### Basic command

```
project-root-directory/
  go.mod
  auth.go
  auth_test.go
  client.go
  main.go
```

- All files `package main`; `main.go` holding `func main` is only a convention. Install: `go install github.com/someuser/modname@latest`.[^mod-layout]

### Package or command with supporting packages

```
project-root-directory/
  internal/
    auth/
      auth.go
      auth_test.go
    hash/
      hash.go
      hash_test.go
  go.mod
  modname.go
  modname_test.go
```

- RECOMMENDED: put supporting packages in `internal/` first — other modules cannot import them, so APIs can be refactored freely. Import: `github.com/someuser/modname/internal/auth`. For a command, root files declare `package main`.[^mod-layout]

### Multiple packages

```
project-root-directory/
  go.mod
  modname.go
  modname_test.go
  auth/
    auth.go
    auth_test.go
    token/
      token.go
      token_test.go
  hash/
    hash.go
  internal/
    trace/
      trace.go
```

- Imports: `github.com/someuser/modname`, `.../auth`, `.../auth/token`, `.../hash`. `internal/trace` is not importable outside the module; keep packages in `internal` as much as possible.[^mod-layout]

### Multiple commands

```
project-root-directory/
  go.mod
  internal/
    ... shared internal packages
  prog1/
    main.go
  prog2/
    main.go
```

- Install: `go install github.com/someuser/modname/prog1@latest`. Convention: place commands in `cmd/` — optional for commands-only repos, very useful in mixed repos.[^mod-layout]

### Packages and commands in the same repository

```
project-root-directory/
  go.mod
  modname.go
  modname_test.go
  auth/
    auth.go
    auth_test.go
  internal/
    ... internal packages
  cmd/
    prog1/
      main.go
    prog2/
      main.go
```

- Import `github.com/someuser/modname` and `.../auth`; install `go install github.com/someuser/modname/cmd/prog1@latest`.[^mod-layout]

### Server project

```
project-root-directory/
  go.mod
  internal/
    auth/
      ...
    metrics/
      ...
    model/
      ...
  cmd/
    api-server/
      main.go
    metrics-analyzer/
      main.go
    ...
  ... the project's other directories with non-Go code
```

- Servers rarely export packages: keep logic in `internal/`, all commands in `cmd/`. If packages become useful to others, split them into separate modules.[^mod-layout]

### Related rules

- `go.mod` only in the module root; subdirectory packages join the module automatically (`example.com/hello/world`) — do not run `go mod init` there.[^blog-using-modules]
- A nested `go.mod` creates a separate module excluded from the parent's zip.[^ref-mod]

## Major version updates and compatibility

### When and how

- Update the major version only when absolutely necessary; decide support policy for old majors, expect to maintain two versions, and remember a new major is a new module path for users.[^major-version]
- Branch strategy: `git checkout -b v2`; change `module example.com/mymodule` → `example.com/mymodule/v2`; update imports `example.com/mymodule/package1` → `example.com/mymodule/v2/package1`.[^major-version]
- Major subdirectory strategy (blog's recommendation while users develop in GOPATH mode; works with non-module-aware tools and lets majors develop together on `master`):[^blog-v2-modules]

```
github.com/googleapis/gax-go @ master branch
/go.mod    → module github.com/googleapis/gax-go
/v2/go.mod → module github.com/googleapis/gax-go/v2
```

```sh
mkdir v2 && cp -v *.go v2
cp go.mod v2/go.mod
go mod edit -module github.com/googleapis/gax-go/v2 v2/go.mod
find . -type f -name '*.go' -exec sed -i -e 's,github.com/my/project,github.com/my/project/v2,g' {} \;
git tag v2.0.0-alpha.1 && git push origin v2.0.0-alpha.1
git tag v2.0.0 && git push origin v2.0.0
```

- v2 packages MUST import `/v2` paths, otherwise v2 depends on v1. Separate-branch strategy risks non-version-aware tools not distinguishing majors when v2+ is on the default branch.[^blog-v2-modules]
- To deprecate an old major: `// Deprecated: use example.com/mod/v2 instead.` above `module`, then tag a release.[^ref-mod]

### Keeping modules compatible ("add, don't change or remove")

- **Functions:** no signature change is backward compatible — even adding a variadic param breaks `var runner func(string) = yourpkg.Run`. Add a new function instead (`Query` → `QueryContext`, old calls new).[^blog-module-compat]
- **Extensible arguments:** config struct (`tls.Dial(network, addr string, config *Config)`; `nil` = defaults), options struct as receiver (`net.ListenConfig.Listen`), or functional options (`grpc.Dial(..., grpc.WithBlock())`). Both are reasonable; functional options bloat namespace and have unclear duplicate semantics; option structs need often-`nil` params.[^blog-module-compat]
- **Interfaces:** adding methods breaks implementers. Define a new interface and type-check dynamically (`archive/tar` checks `io.Seeker`). Prefer returning concrete types from constructors. Add an unexported method (like `testing.TB`'s `private()`) to prevent outside implementations.[^blog-module-compat]
- **Behaviour changes:** add opt-in configuration methods (`json.Decoder.DisallowUnknownFields`).[^blog-module-compat]
- **Structs:** adding an exported field or removing an unexported field is almost always compatible; new fields' zero value MUST preserve old behaviour (`ListenConfig.KeepAlive`). Adding a non-comparable field to a comparable struct breaks `==`/map-key use. Prevent comparison with `type doNotCompare [0]func()` embedded (overkill for pointer-used types; makes the type unusable as map key).[^blog-module-compat]
- Interfaces, function arguments and return values cannot be added to compatibly; if the API needs dramatic change, consider a new major version.[^blog-module-compat]
- Prefer awkward-but-compatible APIs (`strings.ReplaceAll` added in Go 1.12 rather than changing `Replace`).[^blog-publishing-modules]

## Modules blog digest

### Part 1 — Using Go Modules (2019)

- Workflow summary: `go mod init` creates `go.mod`; build/test commands add needed deps (at time of writing); `go list -m all` lists deps (main module first); `go get` changes versions; `go mod tidy` removes unused deps.[^blog-using-modules]
- "Latest" = latest tagged stable, else latest pre-release, else latest untagged. A build has at most one version per module path, but `rsc.io/quote` and `rsc.io/quote/v3` can coexist (semantic import versioning) to allow incremental migration. Build commands can add but not safely remove deps — use `go mod tidy`.[^blog-using-modules]

### Part 2 — Migrating to Go Modules (2019)

- With a prior dependency manager, `go mod init` imports from `Godeps.json`, `Gopkg.lock` etc.; then `go build ./...`, `go test ./...`, `go mod tidy`, audit with `go list -m all`, `go mod why -m`, `go mod graph`, and fix with `go get pkg@version`. Run `go mod tidy` before committing `go.mod`.[^blog-migrating-modules]
- Tests may need fixes: don't write into package dir (module cache is read-only); don't read `../other-module` paths; GOPATH-mode assumptions may need `GO111MODULE=off`. Import paths MUST match the canonical module path (`golang.org/x/lint`, not `github.com/golang/lint`); v2+ imports need `/v2`. If you have existing tags, increment the minor version when adding `go.mod`.[^blog-migrating-modules]

### Part 3 — Publishing Go Modules (2019)

- Start at `v0`; release `v1.0.0` only when API is stable. Keep tagging new releases (users get the greatest semver release even if old). Do NOT delete or overwrite version tags; release a new version for bugs. Next after `v0.1.0`: `v0.2.0` for API additions/breaks/dep minor bumps, `v0.1.1` for fixes. Proxy may take a few minutes to see a new tag.[^blog-publishing-modules]

### Part 4 — v2 and Beyond (2019)

- Breaking changes to v1+ MUST go in a new major version with a new path; gopkg.in `.v2` accepted as a special case; breaking changes in v1+ should always happen in a `vN+1` module.[^blog-v2-modules]

### Part 5 — Keeping Your Modules Compatible (2020)

- Theme: "add, don't change or remove"; plan extensibility from the outset (see compatibility section above).[^blog-module-compat]

### Source notes

- All 16 pages loaded successfully. ref/mod's lexical-elements text lists only `module, go, require, replace, exclude, retract` as keywords while its grammar also includes `tool` and `ignore` (and separately documents `toolchain`, `godebug`); ref/mod also states both "In Go 1.18, `-d` will always be enabled" and "since Go 1.18, it is always enabled".[^ref-mod]
- managing-source diagrams (source hierarchy, single/multi-module repos) are images without textual trees.[^managing-source]

---

<!-- Part 4 — Tools, diagnostics and releases -->

## Release status and support policy

### Current release

- Latest stable release: **go1.27.2, released 2026-10-08**. It has security fixes to the `go` command and to `crypto/tls`, `html/template`, `net/http`, `net/textproto` and `os`, plus bug fixes elsewhere.[^release-history]
- Latest major release: **go1.27.0 (2026-08-19)**. The previous major release is go1.26.0 (2026-02-10).[^release-history]
- Supported majors as of the snapshot: **Go 1.27 and Go 1.26**. Go 1.25 left support when 1.27 shipped.[^release-history]

### Policy

- "Each major Go release is supported until there are two newer major releases." Critical problems, including critical security problems, are fixed in supported releases through minor revisions (for example 1.N.1, 1.N.2).[^release-history]
- The release cycle is six months. The final three months are a feature freeze, when only bug fixes and docs are merged.[^contribute]
- Security releases are pre-announced on golang-announce@googlegroups.com. You SHOULD subscribe.[^security-best-practices]
- gopls follows the same policy: it supports only the two most recent major Go releases for the `go` command on PATH.[^gopls]

### Major releases since go1.18

| Release | Date |
|---|---|
| go1.18 | 2022-03-15 |
| go1.19 | 2022-08-02 |
| go1.20 | 2023-02-01 |
| go1.21.0 | 2023-08-08 |
| go1.22.0 | 2024-02-06 |
| go1.23.0 | 2024-08-13 |
| go1.24.0 | 2025-02-11 |
| go1.25.0 | 2025-08-12 |
| go1.26.0 | 2026-02-10 |
| go1.27.0 | 2026-08-19 |

Starting with go1.21 the first release of a major version is named `go1.N.0`. Source checkout: `git fetch --tags && git checkout go1.27.2`.[^release-history]

## Recent release highlights

### Go 1.27 (August 2026): language

- **Generic methods:** methods can declare their own type parameters, for example `math/rand/v2` `(*Rand) N[Int intType](Int) Int`. Interface methods still cannot have type parameters, and a generic method cannot implement an interface method.[^go1-27]
- **Struct literal keys** may be any valid field selector for the struct type, not only a top-level field name.[^go1-27]
- **Type inference:** a generic function can be inferred wherever it is assigned or converted to a matching function type.[^go1-27]

### Go 1.27: tools

- `compile`, `link`, `asm`, `cgo`, `cover` and `pack` accept `@file` response-file arguments in a GCC-compatible format.[^go1-27]
- go command changes:
  - `bzr` support is removed.
  - Removed `GODEBUG` settings are still accepted in `go.mod` and `//go:debug` only at their final default value.
  - `go test` runs the `stdversion` vet check by default.
  - `go test -json` adds an `OutputType` field (`error`, `error-continue`, `frame`).
  - For modules that declare `go 1.27`, `go mod tidy` consolidates `require` blocks into at most two: direct and indirect.[^go1-27]
- `go doc` accepts `pkg@version`, for example `go doc example.com/pkg@v1.2.3`, and `-ex` lists examples.[^go1-27]
- `go fix` adds the modernizers `atomictypes`, `embedlit`, `slicesbackward` and `unsafefuncs`. `fmtappendf` is removed and `waitgroup` is renamed `waitgroupgo`.[^go1-27]
- gofmt column alignment no longer varies across CPU architectures. Formatted code may get small whitespace changes when gofmt runs again.[^go1-27]
- vet `printf` flags `fmt.Errorf("...: %w", p)` when `p` is a pointer to an error type, because that breaks `errors.Is` and type assertions.[^go1-27]
- `go tool trace -http=:6060` now binds to localhost only. Use `-http=0.0.0.0:6060` to listen on all addresses.[^go1-27]

### Go 1.27: runtime, compiler, linker, ports

- Traceback headers include `runtime/pprof` goroutine labels for modules targeting 1.27 or later. Disable with `GODEBUG=tracebacklabels=0`.[^go1-27]
- The `asynctimerchan` setting is removed, so `time` channels are always unbuffered (synchronous).[^go1-27]
- Size-specialized malloc makes some allocations under 80 bytes up to 30% cheaper, about 1% overall in allocation-heavy programs. It adds about 60 KB to binaries. Opt out with `GOEXPERIMENT=nosizespecializedmalloc`, which is expected to be removed in 1.28.[^go1-27]
- The **`goroutineleak` profile** is now generally available in `runtime/pprof` and at `/debug/pprof/goroutineleak`. It relies on GC reachability, so it can miss leaks that involve globals or the locals of runnable goroutines.[^go1-27]
- Compiler:
  - `//line` filenames resolve relative to the directive's file.
  - Function-literal names are simpler and stay stable regardless of inlining.
  - Identical literals may share code, which matters if you compare function code pointers.[^go1-27]
- Linker: the new `-macos` and `-macsdk` flags set `LC_BUILD_VERSION`.[^go1-27]
- Ports:
  - Darwin requires macOS 13 Ventura or later.
  - `linux/ppc64` (big-endian) moves to the ELFv2 ABI, which needs kernel 3.13 or later.[^go1-27]

### Go 1.27: standard library

| Area | Change |
|---|---|
| `encoding/json/v2`, `encoding/json/jsontext` | New packages. `encoding/json` is now backed by v2, and new options keep v1 behaviour. v2 rejects invalid UTF-8 and duplicate names by default. Opt out with `GOEXPERIMENT=nojsonv2`. |
| `crypto/mldsa` | New. ML-DSA (FIPS 204) post-quantum signatures, also supported in `crypto/x509` and TLS 1.3. |
| `crypto/tls` | `MLKEM1024` key exchange. `Config.Rand` deprecated. New `ConnectionState.LocalCertificate`. |
| `uuid` | New package for generating and parsing UUIDs. |
| `simd`, `simd/archsimd` | Experimental (`GOEXPERIMENT=simd`). Adds vector-size-agnostic types, arm64 NEON and wasm 128-bit. |
| `net/http` | HTTP/2 honours RFC 9218 priorities. New `Server.MaxHeaderValueCount`. HTTP/1 bodies drain on close. |
| `net/http/httptest` | `NewTestServer` uses an in-memory network compatible with `testing/synctest`. |
| `testing/synctest` | New `Sleep` helper. |
| `bytes`, `strings` | New `CutLast`. |
| `math/big` | `Int.Divide` with Trunc, Floor, Round or Ceil rounding. |
| `compress/flate` | Faster. Output can differ from 1.26, which affects zip, gzip, zlib and png. |
| `go/types` | `gotypesalias` removed, so `Alias` nodes are always produced. New `Hasher`. |
| `unicode` | Upgraded to Unicode 17. |

[^go1-27]

### Go 1.26 (February 2026): language and tools

- **`new(expr)`:** the operand of `new` can be an expression that sets the initial value, for example `Age: new(yearsSince(born))`.[^go1-26]
- **Self-referential constraints:** a generic type can refer to itself in its own type parameter list, as in `type Adder[A Adder[A]] interface{ Add(A) A }`.[^go1-26]
- **`go fix` rewritten** as the home of the "modernizers":
  - It includes a source-level inliner driven by `//go:fix inline` directives.
  - It is built on the same analysis framework as `go vet`.
  - The old obsolete fixers were removed.
  - The fixers are not meant to change program behaviour.[^go1-26]
- `go mod init` writes `go 1.(N-1).0`, so Go 1.26 writes `go 1.25.0`. Raise the version afterwards with `go get go@version`.[^go1-26]
- `go tool doc` (`cmd/doc`) is removed. Use `go doc`, which takes the same flags.[^go1-26]
- The pprof `-http` web UI defaults to the flame graph view. The graph view moved to View -> Graph or `/ui/graph`.[^go1-26]

### Go 1.26: runtime, compiler, bootstrap, ports

- **Green Tea GC** is on by default. It cuts GC overhead by 10–40% in GC-heavy programs, and by about another 10% on newer amd64 CPUs through vector instructions. Opt out with `GOEXPERIMENT=nogreenteagc`, which was slated for removal in 1.27.[^go1-26]
- Baseline cgo call overhead dropped by about 30%. Heap base address randomization is on for 64-bit platforms; opt out with `GOEXPERIMENT=norandomizedheapbase64`.[^go1-26]
- The goroutine leak profile was experimental in this release (`GOEXPERIMENT=goroutineleakprofile`).[^go1-26]
- The compiler stack-allocates slice backing stores in more cases. Disable with `-gcflags=all=-d=variablemakehash=n`.[^go1-26]
- Bootstrapping 1.26 needs Go 1.24.6 or later.[^go1-26]
- Ports:
  - `windows/arm` (32-bit) is removed.
  - `linux/riscv64` gains the race detector.
  - `freebsd/riscv64` is marked broken.
  - s390x gains register ABI.
  - wasm always uses signext and satconv, and `GOWASM` ignores them.[^go1-26]

### Go 1.26: standard library

- New `crypto/hpke` (RFC 9180).[^go1-26]
- Experimental `simd/archsimd` and `runtime/secret`.[^go1-26]
- Post-quantum hybrid TLS key exchanges (`SecP256r1MLKEM768`, `SecP384r1MLKEM1024`) are on by default.[^go1-26]
- Crypto functions ignore caller-supplied random sources. Use `testing/cryptotest.SetGlobalRandom` for deterministic tests.[^go1-26]
- New `errors.AsType`, a generic and type-safe form of `errors.As`.[^go1-26]
- `io.ReadAll` is about 2x faster.[^go1-26]
- New `log/slog.NewMultiHandler`.[^go1-26]
- `reflect` adds iterator methods: `Type.Fields`, `Type.Methods`, `Value.Fields` and others.[^go1-26]
- `testing` adds `T/B/F.ArtifactDir`, used with `go test -artifacts`, and `B.Loop` no longer prevents inlining.[^go1-26]
- `net/url.Parse` rejects colons in the host.[^go1-26]
- `ServeMux` trailing-slash redirects use 307.[^go1-26]
- `ReverseProxy.Director` is deprecated in favour of `Rewrite`.[^go1-26]
- `image/jpeg` was replaced, so bit-exact output may change.[^go1-26]

## The go command

### Philosophy

- The go command builds Go packages **without makefiles or configuration**. It uses only the information in source files: import paths and directory layout. It is not a general build tool.[^go-command-article]
- Its conventions:
  - Import paths derive from repository URLs, for example `github.com/golang/glog`.
  - One directory holds one package.
  - Packages are built from source information only.[^go-command-article]
- It never generates source during a build. Generated files come from `go generate` before the build and SHOULD be checked in.[^go-command-article]
- The article describes the GOPATH-era layout (`$GOPATH/src`, `bin`, `pkg`, with `$HOME/go` as the default). Current Go uses modules.[^go-command-article]

### Command index

| Command | Purpose |
|---|---|
| `go bug` | Start a bug report |
| `go build` | Compile packages and dependencies |
| `go clean` | Remove object and cached files (`-cache`, `-testcache`, `-modcache`, `-fuzzcache`) |
| `go doc` | Show documentation for a package or symbol |
| `go env` | Print Go environment information (`-json`, `-changed`, `-w NAME=VALUE`, `-u NAME`) |
| `go fix` | Apply fixes suggested by static checkers (`-diff`, `-fixtool=prog`) |
| `go fmt` | Run `gofmt -l -w` on packages |
| `go generate` | Run `//go:generate` directives |
| `go get` | Add dependencies to the current module (`-t`, `-u`, `-u=patch`, `-tool`, `@version`, `@none`) |
| `go install` | Compile and install to GOBIN |
| `go list` | List packages or modules (`-f`, `-json`, `-m`, `-deps`, `-test`, `-u`, `-versions`) |
| `go mod` | `download`, `edit`, `graph`, `init`, `tidy`, `vendor`, `verify`, `why` |
| `go run` | Compile and run a main package (`-exec xprog`) |
| `go telemetry` | Telemetry mode: `off`, `local`, or `on` (uploads to telemetry.go.dev) |
| `go test` | Test packages |
| `go tool` | Run a builtin or go.mod-declared tool (`-n`) |
| `go version` | Print the Go version (`-m` shows a binary's module info) |
| `go vet` | Report likely mistakes |
| `go work` | Workspace maintenance: `edit`, `init`, `sync`, `use`, `vendor` |

[^cmd-go]

- Most tools run as `go <tool>` and operate on whole packages. `go tool <name>` runs the binary with unmodified arguments, which is mostly useful for debugging.[^cmd-index]
- `pprof` is reachable only through `go tool pprof`. `gofmt` is installed as a standalone binary and has more options than `go fmt`.[^cmd-index]

### Build flags (shared by build, clean, get, install, list, run, test)

| Flag | Meaning |
|---|---|
| `-C dir` | Change to dir first. MUST be the first flag. |
| `-o file/dir` | Output path |
| `-a` | Force rebuild |
| `-n` / `-x` | Print commands without running them / print commands as they run |
| `-p n` | Parallel programs (default GOMAXPROCS) |
| `-v` / `-work` | Print package names / keep the work directory |
| `-race`, `-msan`, `-asan` | Race detector / memory sanitizer / address sanitizer |
| `-cover`, `-covermode`, `-coverpkg` | Coverage instrumentation |
| `-asmflags`, `-gcflags`, `-gccgoflags`, `-ldflags` | Arguments for the tools; can be scoped with `pattern=args` |
| `-buildmode` | `archive`, `c-archive`, `c-shared`, `default`, `shared`, `exe`, `pie`, `plugin` |
| `-buildvcs` | Stamp VCS info (`auto`, `true`, `false`) |
| `-compiler` | `gc` or `gccgo` |
| `-json` | Emit `BuildEvent` JSON (`ImportPath`, `Action`, `Output`) |
| `-mod` | `readonly`, `vendor`, or `mod` |
| `-modcacherw`, `-modfile` | Leave the module cache writable; use an alternate go.mod |
| `-overlay file.json` | Replace or hide files during the build |
| `-pgo` | Profile path, `auto` (default), or `off` |
| `-tags a,b` | Extra build tags |
| `-trimpath` | Remove filesystem paths from binaries |
| `-toolexec prog` | Wrap toolchain invocations |
| `-linkshared`, `-pkgdir`, `-installsuffix` | Shared-library linking and install-location options |

[^cmd-go]

### go install, go get, go mod, go work

- `go install pkg@version` (for example `@latest`) runs in module-aware mode and ignores the current go.mod.[^cmd-go]
  - The arguments MUST be main packages from the same module at the same version.
  - Standard packages, meta-patterns and file paths are not allowed.
  - Vendor directories are not used.
  - Binaries go to GOBIN, which defaults to `$GOPATH/bin` or `$HOME/go/bin`.
- `go mod init [path]` creates go.mod. `go mod tidy` adds missing modules, removes unused ones and updates go.sum. Its flags are `-e`, `-v`, `-diff` (non-zero exit if there are changes), `-go=` and `-compat=`.[^cmd-go]
- go.work lists modules with `use` directives. Its `replace` overrides module replaces. `go work sync` pushes the workspace build list (MVS) back into each module. `go work use -r` adds modules recursively.[^cmd-go]
- The default proxy and checksum database are `proxy.golang.org` and `sum.golang.org`. VCS fetches are governed by `GOVCS`, which defaults to `public:git|hg,private:all`. Proxy downloads are always allowed.[^cmd-go]

### Tool directives and go tool

- `go get -tool pkg` adds a `tool` directive to go.mod. `go tool <name>` runs it.[^cmd-go]
  - A tool can be named by its full package path, or by its last path element without the major-version suffix if that name is unique.
  - The `tool` package pattern expands to all declared tools.

### go generate

- The directive form is `//go:generate command arg...`, with no space after `//`. Quoted arguments use Go syntax. `//go:generate -command alias args...` defines an alias for the rest of the file.[^cmd-go]
- It is **never run automatically** by `go build` or `go test`; it "must be run explicitly". Flags are `-run`/`-skip` (regex on directive text), `-v`, `-n` and `-x`.[^cmd-go]
- Expanded variables: `$GOARCH`, `$GOOS`, `$GOFILE`, `$GOLINE`, `$GOPACKAGE`, `$GOROOT`, `$DOLLAR` and `$PATH`.[^cmd-go]
- Generated files SHOULD contain a line matching `^// Code generated .* DO NOT EDIT\.$` before the first non-comment, non-blank text.[^cmd-go]

### go vet, go fix, go fmt, go doc

- `go vet` runs cmd/vet.[^cmd-go]
  - `-c N` shows context lines.
  - `-json` emits JSON.
  - `-fix` applies suggested fixes.
  - `-diff` prints the fixes and exits non-zero if there are any.
  - `-vettool=prog` uses an alternative analyzer built on x/tools unitchecker.
- `go fix` runs cmd/fix, which holds the modernizers from 1.26 onwards. `-diff` previews the changes, and `go tool fix help` lists the fixers.[^cmd-go][^go1-26]
- `go fmt` is `gofmt -l -w` and prints the files it modified.[^cmd-go]
- `go doc` forms are `go doc`, `go doc <pkg>`, `go doc <sym>[.<method|field>]`, `go doc [<pkg>.]<sym>[.<m>]` and `go doc <pkg> <sym>[.<m>]`.[^cmd-go]
  - Example: `go doc json.Number`.
  - Flags: `-all`, `-c`, `-cmd`, `-ex`, `-http`, `-short`, `-src`, `-u`.
  - Lowercase letters match either case, and uppercase letters match exactly.

### Build constraints

- The syntax is `//go:build <expr>`, using `&&`, `||`, `!` and parentheses, for example `//go:build cgo && (linux || darwin)`. The go command stops scanning at the first line that is neither blank nor a `//` comment.[^cmd-go]
- Satisfied tags are:
  - GOOS and GOARCH
  - `unix` on Unix-like systems
  - the compiler (`gc` or `gccgo`)
  - `cgo` when cgo is enabled
  - release tags `go1.1` through the current version
  - architecture feature tags such as `amd64.v2`
  - `-tags` values
  - `race` under `-race`[^cmd-go][^race-detector]
- File-name suffixes `_GOOS`, `_GOARCH` and `_GOOS_GOARCH` add implicit constraints. For example, `source_windows_amd64.go` builds only on windows/amd64. `android` matches `linux`, `illumos` matches `solaris`, and `ios` matches `darwin`.[^cmd-go]
- By convention, `//go:build ignore` excludes a file, and `purego` selects pure-Go implementations. The old `// +build` form (Go 1.16 and earlier) is rewritten by gofmt.[^cmd-go]
- In modules declaring go 1.21 or later, a go-version term in a file's constraint sets that file's minimum language version.[^cmd-go]

### Architecture feature variables

| GOARCH | Variable | Values |
|---|---|---|
| amd64 | `GOAMD64` | v1 (default), v2, v3, v4 |
| arm64 | `GOARM64` | v8.0 (default) to v8.9, v9.0 to v9.5, optional `,lse` `,crypto` |
| arm | `GOARM` | 5, 6, 7, optional `,softfloat` or `,hardfloat` |
| 386 | `GO386` | sse2 (default), softfloat |
| ppc64/le | `GOPPC64` | power8 (default), power9, power10 |
| riscv64 | `GORISCV64` | rva20u64 (default), rva22u64, rva23u64 |
| mips/64 | `GOMIPS`/`GOMIPS64` | hardfloat (default), softfloat |
| wasm | `GOWASM` | satconv, signext |

[^cmd-go]

### Key environment variables

| Variable | Purpose |
|---|---|
| `GOOS` / `GOARCH` | Target platform |
| `GOFLAGS` | Default flags. Space-separated, each written as `-flag=value`. |
| `GO111MODULE` | `on`, `off`, or `auto` |
| `GOBIN` / `GOPATH` | Install directory / module cache and binary defaults |
| `GOCACHE` | Build cache, `go-build` under the user cache directory by default |
| `GOPROXY`, `GOPRIVATE`, `GONOSUMDB`, `GOSUMDB`, `GOAUTH` | Module fetching and authentication. `GOPRIVATE` implies NOPROXY and NOSUMDB. |
| `GOTOOLCHAIN` | Toolchain selection |
| `GOWORK` | Workspace file. `off` disables workspace mode. |
| `GOEXPERIMENT` | Toolchain experiments |
| `CGO_ENABLED`, `CGO_*FLAGS[_ALLOW/_DISALLOW]` | cgo control |
| `GOFIPS140` | FIPS 140 mode (default `off`) |
| `GODEBUG` | Runtime debug settings. Cannot be set via `go env -w`. |
| `GOCOVERDIR` | Output directory for `-cover` binaries |
| `GOENV`, `GOTMPDIR`, `GOCACHEPROG`, `GOVCS` | Config file location, temp directory, external cache program, VCS policy |

[^cmd-go]

### Package patterns and caches

- `./...` matches the current directory and everything below it.[^go-command-article][^cmd-go]
  - `...` skips `vendor`, `testdata`, directories whose names start with `_` or `.`, and nested modules, unless they are named explicitly.
  - Reserved names: `work`, `tool`, `all`, `std`, `cmd`.
- Code under an `internal` directory is importable only from the tree rooted at its parent.[^cmd-go]
- Build cache:[^cmd-go]
  - Clear it with `go clean -cache`.
  - It does not detect changes to C libraries used via cgo.
  - Debug it with `GODEBUG=gocacheverify=1`, `gocachehash=1` or `gocachetest=1`.

## Testing, benchmarks, examples and fuzzing

### Test functions and files

- Tests live in `*_test.go` files.[^cmd-go]
  - `func TestXxx(t *testing.T)`: Xxx MUST NOT start with a lowercase letter.
  - `func BenchmarkXxx(b *testing.B)`
  - `func FuzzXxx(f *testing.F)`
- Examples (`ExampleXxx`):[^cmd-go]
  - A trailing `// Output:` comment must match stdout exactly.
  - `// Unordered output:` ignores line order.
  - An empty `Output:` expects no output.
  - An example with no output comment is compiled but not run.
- Example naming:[^cmd-go]
  - `ExampleT_M` documents a method.
  - A `_suffix` with a lowercase first letter allows several examples per identifier.
  - A whole file is shown as one example when it has exactly one example function, at least one other declaration, and no tests, benchmarks or fuzz tests.
- Files in package `<name>_test` form a separate external package that sees only exported identifiers.[^cmd-go]
- `testdata/` holds fixtures and is ignored by package patterns. The test binary runs in the package source directory.[^cmd-go]
  - Tests MUST NOT write into the module unless the user asks, because the module may be read-only in the module cache.
  - Fuzzing is the exception: it writes `testdata/fuzz`.

### Modes and caching

- **Local directory mode** runs `go test` with no package arguments. It never caches.[^cmd-go]
- **Package list mode** runs `go test ./...` or `go test pkg`.[^cmd-go]
  - It caches successful results and prints `(cached)` in place of the elapsed time.
  - It prints full output only for failures, or when `-v` or `-bench` is given.
- Caching applies only when every flag is cacheable. The cacheable flags are `-benchtime`, `-coverprofile`, `-cpu`, `-failfast`, `-fullpath`, `-list`, `-outputdir`, `-parallel`, `-run`, `-short`, `-skip`, `-timeout` and `-v`. **`-count=1` is the idiomatic way to disable caching**. `go clean -testcache` clears the cache.[^cmd-go]
- Before the tests, `go test` runs these vet checks: atomic, bools, buildtag, directive, errorsas, ifaceassert, nilfunc, printf, stdversion, stringintconv and tests. `-vet=off` disables them, and `-vet=all` runs every check.[^cmd-go]
- Other flags:[^cmd-go]
  - `-c` compiles `pkg.test` without running it.
  - `-o` saves the binary.
  - `-exec xprog` runs the binary through a wrapper.
  - `-args` passes the remaining arguments to the binary unchanged.
- When you run a compiled test binary directly, flags take a `test.` prefix, for example `-test.v`.[^cmd-go]

### Test flags

| Flag | Meaning |
|---|---|
| `-run re` / `-skip re` | Select or exclude tests. Slashes separate subtest levels. |
| `-bench re` | Run benchmarks. None run by default. `-bench .` runs all. |
| `-benchtime t\|Nx` | Default 1s. `Nx` runs exactly N iterations. |
| `-benchmem` | Report allocation statistics |
| `-count n` | Repeat tests, benchmarks and fuzz seeds n times (examples run once) |
| `-cpu 1,2,4` | Run once for each GOMAXPROCS value |
| `-parallel n` | Max parallel tests in one binary (default GOMAXPROCS) |
| `-failfast` | Stop starting new tests after the first failure |
| `-short` | Ask long tests to shorten |
| `-shuffle off\|on\|N` | Randomize order. The seed is printed. |
| `-timeout d` | Panic after d (default 10m). 0 disables it. |
| `-list re` | List matching tests without running them |
| `-json` | Machine-readable output |
| `-fullpath` | Full file names in errors |
| `-fuzz re` | Must match exactly one package in the main module and exactly one fuzz test |
| `-fuzztime t\|Nx` | Default: run indefinitely |
| `-fuzzminimizetime t\|Nx` | Default 60s |
| `-artifacts` | Save test artifacts to `-outputdir` |
| `-cpuprofile`, `-memprofile`, `-memprofilerate`, `-blockprofile`, `-blockprofilerate`, `-mutexprofile`, `-mutexprofilefraction`, `-trace` | Profiling. Leaves `pkg.test` behind for analysis. |

[^cmd-go]

### Fuzzing

- Native fuzzing is built into the toolchain since Go 1.18. It is coverage-guided, and OSS-Fuzz supports Go fuzz tests.[^fuzzing]
- Rules for a fuzz test:[^fuzzing]
  - It is named `FuzzXxx`, takes only `*testing.F`, returns nothing, and lives in a `_test.go` file.
  - It MUST contain exactly one fuzz target: `f.Fuzz(func(t *testing.T, args...) {...})`.
  - Seed corpus entries come from `f.Add` and from `testdata/fuzz/FuzzXxx`. They MUST match the fuzz arguments in type and order.
- Allowed argument types: `string`, `[]byte`, the signed and unsigned integer types, `float32`, `float64` and `bool`.[^fuzzing]
- Targets SHOULD be fast and deterministic. They run in parallel in nondeterministic order, so they MUST NOT keep state between calls or depend on global state.[^fuzzing]
- Plain `go test` runs the seed corpus as unit tests. `go test -fuzz=FuzzName` fuzzes. Coverage instrumentation is available on AMD64 and ARM64. `-cpu` has no effect while fuzzing, and `-parallel` sets the number of fuzzing workers.[^fuzzing]
- Failures:[^fuzzing]
  - Causes: a panic, `t.Fail/Error/Fatal`, `os.Exit`, a stack overflow, or an execution longer than 1s.
  - The minimized failing input is written to `testdata/fuzz/FuzzName/` and becomes a regression test. Commit it with the fix.
- Corpus file format: the first line is `go test fuzz v1`, then one typed value per line, for example `[]byte("...")` or `int64(5)`. The generated corpus lives in `$GOCACHE`. The `file2fuzz` tool in x/tools converts files into corpus entries.[^fuzzing]

## Coverage

- Unit-test coverage uses `go test -cover` and `-coverprofile=c.out`, which implies `-cover`.[^cmd-go]
  - `-covermode` is `set` (default), `count`, or `atomic`. The default becomes `atomic` under `-race`.
  - `-coverpkg=patterns` extends instrumentation to other packages.
- **Integration coverage (Go 1.20 and later):** build with `go build -cover -o app .`, then run with `GOCOVERDIR=dir ./app`.[^build-cover]
  - Each run writes one `covcounters.*` file. `covmeta.*` is written once per build.
  - If `GOCOVERDIR` is unset, the binary warns and emits no data.
- By default only main-module packages are instrumented. Use `-coverpkg` with import paths, not package names: `-coverpkg=main` matches nothing.[^build-cover]
- Reporting:[^build-cover]

```sh
go tool covdata percent -i=dir1,dir2 [-pkg=pattern]
go tool covdata textfmt -i=dir -o profile.txt   # legacy format
go tool cover -func=profile.txt ; go tool cover -html=profile.txt
go tool covdata merge -i=a,b -o merged
```

- Coverage data is written only when the program calls `os.Exit` or returns from `main.main`. An unrecovered panic or a fatal signal loses that run's data.[^build-cover]

## Doc comments

### Placement and content

- A doc comment sits **immediately before** a top-level `package`, `const`, `func`, `type` or `var` declaration, with no blank line in between. Every exported name SHOULD have one, written in complete sentences.[^doc-comments]
- **Package comment:** starts with `Package <name> ...`. Only one file SHOULD carry it; if several do, they are concatenated.[^doc-comments]
- **Command comment:** describes program behaviour and starts with the capitalized program name ("Gofmt formats Go programs."). Usage text is indented.[^doc-comments]
- **Type comment:** says what an instance represents. It states any concurrency guarantees beyond the default of single-goroutine use, and documents the zero value if its meaning is not obvious.[^doc-comments]
- **Func and method comment:** says what the function returns or does.[^doc-comments]
  - Name parameters directly, without backquotes.
  - Write "reports whether" for booleans and leave out "or not".
  - Document special cases.
  - Don't describe the algorithm.
  - Top-level functions are assumed safe for concurrent use; methods are not, unless documented.
- **Const and var comment:** a group can have one doc comment plus end-of-line comments. An ungrouped const or var needs a full sentence.[^doc-comments]
- **Deprecation:** a paragraph starting with `Deprecated:` that names the alternative. It does not need to be the last paragraph. pkg.go.dev hides deprecated docs, and tools warn on use.[^doc-comments]
- **Notes:** `MARKER(uid): body`, where MARKER is two or more uppercase letters (TODO, BUG). They render in their own section.[^doc-comments]

### Syntax

| Element | Rule |
|---|---|
| Paragraph | Unindented, non-blank lines. gofmt keeps line breaks, so semantic linefeeds are fine. ``` `` ``` renders as “ and `''` renders as ”. |
| Heading (Go 1.19 and later) | `# Text`. Unindented, single line, with blank lines around it. `#Text` is not a heading. gofmt rewrites the old implicit headings (a single-line paragraph without punctuation). |
| Link | A target block of `[Text]: URL` lines. `[Text]` in the comment links to it. gofmt moves targets to the end. Plain URLs auto-link. |
| Doc link | `[Name]`, `[Name.Method]`, `[pkg]`, `[pkg.Name]`, `[*bytes.Buffer]`. A pkg is treated as a full path only if it is std or its first element has a dot. It must be bounded by punctuation, space or line ends. |
| List | Indented lines starting with `*`, `+`, `-` or `•`, or with `1.` or `1)`. Items hold paragraphs only: no code and no nesting. gofmt normalizes bullets to `  - ` and numbered items to ` 1. `, with continuations indented 4 spaces. |
| Code block | Indented lines that do not start with a list marker. gofmt indents them with one tab and adds blank lines around them. |
| Directive | Lines matching `//(line \|extern \|export \|[a-z0-9]+:[a-z0-9])` (such as `//go:generate`) are not doc text. gofmt moves them to the end. The tool name `go` is reserved. |

[^doc-comments]

### Common mistakes

- Indenting a wrapped prose line turns it into a code block, so unindent it. A wrapped line of a list item or code block MUST stay indented.[^doc-comments]
- Nested lists are flattened. Rewrite the text, or alternate numbered and bullet markers. A blank line separates paragraph text from a list or code that gofmt's heuristic merged wrongly.[^doc-comments]

## Diagnostics: profiling, tracing, debugging

### Categories and caveats

- There are four categories: **profiling** (costs and hot spots), **tracing** (latency across a call or request), **debugging** (pause and inspect), and **runtime statistics and events**.[^diagnostics]
- The tools interfere with each other. For example, memory profiling skews CPU profiles. Collect one profile at a time.[^diagnostics]
- Production profiling is OK, but measure its overhead first. A good pattern is to periodically profile a random replica for X seconds every Y seconds.[^diagnostics]

### Profiles

| Profile | Shows |
|---|---|
| `cpu` | Time actively on CPU |
| `heap` | Allocation samples, for current or historical use and leaks |
| `threadcreate` | Code that creates OS threads |
| `goroutine` | Stacks of all goroutines |
| `block` | Blocking on sync primitives. Off by default; enable with `runtime.SetBlockProfileRate`. |
| `mutex` | Lock contention. Off by default; enable with `runtime.SetMutexProfileFraction`. |
| `goroutineleak` | Goroutines blocked forever. GA in 1.27. |

[^diagnostics][^go1-27]

- Collect profiles with `go test` flags, `runtime/pprof`, or `net/http/pprof` (served at `/debug/pprof/...`). The handlers can be mounted on a custom mux, for example `mux.HandleFunc("/custom_debug_path/profile", pprof.Profile)`.[^diagnostics]
- `go tool pprof` views: text (top), graph, weblist (annotated source), flame graph and callgrind. Linux `perf` and macOS Instruments also work.[^diagnostics]

### Profiling workflow example

- Add a `-cpuprofile` flag, then call `pprof.StartCPUProfile(f)` and `defer pprof.StopCPUProfile()`. Samples are taken about 100 times per second.[^profiling-blog]
- In `go tool pprof`:[^profiling-blog]
  - `top10` shows the top functions; `top5 -cum` sorts by cumulative time.
  - `list FUNC` shows per-line counts; `disasm` shows disassembly.
  - `web` draws the call graph; `--nodefraction=0.1` hides small nodes.
  - `--inuse_objects` counts allocations instead of bytes.
  - `pprof.WriteHeapProfile` writes a memory profile.
- The blog's case study went from 25.2s to 2.29s. The changes were maps replaced by slices, map-as-set replaced by slices, and allocation caching. Lesson: watch how much garbage inner loops generate.[^profiling-blog]

### Tracing and runtime stats

- Execution tracer: `runtime/trace` plus `go tool trace` record scheduling, syscall, GC and heap events.[^diagnostics]
  - Good for parallelization and latency problems.
  - Not for finding CPU or memory hot spots; profile first for those.
- Distributed tracing needs manual spans propagated via `context.Context`. `golang.org/x/net/trace` and `httptrace.ClientTrace` exist for this.[^diagnostics]
- Runtime APIs:[^diagnostics]
  - `runtime.ReadMemStats`
  - `debug.ReadGCStats`
  - `debug.Stack`
  - `debug.WriteHeapDump`, which suspends all goroutines
  - `runtime.NumGoroutine`
- `GODEBUG` diagnostic settings:[^diagnostics]
  - `gctrace=1`: one line per GC
  - `inittrace=1`: package init time and allocations
  - `schedtrace=X`: scheduler events every X ms
  - `cpu.all=off` or `cpu.<ext>=off`: disable instruction-set extensions

### Debugging builds

- Disable optimizations with `go build -gcflags=all="-N -l"`. Alternatively keep them and add `-gcflags="-dwarflocationlists=true"`.[^diagnostics]
- Delve is the Go-aware debugger; GDB has limits. Core dumps can be debugged with either.[^diagnostics]

## Garbage collector tuning

### Model

- Go's GC is a **tracing, mark-sweep, non-moving, concurrent** collector. Brief stop-the-world pauses still occur.[^gc-guide]
- Values the compiler can't prove are stack-bound **escape** to the heap, and escaping is transitive. Escape analysis changes between releases.[^gc-guide]
- Cost model:[^gc-guide]
  - The GC spends physical memory and CPU.
  - Memory = the previous live heap plus new allocation before mark.
  - CPU = a fixed per-cycle cost plus a per-byte cost times the live heap. Pointer-heavy structures cost more.
  - GC frequency sets the time/space trade-off.

### GOGC

- Formula: `target heap = live heap + (live heap + GC roots) * GOGC/100`. The default is 100. GC roots (stacks and globals) have counted since Go 1.18. The minimum total heap target is 4 MiB.[^gc-guide]
- **Doubling GOGC roughly doubles heap overhead and halves GC CPU.**[^gc-guide]
- Set it with `GOGC=200 ./prog` or `debug.SetGCPercent(200)`, which returns the previous value. `GOGC=off` or `SetGCPercent(-1)` disables proportional GC.[^gc-guide]

### GOMEMLIMIT (Go 1.19 and later)

- It is a soft limit on total runtime memory. Set it with `GOMEMLIMIT=512MiB` or `debug.SetMemoryLimit(512<<20)`.[^gc-guide]
- It is measured as `Sys - HeapReleased`. `GOGC=off` with a limit lets the heap grow to the limit.[^gc-guide]
- Live memory near the limit causes thrashing, a "death spiral". The GC therefore caps itself at about **50% CPU** over a `2×GOMAXPROCS` CPU-second window, so a misconfigured limit costs at most about a 2x slowdown, and memory can exceed the limit.[^gc-guide]
- You SHOULD use it for containerized services you control, with 5–10% headroom. You can adjust it at runtime.[^gc-guide]
- You SHOULD NOT use it:[^gc-guide]
  - with `GOGC=off` when memory is shared with co-tenants
  - for CLI or desktop tools whose input size is unknown
  - to dodge OOM when the program is already near its environment's limit

### Latency and identifying cost

- Pauses scale mainly with GOMAXPROCS, not heap size. Marking uses 25% of CPU.[^gc-guide]
- Latency sources: STW pauses, scheduling delays, assists, write barriers and root scanning. Reducing GC frequency usually reduces latency too.[^gc-guide]
- Signs of GC cost in CPU profiles:[^gc-guide]
  - `runtime.gcBgMarkWorker`
  - `runtime.mallocgc` above about 15% cumulative means heavy allocation
  - `runtime.gcAssistAlloc` above about 5% means the application is outpacing the GC
- `GODEBUG=gctrace=1` and `gcpacertrace=1` give more detail.[^gc-guide]
- Judge memory footprint by RSS, not VSS. The runtime never unmaps memory; it releases physical pages instead.[^gc-guide]

### Eliminating heap allocations

- Reducing the allocation rate usually pays off most. Use `go tool pprof -sample_index=alloc_space heap.prof`. Of the views `inuse_objects`, `inuse_space`, `alloc_objects` and `alloc_space`, `alloc_space` is usually best for GC cost.[^gc-guide]
- `go build -gcflags=-m=3 ./pkg` explains escape decisions. The same data is available as editor (gopls) annotations and as JSON.[^gc-guide]
- Implementation-specific tweaks: apply them only where profiles show they matter.[^gc-guide]
  - Pointer-free values are segregated, so dropping pointers or using indices helps.
  - Scanning stops at the last pointer, so put pointer fields first.
- Transparent huge pages (THP): the guide recommends `defrag=defer` or `defer+madvise` and `khugepaged/max_ptes_none=0`. `GODEBUG=disablethp=1` is a workaround.[^gc-guide]

### Finalizers, cleanups, weak pointers

- Prefer deterministic cleanup (`Close`) for non-memory resources. **Prefer `runtime.AddCleanup` to `runtime.SetFinalizer`** (Go 1.24 and later). Finalizers resurrect objects and delay cycles.[^gc-guide]
- A cleanup function or its argument MUST NOT make the object reachable. There is no order, and cleanups may run concurrently. A long-running cleanup should start a goroutine. `runtime.GC` queues cleanups but doesn't wait for them.[^gc-guide]
- `weak.Pointer.Value()` can return nil at any time, so always check it.[^gc-guide]
- Keep these mechanisms out of public APIs; `unique` shows the encapsulation pattern.[^gc-guide]
- To test them: don't run in parallel, call `runtime.GC`, block on a signal channel, and use `-race`.[^gc-guide]

## Profile-guided optimization

- PGO arrived in Go 1.20. `-pgo=auto` has been the default since 1.21. It takes **CPU pprof** profiles. As of 1.22, gains are about 2–14%, mainly from inlining and similar hot-path decisions.[^pgo]
- `default.pgo` in the **main package directory** is picked up automatically. `-pgo=path` applies one profile to *all* mains in that build, so build each binary separately. `-pgo=off` disables PGO.[^pgo]
- You SHOULD commit the profile, because it is a build input. Prefer representative production profiles, for example `curl -o cpu.pprof "http://host:port/debug/pprof/profile?seconds=30"`. Microbenchmarks are poor sources.[^pgo]
- Merge profiles with `go tool pprof -proto a.pprof b.pprof > merged.pprof`. Merging sums samples, so collect profiles of equal duration.[^pgo]
- Workflow: release without PGO, collect production profiles, rebuild with them, and repeat. Two-stage builds are usually unnecessary.[^pgo]
- Source stability:[^pgo]
  - Samples are matched by line offset within a function.
  - Edits inside hot functions, renames and moves to another package lose matches gracefully. Refresh profiles regularly.
- FAQ:[^pgo]
  - PGO covers std and dependencies.
  - An unrepresentative profile shouldn't slow hot code.
  - Profiles work across GOOS/GOARCH.
  - Builds are slower the first time, then cached.
  - Binaries get slightly larger.
- Non-pprof sources such as `perf` need conversion: symbolized, with inlined frames, and with `Function.start_line` set.[^pgo]

## Race detector

- Usage: `go test -race`, `go run -race`, `go build -race` and `go install -race`. It finds only races on executed paths, so run realistic workloads too.[^race-detector]
- Reports start with `WARNING: DATA RACE` and include the stacks of the conflicting accesses and of the goroutine creation sites.[^race-detector]
- It is based on ThreadSanitizer and has existed since Go 1.1. It reports no false positives, so treat every report seriously.[^race-blog]
- Recommended: run load and integration tests with `-race`. A race-enabled instance in a production pool is an option.[^race-blog]

| GORACE option | Default | Meaning |
|---|---|---|
| `log_path` | stderr | Write to `log_path.<pid>` |
| `exitcode` | 66 | Exit status after a race |
| `strip_path_prefix` | "" | Trim file paths |
| `history_size` | 1 | History of `32K * 2**history_size` per goroutine |
| `halt_on_error` | 0 | Exit on the first race |
| `atexit_sleep_ms` | 1000 | Sleep before exit |

[^race-detector]

- Exclude code from race builds with the `race` build tag (`!race`).[^race-detector]
- Typical races and fixes:[^race-detector]
  - A closure captures a loop counter: pass it as a parameter.
  - An outer `err` is shared: use `:=` inside the goroutine.
  - An unprotected global map: add a mutex.
  - A primitive flag: use `sync/atomic`.
  - Send and close on the same channel: receive before closing.
- Requirements and cost:[^race-detector]
  - cgo must be enabled, and non-Darwin systems need a C compiler.
  - Windows needs mingw-w64 runtime v8 or later (Go 1.21 and later).
  - Memory grows 5–10x and time 2–20x.
  - Each `defer` and `recover` allocates an extra 8 bytes that are kept until the goroutine exits.
- Platforms: linux/amd64, ppc64le, arm64, s390x and loong64; freebsd/amd64; netbsd/amd64; darwin/amd64 and arm64; windows/amd64. Go 1.26 added linux/riscv64.[^race-detector][^go1-26]

## Debugging with GDB (and Delve)

- **Delve is the better choice** for Go. GDB "does not understand Go programs well", and fixing that is "not a priority". GDB is useful for cgo code and runtime work.[^gdb]
- Useful build flags:[^gdb]
  - `-gcflags=all="-N -l"` disables optimization.
  - `-ldflags=-w` omits DWARF.
  - `-ldflags=-compressdwarf=false` produces uncompressed DWARF for old GDB versions. DWARF has been compressed since 1.11.
  - Set `GOTRACEBACK=crash` to get core dumps.
- Go extensions in `runtime-gdb.py`:[^gdb]
  - `p $len(x)`, `p $cap(x)`, `p $dtype(x)` and `iface x`
  - `info goroutines` and `goroutine N bt`
  - Pretty printers for strings, slices, maps, channels and interfaces
- Quote qualified names, for example `'regexp.(*Regexp).String'`. Shadowed variables get numeric suffixes.[^gdb]
- If the script doesn't load automatically, run `source $GOROOT/src/runtime/runtime-gdb.py`. A typical flow is `go test -c`, then `gdb pkg.test -d $GOROOT`, then `b 'pkg.TestX'`, then `run`.[^gdb]

## Assembler quick guide

- The assembler uses Plan 9 syntax but is semi-abstract: instruction selection partly happens after codegen. To view output, use `go tool compile -S x.go`, `go build -gcflags -S`, or `go tool objdump -s main.main x.exe`.[^asm]
- Pseudo-registers:[^asm]
  - `FP` holds arguments, which MUST be named: `x+0(FP)`.
  - `SP` is the virtual stack pointer for locals, with negative offsets: `x-8(SP)`.
  - `SB` holds globals; `foo<>(SB)` is file-local.
  - `PC` is the program counter.
- Symbols use `·` (U+00B7) and `∕` (U+2215), for example `math∕rand·Int`. Write `·Name` for the current package. Instructions, registers and directives are uppercase.[^asm]
- `TEXT pkg·fn(SB),NOSPLIT,$framesize-argsize`. Without NOSPLIT, the argument size is required. The last instruction must be a jump, usually `RET`.[^asm]
- `DATA sym+off(SB)/width, $val` and `GLOBL sym(SB), RODATA, $size`. DATA offsets must increase.[^asm]
- `#include "textflag.h"` provides the flags:[^asm]
  - `NOSPLIT`, `RODATA`, `NOPTR`, `DUPOK`
  - `WRAPPER`, `NEEDCTXT`, `TLSBSS`, `NOFRAME`, `TOPFRAME`, `LOCAL`
  - `NOPROF`, which is deprecated
- `#include "go_asm.h"` provides `const_name`, `type__size` and `type_field` offsets. Use these instead of hard-coding layouts.[^asm]
- GC rules:[^asm]
  - Pointer-containing symbols MUST be defined in Go.
  - Assembly functions need a Go prototype, and `go vet` checks their frames.
  - Call `GO_RESULTS_INITIALIZED` after zeroing pointer results.
  - Use `NO_LOCAL_POINTERS` for frames that make calls.
- Emit unsupported opcodes with `BYTE`/`WORD`. `PCALIGN $n` works on arm64, amd64, ppc64, loong64 and riscv64.[^asm]
- Architecture notes:[^asm]
  - arm: R10 holds g.
  - arm64: R18_PLATFORM, R27 and R28 are reserved; R29 is FP and R30 is LR.
  - amd64: BP is callee-save.

## Cgo

- `import "C"` is a pseudo-package. The comment **immediately above** it is the C preamble. C names are accessed as `C.name`, and results need Go conversions, for example `int(C.random())`.[^cgo-blog][^cmd-cgo]
- Strings:[^cgo-blog][^cmd-cgo]
  - `C.CString` and `C.CBytes` allocate with malloc, so you MUST free them: `defer C.free(unsafe.Pointer(cs))`, with `<stdlib.h>` included.
  - `C.GoString`, `C.GoStringN` and `C.GoBytes` copy C data into Go values.
- `#cgo` directives set CFLAGS, CPPFLAGS, CXXFLAGS, FFLAGS and LDFLAGS. They can be build-constrained, can use `pkg-config:`, and expand `${SRCDIR}`. Only a restricted set of flags is allowed by default.[^cmd-cgo]
- cgo is on for native builds and off when cross-compiling or when no C compiler is found. `CGO_ENABLED` overrides this.[^cmd-cgo]
- Type mappings:[^cmd-cgo]
  - `C.struct_x` and `C.sizeof_T` are available.
  - `void*` becomes `unsafe.Pointer`.
  - A call can return `errno` as a second value. Check the main result first.
- `//export` makes a Go function callable from C. A file with exports MAY contain only declarations in its preamble, not definitions.[^cmd-cgo][^cgo-blog]
- **Pointer passing rules:**[^cmd-cgo]
  - Go memory passed to C is pinned for the duration of the call. C MAY keep a Go pointer only while the memory is pinned (`runtime.Pinner`). Strings, slices and channels can't be pinned.
  - Memory passed to C MUST NOT contain pointers to unpinned Go memory.
  - Checks: `GODEBUG=cgocheck=1` is the default and `0` disables them. `GOEXPERIMENT=cgocheck2` enables full checking.
  - Use `runtime/cgo.Handle` to pass Go values to C.
- `#cgo noescape fn` and `#cgo nocallback fn` speed up calls. Misuse corrupts memory or panics.[^cmd-cgo]

## gopls

- gopls ("Go please") is the official Go LSP server. It provides navigation, completion, diagnostics, analysis and refactoring for VS Code, Vim/Neovim, Emacs, Helix, Zed, Sublime and other editors.[^gopls]
- Install with `go install golang.org/x/tools/gopls@latest`, then restart running instances (`killall gopls` on UNIX). VS Code installs it automatically.[^gopls]
- Version support:[^gopls]
  - Building gopls needs Go 1.21 or later.
  - At runtime it supports the two most recent major Go versions of the `go` on PATH.
  - It analyzes source of any Go version, guided per file by the go.mod `go` directive and `//go:build` tags.
- Settings are exposed through the editor. gopls inherits the editor's environment. It supports module, multi-module and GOPATH modes. Only the `go` build system is supported; Bazel needs a go/packages driver.[^gopls]
- Releases follow semver: minor releases about every three months and patch releases about monthly.[^gopls]

## Vulnerability management

- Run `govulncheck` on code and binaries. It is backed by the Go vulnerability database at `vuln.go.dev`. Integrate it into CI, using `-json` for other systems.[^security-best-practices]
- Keep Go updated to the latest minor version, and update dependencies after review and testing.[^security-best-practices]
- Also fuzz, run `go test -race`, run `go vet ./...`, and subscribe to golang-announce.[^security-best-practices]
- Workflow:[^govulncheck-tutorial]

```sh
go install golang.org/x/vuln/cmd/govulncheck@latest
govulncheck ./...                      # from the module root
go get golang.org/x/text@v0.3.8        # upgrade to a fixed version
govulncheck ./...                      # expect "No vulnerabilities found."
```

- govulncheck flags a vulnerability as affecting you only when your code reaches the vulnerable symbol, and it shows the call stacks. Vulnerable modules that you don't call appear as informational. Details are at `https://pkg.go.dev/vuln/<ID>`. Fix by upgrading or by no longer using the symbol.[^govulncheck-tutorial]

## Contributing to Go

- One-time setup:[^contribute]
  - Sign the Google CLA (individual or corporate).
  - Generate a googlesource password.
  - Register at go-review.googlesource.com.
  - Install the review tool: `go install golang.org/x/review/git-codereview@latest`. `go-contrib-init` automates the setup.
- Process:[^contribute]
  - Open or find an issue first.
  - Language, library and tool changes go through the proposal process.
  - Report security issues only to security@golang.org.
- Flow:[^contribute]
  - Keep one commit per branch.
  - `git codereview change` creates or amends the commit and adds `Change-Id:`; don't edit that line.
  - Test with `./all.bash`, or `go test ./...` in x/ repos.
  - `git codereview mail` uploads to Gerrit.
  - GitHub PRs are mirrored to Gerrit by GerritBot.
- Commit messages:[^contribute]
  - The first line is `pkg: lowercase summary`. It completes "This change modifies Go to ___" and is not a full sentence.
  - Then a blank line and a plain-text body wrapped at about 72 columns.
  - Use `Fixes #N` or `Updates #N`. In x/ repos use `Fixes golang/go#N`.
- Submission requires:[^contribute]
  - Code-Review +2 from a maintainer
  - no Hold votes
  - two Google employees involved
  - TryBots run by maintainers
- Changes land by cherry-pick. New files get the "Copyright YYYY The Go Authors" BSD header; don't update years in existing files.[^contribute]

---

<!-- Part 5 — Databases and standard-library articles -->

## Database access (database/sql)

### Scope and alternatives

- `database/sql` is the standard-library package for relational databases; Go supports MySQL, Oracle, Postgres, SQL Server, SQLite and more, with drivers listed on the SQLDrivers wiki page.[^db-index]
- Higher-level ORM libraries (GORM, ent) and NoSQL drivers (MongoDB, Couchbase) exist outside the standard library.[^db-index]
- Pick the function that matches the operation: `QueryRow` for at most one row (avoids the overhead of an `sql.Rows` holding one row), `Query` for many rows, `Exec` for `INSERT`/`UPDATE`/`DELETE`.[^db-index]

### Drivers and opening a handle

- Workflow: locate a driver, open a handle, confirm a connection.[^db-open-handle]
- When you call no driver functions directly, use a blank import: `import _ "github.com/go-sql-driver/mysql"`.[^db-open-handle]
- Best practice: avoid the driver's own API for database operations and use `database/sql` functions, so code stays loosely coupled to the DBMS.[^db-open-handle]

| Constructor | Input | Use when |
|---|---|---|
| `sql.Open(driverName, dsn)` | connection string; format varies by driver | ordinary connection-string setup[^db-open-handle] |
| `sql.OpenDB(connector)` | a `driver.Connector` (e.g. `mysql.NewConnector(&cfg)`) | driver-specific connection features not expressible in a DSN[^db-open-handle] |

- Both return `*sql.DB`. Building the DSN from a structured driver config (e.g. MySQL `mysql.NewConfig()` + `cfg.FormatDSN()`) is more readable than a hand-written string.[^db-open-handle][^db-tutorial]
- An error from `sql.Open` is **not** a connection error: it means the handle could not be initialised, e.g. the DSN could not be parsed.[^db-open-handle]
- `sql.Open` may not connect immediately (driver-dependent); call `Ping`/`PingContext` to confirm a connection can be established.[^db-open-handle][^db-tutorial]
- Credentials SHOULD stay out of Go source; one approach is to load them into environment variables (perhaps from a secret manager) and read with `os.Getenv`.[^db-open-handle]
- The tutorial uses a global `db` only for simplicity; in production avoid the global, e.g. pass the handle to functions or wrap it in a struct.[^db-tutorial]

### sql.DB is a pool

- `sql.DB` represents a connection pool: you do not open/close connections explicitly; the handle opens and closes them for you.[^db-open-handle]
- `sql.DB` is safe for concurrent use by multiple goroutines; `Query`/`Exec` take a connection from the pool (creating one if needed) and return it when done.[^db-connections]
- You still MUST free resources you obtain, such as `sql.Rows` and `sql.Stmt`, typically with `defer x.Close()`.[^db-open-handle]

### Executing statements that don't return rows

- Use `Exec`/`ExecContext` for `INSERT`, `DELETE`, `UPDATE`; use `Query*` when rows might be returned.[^db-change-data]
- `Exec` returns `(sql.Result, error)`; when the error is nil, `Result` gives `LastInsertId()` or the number of rows affected.[^db-change-data]

```go
result, err := db.Exec("INSERT INTO album (title, artist) VALUES (?, ?)", alb.Title, alb.Artist)
if err != nil { return 0, fmt.Errorf("AddAlbum: %v", err) }
id, err := result.LastInsertId()
```

| Receiver | Methods | Scope |
|---|---|---|
| `DB` | `Exec`, `ExecContext` | single statement in isolation[^db-change-data] |
| `Tx` | `Exec`, `ExecContext` | inside a transaction[^db-change-data] |
| `Stmt` | `Exec`, `ExecContext` | already-prepared statement[^db-change-data] |
| `Conn` | `ExecContext` | reserved connection[^db-change-data] |

The same four receivers exist for `QueryRow[Context]` and `Query[Context]` (Conn has only the Context variants).[^db-querying]

### Querying

- `QueryRow` returns at most one `Row`; if the query yields multiple rows, `Scan` discards all but the first.[^db-querying]
- `QueryRow` itself returns no error; `Scan` reports the combined lookup+scan error and returns `sql.ErrNoRows` when no row matched. Replace `ErrNoRows` with more specific text (e.g. "no such album").[^db-querying][^db-tutorial]

```go
if err := db.QueryRow("SELECT (quantity >= ?) from album where id = ?", q, id).Scan(&enough); err != nil {
    if err == sql.ErrNoRows { /* not found */ }
}
```

- Multi-row pattern: `rows, err := db.Query(...)`; `defer rows.Close()`; `for rows.Next() { rows.Scan(&a, &b) }`; then check `rows.Err()`.[^db-querying]
- Deferring `rows.Close()` releases resources however the function returns; exhausting the loop also closes implicitly, but `defer` is better.[^db-querying]
- You MUST check `rows.Err()` after the loop: if the query failed, it is the only way to learn the results are incomplete.[^db-querying][^db-tutorial]
- `Scan` takes pointers to Go values and writes column values through them.[^db-tutorial]

### Nullable columns, conversions, multiple result sets

- For possibly-NULL columns scan into `sql.NullBool`, `NullFloat64`, `NullInt32`, `NullInt64`, `NullString`, `NullTime`; each has a `Valid` field plus a value field.[^db-querying]

```go
var s sql.NullString
err := db.QueryRow("SELECT name FROM customer WHERE id = ?", id).Scan(&s)
name := "Valued Customer"
if s.Valid { name = s.String }
```

- All drivers support a base set of conversions (e.g. SQL `INT` to Go `int`); some extend it. `Scan` also converts to a good-fit type, e.g. a numeric `VARCHAR` into `int` via `strconv.Atoi`.[^db-querying]
- Multiple result sets: after the first `rows.Next()` loop, call `rows.NextResultSet()` (returns whether another set exists), loop again, then check `rows.Err()` once.[^db-querying]

### Prepared statements

- A prepared statement is SQL parsed and saved by the DBMS, typically with placeholders and no values; reuse avoids re-creating the statement each time.[^db-prepared]
- `Stmt.Exec`/`QueryRow`/`Query` take only the parameter values, not SQL text.[^db-prepared]

| Creator | Result |
|---|---|
| `DB.Prepare`, `DB.PrepareContext` | statement executed in isolation, outside a transaction[^db-prepared] |
| `Tx.Prepare`, `Tx.PrepareContext` | statement from SQL text for a specific transaction[^db-prepared] |
| `Tx.Stmt`, `Tx.StmtContext` | converts a `DB.Prepare` result into a for-this-transaction `Stmt`[^db-prepared] |
| `Conn.PrepareContext` | statement on a reserved `sql.Conn`[^db-prepared] |

- You MUST call `stmt.Close()` when finished; it releases database resources such as underlying connections. For local statements, `defer stmt.Close()` suffices.[^db-prepared]

### Transactions

- Obtain an `sql.Tx` with `DB.Begin` or `DB.BeginTx`; `Tx` runs its operations on a single connection and exposes `Exec*`, `Query*`, `QueryRow*`, `Prepare*`, `Stmt*`.[^db-transactions]
- End with exactly one of `Commit` or `Rollback`. If `Commit` fails, discard all `Query`/`Exec` results from the `Tx` as invalid. Even if `Rollback` fails, the transaction is no longer valid and was not committed.[^db-transactions]
- MUST NOT issue transaction SQL (`BEGIN`, `COMMIT`) directly; it can leave the database in an unpredictable state, especially in concurrent programs.[^db-transactions]
- While a transaction is open, MUST NOT call non-transaction `sql.DB` methods for related work: they run outside the transaction, giving an inconsistent view or even deadlocks.[^db-transactions]
- Pattern: `defer tx.Rollback()` right after `BeginTx`; after a successful `Commit` the deferred rollback is a no-op.[^db-transactions]

```go
tx, err := db.BeginTx(ctx, nil)
if err != nil { return fail(err) }
defer tx.Rollback()
// tx.QueryRowContext / tx.ExecContext ...
if err = tx.Commit(); err != nil { return fail(err) }
```

### Cancellation and timeouts

- Every operation has a `...Context` variant taking `context.Context`, used to set a timeout/deadline or propagate cancellation (e.g. client disconnect) so resources are freed.[^db-index][^db-cancel]
- Derive with `context.WithTimeout`/`WithDeadline`; a derived context is cancelled when its parent is. Passing an HTTP request's `Context()` stops the query if the request is cancelled or the timeout elapses.[^db-cancel]
- Always `defer cancel()` for the returned cancel function; it releases resources held by the new context.[^db-cancel]

```go
queryCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
defer cancel()
rows, err := db.QueryContext(queryCtx, "SELECT * FROM album")
```

### Managing connections

- Most programs need not change pool defaults. Observe effects with `DB.Stats`.[^db-connections]

| Setter | Effect | Default / caution |
|---|---|---|
| `SetMaxOpenConns` | limits open connections; extra operations wait | default: new connection whenever all are busy; a limit acts like a lock/semaphore and can deadlock[^db-connections] |
| `SetMaxIdleConns` | max idle connections retained | default 2; raise to avoid reconnects under heavy parallelism[^db-connections] |
| `SetConnMaxIdleTime` | close connections idle longer than d | default: idle connections stay until reused; pair with raised MaxIdle to release after bursts[^db-connections] |
| `SetConnMaxLifetime` | max time a connection is held open | default unlimited; useful behind load-balanced DB servers[^db-connections] |

- Dedicated connection: `DB.Conn` returns `sql.Conn`, with `BeginTx`, `ExecContext`, `PingContext`, `PrepareContext`, `QueryContext`, `QueryRowContext` bound to that one connection. You MUST release it with `Conn.Close`.[^db-connections]
- Use `sql.Conn` when a sequence must run on the same connection and `sql.Tx` is a poor fit, e.g. DDL with its own transaction semantics, or locking operations that create temporary tables.[^db-index]

### SQL injection

- Pass parameter values as `sql` function arguments; the package builds a prepared statement and sends values separately from the SQL text.[^db-sql-injection][^db-tutorial]
- MUST NOT assemble SQL with `fmt.Sprintf` or similar: a caller could inject e.g. `1 OR 1=1` and return all rows.[^db-sql-injection][^db-change-data]
- Placeholder syntax varies by DBMS/driver: MySQL driver uses `?`; the pq Postgres driver uses `$1`. (The pages document only these two forms; consult your driver for others.)[^db-sql-injection]

```go
rows, err := db.Query("SELECT * FROM user WHERE id = ?", id)               // correct
rows, err := db.Query(fmt.Sprintf("SELECT * FROM user WHERE id = %s", id)) // SECURITY RISK
```

### Pitfalls

| Pitfall | Correct approach |
|---|---|
| Treating `sql.Open` success as a live connection | Call `Ping`/`PingContext`[^db-open-handle] |
| Forgetting `rows.Close()` / `stmt.Close()` | `defer` Close right after error check[^db-querying][^db-prepared] |
| Skipping `rows.Err()` | Check after the `Next` loop[^db-querying] |
| Expecting an error from `QueryRow` | Error (incl. `ErrNoRows`) comes from `Scan`[^db-querying] |
| Scanning NULL into `string` | Use `sql.NullString` etc.[^db-querying] |
| `BEGIN`/`COMMIT` in SQL text | Use `BeginTx`/`Commit`/`Rollback`[^db-transactions] |
| Calling `db.*` inside an open Tx | Use `tx.*` methods[^db-transactions] |
| Not calling `cancel` | `defer cancel()`[^db-cancel] |
| `SetMaxOpenConns` too low | Can deadlock waiting for connections[^db-connections] |
| Credentials in source | Load from environment/secret store[^db-open-handle] |

## Context

### The Context interface

- A `Context` carries a deadline, cancellation signal and request-scoped values across API boundaries; its methods are safe for simultaneous use by multiple goroutines.[^blog-context][^pkg-context]

| Method | Meaning |
|---|---|
| `Done() <-chan struct{}` | closed when the context is cancelled or times out; functions SHOULD abandon work and return[^blog-context] |
| `Err() error` | why it was cancelled, after `Done` closes: `Canceled` or `DeadlineExceeded`[^blog-context][^pkg-context] |
| `Deadline() (time.Time, bool)` | lets functions decide whether to start work; usable for I/O timeouts[^blog-context] |
| `Value(key) any` | request-scoped data; values must be safe for concurrent use[^blog-context] |

- `Context` has no `Cancel` method (and `Done` is receive-only) because the receiver of a cancellation signal is usually not the sender; sub-operations should not cancel the parent.[^blog-context]

### Derivation and cancellation

- Derived contexts form a tree; cancelling a context cancels all its descendants. `Background()` is the never-cancelled root, used in main, init, tests and as the top-level context for incoming requests.[^blog-context][^pkg-context]
- `WithCancel`, `WithDeadline`, `WithTimeout` return a child plus a `CancelFunc`. Calling it cancels the child and its children, removes the parent's reference and stops timers. Failing to call it leaks the child until the parent is cancelled; `go vet` checks CancelFuncs are used on all control-flow paths.[^pkg-context]
- Code SHOULD call cancel as soon as operations in that context complete. A CancelFunc does not wait for work to stop; it may be called concurrently, and calls after the first do nothing.[^pkg-context]
- `WithTimeout(parent, d)` is `WithDeadline(parent, time.Now().Add(d))`; if the parent's deadline is earlier, the child is semantically the parent.[^pkg-context]
- `WithCancelCause`/`WithDeadlineCause`/`WithTimeoutCause` record a cause retrievable via `Cause(ctx)`; without a cause, `Cause` equals `ctx.Err()`.[^pkg-context]
- `WithoutCancel(parent)` is not cancelled with the parent and has no Deadline/Err. `AfterFunc(ctx, f)` runs `f` in its own goroutine after ctx is cancelled; the returned `stop` disassociates it.[^pkg-context]

### Propagation rules

- Incoming requests SHOULD create a Context, outgoing calls SHOULD accept one, and the call chain MUST propagate it (optionally replacing it with a derived one).[^pkg-context]
- MUST NOT store Contexts in a struct; pass explicitly as the first parameter, typically named `ctx`: `func DoSomething(ctx context.Context, arg Arg) error`.[^pkg-context]
- MUST NOT pass a nil Context; use `context.TODO()` when unsure or not yet plumbed.[^pkg-context]
- Use context Values only for request-scoped data that transits processes and APIs, not for optional function parameters.[^pkg-context]
- Google requires a `Context` as the first argument on every function on the call path between incoming and outgoing requests.[^blog-context]

### Value keys

- Keys MUST be comparable and SHOULD NOT be `string` or any built-in type; define your own key type. Keys often use concrete type `struct{}` to avoid allocation; exported key variables should have pointer or interface static type.[^pkg-context]
- Pattern: an unexported key type plus typed accessor functions hide the mapping.[^blog-context]

```go
type key int
const userIPKey key = 0
func NewContext(ctx context.Context, ip net.IP) context.Context { return context.WithValue(ctx, userIPKey, ip) }
func FromContext(ctx context.Context) (net.IP, bool) { ip, ok := ctx.Value(userIPKey).(net.IP); return ip, ok }
```

- To honour cancellation in blocking work, `select` on `ctx.Done()` versus the result channel, wait for the worker to finish, and return `ctx.Err()`; `req.WithContext(ctx)` attaches a context to an HTTP request.[^blog-context]

## JSON (encoding/json and json/v2)

### Status

- `encoding/json/v2` was introduced in Go 1.27 as a major revision of `encoding/json`. `encoding/json` is covered by the Go 1 compatibility promise and will never go away; migration is optional.[^jsonv2-migration]
- The JSON tutorial is now written against `encoding/json/v2`, described as a cleaner API with better defaults.[^json-tutorial]
- The two packages interoperate: a type implementing v2 `MarshalerTo` is honoured by v1 `json.Marshal`, and new struct tags introduced in Go 1.27 are also supported by v1.[^jsonv2-migration]
- Note: neither page mentions a `GOEXPERIMENT` flag, nor `omitempty`/`omitzero` tag options; consult the package docs for those.[^jsonv2-migration][^json-tutorial]

### v2 API

| Function | Signature |
|---|---|
| `Marshal` | `func Marshal(in any, opts ...Options) ([]byte, error)`[^json-tutorial] |
| `Unmarshal` | `func Unmarshal(in []byte, out any, opts ...Options) error`[^json-tutorial] |
| `MarshalWrite` | `func MarshalWrite(out io.Writer, in any, opts ...Options) error`[^json-tutorial] |
| `UnmarshalRead` | `func UnmarshalRead(in io.Reader, out any, opts ...Options) error`[^json-tutorial] |

- `MarshalWrite`/`UnmarshalRead` stream to/from `io.Writer`/`io.Reader` without an intermediate `[]byte`, replacing the need for a v1 `json.Encoder`.[^json-tutorial][^jsonv2-migration]
- Other v2 additions: `Marshalers` overrides marshaling for types you don't control; `MatchCaseInsenstiveNames` controls case sensitivity of name matching.[^jsonv2-migration]

### Encoding rules

- Only exported struct fields are encoded.[^json-tutorial]
- Pointers encode as their pointee, or `null` if nil.[^json-tutorial]
- Map keys must encode as JSON strings (e.g. `map[string]T`).[^json-tutorial]
- Channel, complex and function types cannot be encoded; cyclic structures are unsupported.[^json-tutorial]
- `time.Time` encodes as an RFC 3339 string, e.g. `"2011-01-25T00:00:00Z"`.[^json-tutorial]

### Decoding rules

- For JSON key `"Foo"`, `Unmarshal` prefers an exported field tagged `json:"Foo"`, then an exported field named `Foo`.[^json-tutorial]
- Only fields found in the destination are decoded; unknown JSON keys are ignored and unexported destination fields are untouched.[^json-tutorial]
- Into `any`, objects become `map[string]any`, arrays `[]any`, booleans `bool`, numbers `float64`, strings `string`, null `nil`; inspect with type assertions/switches.[^json-tutorial]
- `Unmarshal` allocates reference types (pointers, slices, maps) as needed; absent fields leave pointers nil, enabling "receiver" structs like `struct{ Cmd *Command; Msg *Message }` where the non-nil field identifies the message.[^json-tutorial]

### Custom marshaling (v2)

- Implement `MarshalerTo` (`MarshalJSONTo(*jsontext.Encoder) error`) and `UnmarshalerFrom` (`UnmarshalJSONFrom(*jsontext.Decoder) error`); use `json.MarshalEncode`/`json.UnmarshalDecode` inside, and `dec.PeekKind()` to validate, returning `&json.SemanticError{JSONKind: k}` on mismatch.[^json-tutorial]

```go
func (v Version) MarshalJSONTo(enc *jsontext.Encoder) error {
    return json.MarshalEncode(enc, fmt.Sprintf("%d.%d.%d", v.Major, v.Minor, v.Patch))
}
```

### v1 to v2 behaviour differences

| Situation | v1 | v2 |
|---|---|---|
| Invalid UTF-8 in a string | silently replaced with U+FFFD | error[^jsonv2-migration] |
| Duplicate object names | permitted | error[^jsonv2-migration] |
| nil slice / nil map | `null` | `[]` / `{}`[^jsonv2-migration] |
| Structural type errors (e.g. malformed tag) | never reported at runtime | runtime error[^jsonv2-migration] |
| `string` tag on invalid type (e.g. struct) | ignored | error (suppressible via `ReportErrorsWithLegacySemantics`; better to drop the tag)[^jsonv2-migration] |

- Simple calls are source-compatible: switching `import "encoding/json"` to `"encoding/json/v2"` compiles; the hard part is behaviour change, so migration MUST involve careful testing.[^jsonv2-migration]
- Every divergence is covered by an `Options` value. `jsonv1.DefaultOptionsV1()` gives full v1 behaviour via the v2 API; later options override earlier ones, e.g. `json.Marshal(v, jsonv1.DefaultOptionsV1(), json.FormatNilSliceAsNull(false))`. v1 `Marshal`/`Unmarshal` are themselves implemented this way.[^jsonv2-migration]

### Migration strategies

| Risk tolerance | Strategy |
|---|---|
| High / simple app | All-at-once: switch call sites, run tests, set compatibility options for any breakage[^jsonv2-migration] |
| Low / troubleshooting | Option-by-option: move to v2 with `DefaultOptionsV1`, then disable v1 options one at a time (also bisects breakages)[^jsonv2-migration] |
| Production servers | `github.com/go-json-experiment/jsonsplit`[^jsonv2-migration] |

- jsonsplit procedure: switch call sites to `jsonsplit`, set `CallBothButReturnV1`, optionally `AutoDetectOptions`, wire `ReportDifference` to logs/metrics; monitor; fix differences via options or types; switch to `OnlyCallV2` or `CallBothButReturnV2`; finally replace jsonsplit with `encoding/json/v2` and revisit kept v1 options.[^jsonv2-migration]
- Calling both roughly doubles marshal cost (`AutoDetectOptions` more); limit with `SetMarshalCallRatio`. A reported difference indicates potential, not certain, downstream breakage.[^jsonv2-migration]

## Gob (encoding/gob)

- Gob is a Go-specific, binary, self-describing encoding for Go-to-Go communication; no IDL or protocol compiler, the type itself drives encoding via reflection. It is deliberately not designed for other languages.[^blog-gob]
- Self-describing: a stream read from the start contains enough information to parse it with no prior knowledge.[^blog-gob]
- Avoids protocol-buffer features: top-level values need not be structs; no required fields; no default values (zero values are simply not sent).[^blog-gob]

### Value rules

- Integers are sent as sizeless variable-length numbers (signed vs unsigned distinct); a receiver may decode into any integer type that fits, otherwise an error.[^blog-gob]
- Pointers are flattened: `int8`, `*int8`, `**int8` all transmit as an integer and may be decoded into any pointer depth.[^blog-gob]
- Only exported fields are encoded; zero-valued fields are not sent. Struct fields are matched by name and compatible type; only fields present in both are affected, so types can evolve by adding fields.[^blog-gob]
- Floats are sent as IEEE 754 bit patterns, byte-reversed.[^blog-gob]
- Custom encodings: implement `GobEncoder`/`GobDecoder` (analogous to JSON `Marshaler`/`Unmarshaler`).[^blog-gob]

### Wire types and performance

- The first time a type is sent, its description is sent with a type number; subsequent values are prefixed by that number, enabling recursive types such as trees.[^blog-gob]
- The encoder compiles a per-type machine (and decoder a per wire-type x Go-type machine) using reflection once, then encodes without reflection. As of Go 1.4, gob no longer uses `unsafe`.[^blog-gob]

```go
enc := gob.NewEncoder(&network); dec := gob.NewDecoder(&network)
err := enc.Encode(P{3, 4, 5, "Pythagoras"}) // P{X,Y,Z int; Name string}
var q Q; err = dec.Decode(&q)               // Q{X,Y *int32; Name string}
```

- `net/rpc` builds on gob for method calls across the network.[^blog-gob]

## Reflection (laws of reflection)

### Background

- Every variable has exactly one static type. An interface variable stores a (value, concrete type) pair, never (value, interface type); the static interface type limits which methods are callable.[^blog-reflection]
- `interface{}` (alias `any`) is satisfied by every value. Interfaces are statically typed, not dynamically typed.[^blog-reflection]

### The three laws

| Law | API |
|---|---|
| 1. Reflection goes from interface value to reflection object | `reflect.TypeOf(i any) Type`, `reflect.ValueOf`[^blog-reflection] |
| 2. Reflection goes from reflection object to interface value | `v.Interface()` (inverse of `ValueOf`, result static type `interface{}`)[^blog-reflection] |
| 3. To modify a reflection object, the value must be settable | `v.CanSet()`, `p.Elem()`, `SetFloat`/`SetInt`/...[^blog-reflection] |

- Getters/setters use the largest type: `Int()` returns `int64`, `SetInt` takes `int64`, `Uint()` returns `uint64`; convert as needed.[^blog-reflection]
- `Kind` describes the underlying type, not the static type: a `MyInt` has `Kind() == reflect.Int`; only `Type` distinguishes them.[^blog-reflection]
- `fmt` now unpacks a `reflect.Value` automatically, so `fmt.Println(v)` prints the concrete value.[^blog-reflection]

### Settability

- `reflect.ValueOf(x)` wraps a copy, so `v.SetFloat(7.1)` panics: `reflect.Value.SetFloat using unaddressable value`.[^blog-reflection]
- To modify `x`, pass a pointer and indirect: the pointer `Value` itself is not settable, its `Elem()` is.[^blog-reflection]

```go
var x float64 = 3.4
v := reflect.ValueOf(&x).Elem() // settable
v.SetFloat(7.1)                 // x is now 7.1
```

- Struct fields: `s := reflect.ValueOf(&t).Elem()`, iterate `s.NumField()`/`s.Field(i)`, names from `s.Type().Field(i).Name`. Only exported fields are settable; built from `t` instead of `&t`, field setters fail.[^blog-reflection]
- Reflection is powerful but subtle; use with care and avoid unless strictly necessary.[^blog-reflection]

## Image and image/draw

### Colors and models (image/color)

- `color.Color` has `RGBA() (r, g, b, a uint32)` returning alpha-premultiplied values with 16-bit range [0, 0xFFFF] in `uint32` so blend multiplications don't overflow.[^blog-image]
- `color.RGBA` is 8-bit premultiplied (scaled by 0x101 to 16-bit); `color.NRGBA` is 8-bit non-premultiplied (as PNG uses), but its `RGBA()` returns premultiplied values.[^blog-image]
- `color.Model` converts colors (`Convert(c Color) Color`), possibly lossily, e.g. `GrayModel`; `Palette []Color` maps to a limited palette.[^blog-image]

### Geometry

- `image.Point{X, Y}` is a grid co-ordinate (x right, y down), not a pixel. `image.Rectangle{Min, Max}`; `image.Rect(x0,y0,x1,y1)` shorthand.[^blog-image]
- Rectangles are inclusive at top-left, exclusive at bottom-right (`p.In(r)` iff `r.Min.X <= p.X < r.Max.X`, same for Y); often non-zero origin. `Add` translates, `Intersect` may yield empty, `Dx`/`Dy`/`Size` give dimensions. Points and Rectangles pass by value cheaply.[^blog-image]

### Images

- `image.Image` interface: `ColorModel()`, `Bounds()`, `At(x, y)`. Bounds MUST NOT be assumed to start at (0,0) (e.g. animated GIF frames); iterate from `b.Min` to `b.Max`.[^blog-image]

```go
b := m.Bounds()
for y := b.Min.Y; y < b.Max.Y; y++ { for x := b.Min.X; x < b.Max.X; x++ { doStuffWith(m.At(x, y)) } }
```

- `image.Uniform{C}` is an enormous single-colour image. Slice-backed types (`image.RGBA`, `image.Gray`) have `Pix`, `Stride`, `Rect`; pixel (x,y) of RGBA starts at `Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*4]`. `Set(x, y, c)` writes one pixel.[^blog-image]
- `SubImage` shares the backing array (writes affect the original). Ranging over `Pix` can touch pixels outside bounds; `At`/`Set`/`image/draw` clip to bounds.[^blog-image]
- Formats: decode known formats directly (`jpeg.Decode`, `png.Encode`); `image.Decode` detects formats registered at run time, typically by underscore-importing a format package (e.g. `_ "image/jpeg"`).[^blog-image]

### image/draw

- One operation: draw src onto dst through an optional mask, `dst = (src IN mask) OP dst`; a nil mask equals an infinite fully opaque mask.[^blog-imagedraw]
- Operators: `draw.Over` (layer source over destination) and `draw.Src` (copy source ignoring destination). For opaque src and mask they are equivalent but `Src` is usually faster.[^blog-imagedraw]
- `Draw(dst, r, src, sp, op)` = `DrawMask` with nil mask; `DrawMask(dst, r, src, sp, mask, mp, op)`. `r` is in dst space; `sp`/`mp` align with `r.Min`; the effective rectangle is clipped to every image's bounds. dst must implement `draw.Image` (adds `Set`).[^blog-imagedraw]

| Task | Call |
|---|---|
| Fill | `draw.Draw(dst, r, &image.Uniform{c}, image.ZP, draw.Src)`[^blog-imagedraw] |
| Clear to transparent | `draw.Draw(m, m.Bounds(), image.Transparent, image.ZP, draw.Src)`[^blog-imagedraw] |
| Copy `sr` to `dp` | `draw.Draw(dst, sr.Sub(sr.Min).Add(dp), src, sr.Min, draw.Src)`[^blog-imagedraw] |
| Scroll (overlap OK) | `draw.Draw(m, b, m, b.Min.Add(p), draw.Src)`[^blog-imagedraw] |
| Convert to RGBA | `m := image.NewRGBA(image.Rect(0,0,b.Dx(),b.Dy())); draw.Draw(m, m.Bounds(), src, b.Min, draw.Src)`[^blog-imagedraw] |
| Glyph / mask | `draw.DrawMask(dst, mr.Sub(mr.Min).Add(p), src, image.ZP, mask, mr.Min, draw.Over)`[^blog-imagedraw] |

- Decoded images may not be RGBA: GIF gives `image.Paletted`, JPEG gives YCbCr, PNG depends on data.[^blog-imagedraw]
- `DrawMask` type-asserts common concrete types for fast paths and falls back to generic `At`/`Set`; output is identical either way.[^blog-imagedraw]

---

## Quick decision table

| Question | Answer |
|----------|--------|
| Where does `go.mod` go? | At the module root, normally the repository root[^mod-layout] |
| Where do non-public helper packages go? | `internal/`, which other modules cannot import[^mod-layout] |
| How do I add a dependency? | `go get example.com/pkg@version`, then `go mod tidy`[^managing-deps] |
| How do I develop several local modules together? | `go work init` / `go work use` (a `go.work` workspace)[^tut-workspaces] |
| How do I release v2? | New module path suffix `/v2` (major branch or major subdirectory), then tag `v2.x.y`[^major-version][^ref-mod] |
| Error or panic? | Error, unless the program cannot continue[^blog-defer][^effective-go] |
| Channel or mutex? | Channels to pass ownership; a mutex is fine for simple shared state such as counters[^effective-go] |
| `new` or `make`? | `make` for slices, maps and channels; `new` allocates a zeroed value and returns a pointer[^effective-go] |
| Value or pointer receiver? | Pointer if the method mutates the receiver or the struct is large; be consistent[^faq] |
| How do I find data races? | `go test -race` / `go build -race`[^race-detector] |
| How do I profile? | `go test -cpuprofile`/`-memprofile`, `net/http/pprof`, `go tool pprof`[^diagnostics] |
| How do I tune GC memory use? | `GOGC` and `GOMEMLIMIT`[^gc-guide] |
| How do I query a SQL database? | `database/sql` and a driver; one `*sql.DB` connection pool shared across goroutines; placeholders only[^db-connections][^db-sql-injection] |

---

## Related resources

| Resource | Role |
|----------|------|
| <https://go.dev/doc/> | Upstream index this file synthesizes |
| <https://go.dev/ref/spec> | Normative language specification |
| <https://go.dev/ref/mod> | Normative modules reference |
| <https://pkg.go.dev/std> | Standard library API documentation |
| [OKF 0.2](./okf.md) | Format this concept follows |

[^install]: Download and install — https://go.dev/doc/install
[^tut-start]: Tutorial: Get started with Go — https://go.dev/doc/tutorial/getting-started
[^tut-module]: Tutorial: Create a Go module — https://go.dev/doc/tutorial/create-module
[^tut-module-call]: Call your code from another module — https://go.dev/doc/tutorial/call-module-code
[^tut-module-errors]: Return and handle an error — https://go.dev/doc/tutorial/handle-errors
[^tut-module-random]: Return a random greeting — https://go.dev/doc/tutorial/random-greeting
[^tut-module-map]: Return greetings for multiple people — https://go.dev/doc/tutorial/greetings-multiple-people
[^tut-module-test]: Add a test — https://go.dev/doc/tutorial/add-a-test
[^tut-module-install]: Compile and install the application — https://go.dev/doc/tutorial/compile-install
[^tut-workspaces]: Tutorial: Getting started with multi-module workspaces — https://go.dev/doc/tutorial/workspaces
[^tut-gin]: Tutorial: Developing a RESTful API with Go and Gin — https://go.dev/doc/tutorial/web-service-gin
[^tut-generics]: Tutorial: Getting started with generics — https://go.dev/doc/tutorial/generics
[^tut-fuzz]: Tutorial: Getting started with fuzzing — https://go.dev/doc/tutorial/fuzz
[^wiki-webapp]: Writing Web Applications — https://go.dev/doc/articles/wiki/
[^code]: How to Write Go Code — https://go.dev/doc/code
[^tour]: A Tour of Go — https://go.dev/tour/
[^effective-go]: Effective Go — https://go.dev/doc/effective_go
[^faq]: Frequently Asked Questions (FAQ) — https://go.dev/doc/faq
[^editors]: Editor plugins and IDEs — https://go.dev/doc/editors
[^cw-functions]: Codewalk: First-Class Functions in Go — https://go.dev/doc/codewalk/functions
[^cw-markov]: Codewalk: Generating arbitrary text: a Markov chain algorithm — https://go.dev/doc/codewalk/markov
[^cw-sharemem]: Codewalk: Share Memory By Communicating — https://go.dev/doc/codewalk/sharemem
[^blog-jsonrpc]: JSON-RPC: a tale of interfaces — https://go.dev/blog/json-rpc-tale-of-interfaces
[^blog-decl]: Go's Declaration Syntax — https://go.dev/blog/gos-declaration-syntax
[^blog-defer]: Defer, Panic, and Recover — https://go.dev/blog/defer-panic-and-recover
[^blog-timeout]: Go Concurrency Patterns: Timing out, moving on — https://go.dev/blog/go-concurrency-patterns-timing-out-and
[^blog-slices]: Go Slices: usage and internals — https://go.dev/blog/go-slices-usage-and-internals
[^blog-gif]: A GIF decoder: an exercise in Go interfaces — https://go.dev/blog/gif-decoder-exercise-in-go-interfaces
[^blog-errors]: Error handling and Go — https://go.dev/blog/error-handling-and-go
[^go-spec]: The Go Programming Language Specification (Language version go1.27, May 26, 2026) — https://go.dev/ref/spec
[^go-mem]: The Go Memory Model (Version of June 6, 2022) — https://go.dev/ref/mem
[^ref-mod]: Go Modules Reference — https://go.dev/ref/mod
[^gomod-ref]: go.mod file reference — https://go.dev/doc/modules/gomod-ref
[^managing-deps]: Managing dependencies — https://go.dev/doc/modules/managing-dependencies
[^mod-developing]: Developing and publishing modules — https://go.dev/doc/modules/developing
[^release-workflow]: Module release and versioning workflow — https://go.dev/doc/modules/release-workflow
[^managing-source]: Managing module source — https://go.dev/doc/modules/managing-source
[^mod-layout]: Organizing a Go module — https://go.dev/doc/modules/layout
[^major-version]: Developing a major version update — https://go.dev/doc/modules/major-version
[^mod-publishing]: Publishing a module — https://go.dev/doc/modules/publishing
[^version-numbers]: Module version numbering — https://go.dev/doc/modules/version-numbers
[^blog-using-modules]: Using Go Modules (Go Blog, part 1) — https://go.dev/blog/using-go-modules
[^blog-migrating-modules]: Migrating to Go Modules (Go Blog, part 2) — https://go.dev/blog/migrating-to-go-modules
[^blog-publishing-modules]: Publishing Go Modules (Go Blog, part 3) — https://go.dev/blog/publishing-go-modules
[^blog-v2-modules]: Go Modules: v2 and Beyond (Go Blog, part 4) — https://go.dev/blog/v2-go-modules
[^blog-module-compat]: Keeping Your Modules Compatible (Go Blog, part 5) — https://go.dev/blog/module-compatibility
[^toolchain]: Go Toolchains — https://go.dev/doc/toolchain
[^cmd-index]: Command Documentation — https://go.dev/doc/cmd
[^cmd-go]: go command (cmd/go) — https://pkg.go.dev/cmd/go
[^go-command-article]: About the go command — https://go.dev/doc/articles/go_command
[^doc-comments]: Go Doc Comments — https://go.dev/doc/comment
[^diagnostics]: Diagnostics — https://go.dev/doc/diagnostics
[^gc-guide]: A Guide to the Go Garbage Collector — https://go.dev/doc/gc-guide
[^fuzzing]: Go Fuzzing — https://go.dev/security/fuzz
[^build-cover]: Coverage profiling support for integration tests — https://go.dev/doc/build-cover
[^pgo]: Profile-guided optimization — https://go.dev/doc/pgo
[^gdb]: Debugging Go Code with GDB — https://go.dev/doc/gdb
[^race-detector]: Data Race Detector — https://go.dev/doc/articles/race_detector
[^race-blog]: Introducing the Go Race Detector — https://go.dev/blog/race-detector
[^asm]: A Quick Guide to Go's Assembler — https://go.dev/doc/asm
[^cgo-blog]: C? Go? Cgo! — https://go.dev/blog/c-go-cgo
[^cmd-cgo]: cgo command (cmd/cgo) — https://pkg.go.dev/cmd/cgo
[^profiling-blog]: Profiling Go Programs — https://go.dev/blog/profiling-go-programs
[^gopls]: gopls: the Go language server — https://go.dev/gopls/
[^contribute]: Contribution Guide — https://go.dev/doc/contribute
[^release-history]: Release History — https://go.dev/doc/devel/release
[^go1-27]: Go 1.27 Release Notes — https://go.dev/doc/go1.27
[^go1-26]: Go 1.26 Release Notes — https://go.dev/doc/go1.26
[^security-best-practices]: Security Best Practices for Go Developers — https://go.dev/doc/security/best-practices
[^govulncheck-tutorial]: Tutorial: Find and fix vulnerable dependencies with govulncheck — https://go.dev/doc/tutorial/govulncheck
[^db-tutorial]: Tutorial: Accessing a relational database — https://go.dev/doc/tutorial/database-access
[^db-index]: Accessing relational databases — https://go.dev/doc/database/index
[^db-open-handle]: Opening a database handle — https://go.dev/doc/database/open-handle
[^db-change-data]: Executing SQL statements that don't return data — https://go.dev/doc/database/change-data
[^db-querying]: Querying for data — https://go.dev/doc/database/querying
[^db-prepared]: Using prepared statements — https://go.dev/doc/database/prepared-statements
[^db-transactions]: Executing transactions — https://go.dev/doc/database/execute-transactions
[^db-cancel]: Canceling in-progress operations — https://go.dev/doc/database/cancel-operations
[^db-connections]: Managing connections — https://go.dev/doc/database/manage-connections
[^db-sql-injection]: Avoiding SQL injection risk — https://go.dev/doc/database/sql-injection
[^json-tutorial]: Tutorial: Working with JSON — https://go.dev/doc/tutorial/json
[^jsonv2-migration]: encoding/json/v2 Migration Guide — https://go.dev/doc/jsonv2-migration
[^blog-gob]: Gobs of data — https://go.dev/blog/gobs-of-data
[^blog-reflection]: The Laws of Reflection — https://go.dev/blog/laws-of-reflection
[^blog-image]: The Go image package — https://go.dev/blog/go-image-package
[^blog-imagedraw]: The Go image/draw package — https://go.dev/blog/go-imagedraw-package
[^blog-context]: Go Concurrency Patterns: Context — https://go.dev/blog/context
[^pkg-context]: context package documentation — https://pkg.go.dev/context
