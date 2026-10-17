// SPDX-FileCopyrightText: 2026 Pieter Van Garderen
//
// SPDX-License-Identifier: MIT
/**
 * Validate every Architecture Decision Record in the repository against the
 * project's ADR rules (.agents/rules/adr-formatting.md, .agents/kb/iso-42010-adr.md):
 *
 *   - ADR directories are `resources/architecture/ADRs/` at the repository
 *     root and `apps/<app>/resources/architecture/ADRs/` for each app.
 *   - Filenames are `ADR-NNN-slug.md`, numbered consecutively from 001.
 *   - Line 1 is `# Architecture Decision Record - <Project Name>`, line 2 is
 *     the filename, and every ADR in a directory names the same project.
 *   - The nine ISO 42010 sections are present as `## ` headings.
 *   - Status is Proposed, Accepted, Deprecated, or Superseded; a Superseded
 *     ADR links to the ADR that replaced it.
 *   - No absolute paths or absolute Markdown links.
 *   - A README.md in the directory indexes every ADR.
 *
 * A repository with no ADR directory passes with nothing checked.
 *
 * Usage: node scripts/docs/validate-adrs.mjs   (from the repository root)
 */
import { existsSync, readdirSync, readFileSync, statSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(here, "../..");

export const REQUIRED_SECTIONS = [
  "Title",
  "Status",
  "Context / Requirement Reference",
  "Decision",
  "Rationale",
  "Assumptions",
  "Alternatives Considered",
  "Consequences / Implications",
  "Related Decisions / Notes",
];

export const STATUSES = ["Proposed", "Accepted", "Deprecated", "Superseded"];

const ADR_FILENAME = /^ADR-(\d{3})-[a-z0-9]+(?:-[a-z0-9]+)*\.md$/;
const HEADER = /^# Architecture Decision Record - (.+?)\s*$/;
const ABSOLUTE_PATH = /(?:[A-Za-z]:\\|\/Users\/|\/home\/|file:\/\/)/;
const MARKDOWN_LINK = /\[[^\]]*\]\(([^)\s]+)\)/g;
const WINDOWS_DRIVE_LINK = /^[A-Za-z]:[\\/]/;
const ADR_LINK = /\]\([^)]*ADR-\d{3}-[^)]*\.md[^)]*\)/;

/**
 * Whether a filename follows `ADR-NNN-slug.md`.
 * @param {string} name Filename.
 * @returns {boolean}
 */
export function isAdrFilename(name) {
  return ADR_FILENAME.test(name);
}

/**
 * Errors for ADR numbers that are not consecutive from 001 or are reused.
 * @param {string[]} names ADR filenames (non-ADR names are ignored).
 * @returns {string[]} One message per gap and per duplicated number.
 */
export function numberingErrors(names) {
  const numbers = names.map((n) => ADR_FILENAME.exec(n)).filter(Boolean).map((m) => Number(m[1]));
  const errors = [];
  const seen = new Set();
  for (const n of numbers) {
    if (seen.has(n)) {
      errors.push(`ADR-${String(n).padStart(3, "0")} is used by more than one file`);
    }
    seen.add(n);
  }
  const max = numbers.length ? Math.max(...numbers) : 0;
  for (let n = 1; n <= max; n += 1) {
    if (!seen.has(n)) {
      errors.push(`ADR-${String(n).padStart(3, "0")} is missing; numbers must be consecutive from 001`);
    }
  }
  return errors;
}

/**
 * Project name from the ADR header line.
 * @param {string} body ADR Markdown.
 * @returns {string|null} The name, or null when line 1 is not the header.
 */
export function headerProject(body) {
  const match = HEADER.exec(body.split("\n", 1)[0]);
  return match ? match[1] : null;
}

/**
 * Whether a Markdown link destination is an absolute path or file URL.
 * @param {string} href Link destination.
 * @returns {boolean}
 */
export function isProhibitedMarkdownHref(href) {
  const dest = href.trim();
  if (dest.startsWith("#") || dest.startsWith("./") || dest.startsWith("../")) {
    return false;
  }
  if (/^https?:\/\//i.test(dest) || dest.startsWith("mailto:")) {
    return false;
  }
  if (dest.startsWith("file:") || dest.startsWith("/") || WINDOWS_DRIVE_LINK.test(dest)) {
    return true;
  }
  return ABSOLUTE_PATH.test(dest);
}

/**
 * Text of the `## Status` section (up to the next `## ` heading).
 * @param {string} body ADR Markdown.
 * @returns {string} Section text, empty when the section is missing.
 */
function statusSection(body) {
  const start = body.indexOf("\n## Status\n");
  if (start < 0) {
    return "";
  }
  const rest = body.slice(start + "\n## Status\n".length);
  const end = rest.indexOf("\n## ");
  return end < 0 ? rest : rest.slice(0, end);
}

/**
 * Errors for the Status section: known status word; Superseded links onward.
 * @param {string} name ADR filename, for messages.
 * @param {string} body ADR Markdown.
 * @returns {string[]}
 */
function statusErrors(name, body) {
  const section = statusSection(body);
  const firstWord = section.trim().split(/\s+/, 1)[0] ?? "";
  if (!STATUSES.includes(firstWord)) {
    return [`${name} Status must start with one of: ${STATUSES.join(", ")}`];
  }
  if (firstWord === "Superseded" && !ADR_LINK.test(section)) {
    return [`${name} is Superseded but its Status does not link to the replacing ADR`];
  }
  return [];
}

