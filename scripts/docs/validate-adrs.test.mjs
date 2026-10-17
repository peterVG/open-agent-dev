// SPDX-FileCopyrightText: 2026 Pieter Van Garderen
//
// SPDX-License-Identifier: MIT
/**
 * Unit tests for validate-adrs.mjs. Every test builds its own ADR directory
 * in a temporary folder, so the tests do not depend on this repository's
 * documents. The last test validates the repository itself, if it has ADRs.
 *
 * Usage: node --test scripts/docs/validate-adrs.test.mjs
 */
import assert from "node:assert/strict";
import { mkdirSync, mkdtempSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";
import {
  REQUIRED_SECTIONS,
  STATUSES,
  discoverAdrDirectories,
  headerProject,
  isAdrFilename,
  isProhibitedMarkdownHref,
  numberingErrors,
  validateAdrBody,
  validateAdrDirectory,
  validateAdrs,
  validateReadme,
} from "./validate-adrs.mjs";

/**
 * Build a conforming ADR body.
 * @param {string} name Filename to embed on the second line.
 * @param {object} [overrides] Section text overrides keyed by section name.
 * @param {string} [project] Project name for the header.
 * @returns {string} Markdown body.
 */
function adr(name, overrides = {}, project = "Acme") {
  const sections = REQUIRED_SECTIONS.map((s) => `## ${s}\n\n${overrides[s] ?? (s === "Status" ? "Accepted" : `${s} text.`)}\n`).join("\n");
  return `# Architecture Decision Record - ${project}\n${name}\n\n${sections}`;
}

/**
 * Create a temporary ADR directory holding the given files.
 * @param {Record<string, string>} files Filename to body.
 * @returns {string} Directory path (caller removes it).
 */
function tempAdrDir(files) {
  const dir = mkdtempSync(join(tmpdir(), "adr-"));
  for (const [name, body] of Object.entries(files)) {
    writeFileSync(join(dir, name), body);
  }
  return dir;
}

test("ADR filenames follow ADR-NNN-slug.md", () => {
  assert.equal(isAdrFilename("ADR-001-use-sqlite.md"), true);
  assert.equal(isAdrFilename("ADR-042-a.md"), true);
  assert.equal(isAdrFilename("001-use-sqlite.md"), false);
  assert.equal(isAdrFilename("ADR-1-use-sqlite.md"), false);
  assert.equal(isAdrFilename("ADR-001-Use-SQLite.md"), false);
  assert.equal(isAdrFilename("ADR-001.md"), false);
  assert.equal(isAdrFilename("README.md"), false);
});

test("ADR numbers must be consecutive from 001 without duplicates", () => {
  assert.deepEqual(numberingErrors(["ADR-001-a.md", "ADR-002-b.md", "ADR-003-c.md"]), []);
  assert.deepEqual(numberingErrors([]), []);
  assert.equal(numberingErrors(["ADR-002-b.md"]).length, 1);
  assert.equal(numberingErrors(["ADR-001-a.md", "ADR-003-c.md"]).length, 1);
  assert.equal(numberingErrors(["ADR-001-a.md", "ADR-001-b.md"]).length, 1);
});

test("header line yields the project name", () => {
  assert.equal(headerProject("# Architecture Decision Record - Acme\nADR-001-a.md\n"), "Acme");
  assert.equal(headerProject("# Architecture Decision Record - My Big Project\n"), "My Big Project");
  assert.equal(headerProject("# Architecture Decision Record -\n"), null);
  assert.equal(headerProject("# ADR\n"), null);
});

test("a conforming ADR body has no errors", () => {
  assert.deepEqual(validateAdrBody("ADR-001-a.md", adr("ADR-001-a.md")), []);
  for (const status of STATUSES.filter((s) => s !== "Superseded")) {
    assert.deepEqual(validateAdrBody("ADR-001-a.md", adr("ADR-001-a.md", { Status: status })), []);
  }
});

test("ADR body errors: header, filename line, sections, status, links", () => {
  const name = "ADR-001-a.md";
  assert.match(validateAdrBody(name, adr(name).replace("# Architecture Decision Record - Acme", "# Decision"))[0], /header/);
  assert.match(validateAdrBody(name, adr(name).replace(`\n${name}\n`, "\n"))[0], /filename/);
  assert.match(validateAdrBody(name, adr(name).replace("## Rationale\n", "## Why\n"))[0], /Rationale/);
  assert.match(validateAdrBody(name, adr(name, { Status: "Done" }))[0], /Status/);
  assert.match(validateAdrBody(name, adr(name, { Status: "Superseded" }))[0], /Superseded/);
  assert.deepEqual(validateAdrBody(name, adr(name, { Status: "Superseded by [ADR-002](./ADR-002-b.md)" })), []);
  assert.match(validateAdrBody(name, adr(name, { Decision: "See [doc](/Users/me/doc.md)" }))[0], /absolute/);
  assert.match(validateAdrBody(name, adr(name, { Decision: "Stored at /home/me/x" }))[0], /absolute/);
});

test("README in the ADR directory must index every ADR", () => {
  const names = ["ADR-001-a.md", "ADR-002-b.md"];
  assert.deepEqual(validateReadme("- [a](./ADR-001-a.md)\n- [b](./ADR-002-b.md)\n", names), []);
  assert.equal(validateReadme("- [a](./ADR-001-a.md)\n", names).length, 1);
});

test("markdown hrefs reject absolute destinations", () => {
  assert.equal(isProhibitedMarkdownHref("./ADR-001-a.md"), false);
  assert.equal(isProhibitedMarkdownHref("../prd.md#f-001"), false);
  assert.equal(isProhibitedMarkdownHref("https://example.org/"), false);
  assert.equal(isProhibitedMarkdownHref("/docs/architecture/001.md"), true);
  assert.equal(isProhibitedMarkdownHref("file:///tmp/adr.md"), true);
  assert.equal(isProhibitedMarkdownHref("C:\\temp\\adr.md"), true);
});

test("a directory of conforming ADRs validates", () => {
  const dir = tempAdrDir({
    "README.md": "# ADRs\n- [a](./ADR-001-a.md)\n- [b](./ADR-002-b.md)\n",
    "ADR-001-a.md": adr("ADR-001-a.md"),
    "ADR-002-b.md": adr("ADR-002-b.md"),
  });
  try {
    const result = validateAdrDirectory(dir);
    assert.deepEqual(result.errors, []);
    assert.deepEqual(result.files, ["ADR-001-a.md", "ADR-002-b.md"]);
  } finally {
    rmSync(dir, { recursive: true });
  }
});

test("a directory reports bad names, numbering gaps, and mixed project names", () => {
  const dir = tempAdrDir({
    "ADR-001-a.md": adr("ADR-001-a.md", {}, "Acme"),
    "ADR-003-c.md": adr("ADR-003-c.md", {}, "Other"),
    "004-no-prefix.md": adr("004-no-prefix.md"),
  });
  try {
    const { errors } = validateAdrDirectory(dir);
    assert.ok(errors.some((e) => /004-no-prefix\.md/.test(e) && /ADR-NNN/.test(e)), errors.join("\n"));
    assert.ok(errors.some((e) => /ADR-002/.test(e)), errors.join("\n"));
    assert.ok(errors.some((e) => /project name/.test(e)), errors.join("\n"));
  } finally {
    rmSync(dir, { recursive: true });
  }
});

test("ADR directories are discovered at the root and inside apps", () => {
  const root = mkdtempSync(join(tmpdir(), "repo-"));
  try {
    mkdirSync(join(root, "resources/architecture/ADRs"), { recursive: true });
    mkdirSync(join(root, "apps/one/resources/architecture/ADRs"), { recursive: true });
    mkdirSync(join(root, "apps/two/resources"), { recursive: true });
    assert.deepEqual(discoverAdrDirectories(root), [
      "resources/architecture/ADRs",
      "apps/one/resources/architecture/ADRs",
    ]);
    assert.deepEqual(discoverAdrDirectories(join(root, "apps/two")), []);
  } finally {
    rmSync(root, { recursive: true });
  }
});

test("a repository without ADR directories passes with nothing checked", () => {
  const root = mkdtempSync(join(tmpdir(), "repo-"));
  try {
    const result = validateAdrs(root);
    assert.equal(result.ok, true);
    assert.equal(result.checked, 0);
  } finally {
    rmSync(root, { recursive: true });
  }
});

test("this repository's ADRs, if any, validate", () => {
  const result = validateAdrs();
  assert.equal(result.ok, true, result.errors.join("\n"));
});