/**
 * Errors for absolute paths and absolute Markdown links in the body.
 * @param {string} name ADR filename, for messages.
 * @param {string} body ADR Markdown.
 * @returns {string[]}
 */
function absoluteReferenceErrors(name, body) {
  const errors = [];
  if (ABSOLUTE_PATH.test(body)) {
    errors.push(`${name} contains a prohibited absolute path`);
  }
  for (const match of body.matchAll(MARKDOWN_LINK)) {
    if (isProhibitedMarkdownHref(match[1])) {
      errors.push(`${name} contains a prohibited absolute Markdown link: ${match[1]}`);
    }
  }
  return errors;
}

/**
 * Validate one ADR's text against the header, filename line, sections,
 * status, and linking rules. Pure: reads nothing from disk.
 * @param {string} name ADR filename.
 * @param {string} body ADR Markdown.
 * @returns {string[]} Error messages; empty when the ADR conforms.
 */
export function validateAdrBody(name, body) {
  const errors = [];
  if (headerProject(body) === null) {
    errors.push(`${name} line 1 must be the header '# Architecture Decision Record - <Project Name>'`);
  }
  if (!body.includes(`\n${name}\n`)) {
    errors.push(`${name} must include its filename on its own line after the header`);
  }
  for (const section of REQUIRED_SECTIONS) {
    if (!body.includes(`\n## ${section}\n`)) {
      errors.push(`${name} missing section '## ${section}'`);
    }
  }
  errors.push(...statusErrors(name, body));
  errors.push(...absoluteReferenceErrors(name, body));
  return errors;
}

/**
 * Errors for ADRs that the directory README does not mention.
 * @param {string} body README Markdown.
 * @param {string[]} names ADR filenames that must be indexed.
 * @returns {string[]}
 */
export function validateReadme(body, names) {
  return names.filter((n) => !body.includes(n)).map((n) => `README.md must index ${n}`);
}

/**
 * Error when ADRs in one directory name different projects in their headers.
 * @param {Map<string, string>} bodies Filename to Markdown.
 * @returns {string[]}
 */
function projectNameErrors(bodies) {
  const names = new Set([...bodies.values()].map(headerProject).filter((p) => p !== null));
  if (names.size <= 1) {
    return [];
  }
  return [`ADRs in one directory must share one project name in their headers; found: ${[...names].join(", ")}`];
}

/**
 * Validate every Markdown file in one ADR directory. Reads the files.
 * @param {string} dir Absolute path of the ADR directory.
 * @returns {{ errors: string[], files: string[] }} Errors and the ADR filenames (README excluded).
 */
export function validateAdrDirectory(dir) {
  const files = readdirSync(dir).filter((n) => n.endsWith(".md") && n !== "README.md").sort();
  const bodies = new Map(files.map((n) => [n, readFileSync(join(dir, n), "utf8")]));
  const errors = [];
  for (const name of files) {
    if (!isAdrFilename(name)) {
      errors.push(`${name} does not follow the ADR-NNN-slug.md naming convention`);
    }
  }
  errors.push(...numberingErrors(files));
  for (const [name, body] of bodies) {
    errors.push(...validateAdrBody(name, body));
  }
  errors.push(...projectNameErrors(bodies));
  if (existsSync(join(dir, "README.md"))) {
    errors.push(...validateReadme(readFileSync(join(dir, "README.md"), "utf8"), files));
  }
  return { errors, files };
}

/**
 * ADR directories that exist under a repository root. Reads the directory tree.
 * @param {string} root Absolute repository root.
 * @returns {string[]} Root-relative directory paths, root first, then apps in name order.
 */
export function discoverAdrDirectories(root) {
  const candidates = ["resources/architecture/ADRs"];
  const appsDir = join(root, "apps");
  if (existsSync(appsDir) && statSync(appsDir).isDirectory()) {
    for (const app of readdirSync(appsDir).sort()) {
      candidates.push(join("apps", app, "resources/architecture/ADRs"));
    }
  }
  return candidates.filter((c) => existsSync(join(root, c)) && statSync(join(root, c)).isDirectory());
}

/**
 * Validate all ADR directories in a repository. Reads the files.
 * @param {string} [root] Absolute repository root; defaults to this repository.
 * @returns {{ ok: boolean, errors: string[], checked: number, directories: string[] }}
 */
export function validateAdrs(root = repoRoot) {
  const directories = discoverAdrDirectories(root);
  const errors = [];
  let checked = 0;
  for (const dir of directories) {
    const result = validateAdrDirectory(join(root, dir));
    errors.push(...result.errors.map((e) => `${dir}/${e}`));
    checked += result.files.length;
  }
  return { ok: errors.length === 0, errors, checked, directories };
}

/**
 * Command-line entry point: print the outcome and set the exit code.
 * @returns {number} Process exit code.
 */
function main() {
  const result = validateAdrs();
  if (result.directories.length === 0) {
    console.log("ADR validation: no ADR directory found (resources/architecture/ADRs); nothing to check.");
    return 0;
  }
  for (const error of result.errors) {
    console.error(`- ${error}`);
  }
  if (!result.ok) {
    console.error(`ADR validation failed: ${result.errors.length} problem(s).`);
    return 1;
  }
  console.log(`ADR validation passed (${result.checked} ADRs in ${result.directories.length} directory/ies).`);
  return 0;
}

const isMain = process.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (isMain) {
  process.exit(main());
}
