#!/usr/bin/env python3
"""Check that documents do not link across the boundary of a standalone workspace.

Purpose:
    A workspace under `apps/` that must stay exportable to its own repository
    (see `.agents/rules/src-isolation.md`) cannot rely on relative links to
    documents outside itself, and the rest of the repository cannot rely on
    links into it. A relative Markdown or HTML link from a file inside such a
    workspace to a file outside it, or the reverse, breaks when the workspace
    moves. Each side names the other's requirement IDs and documents in plain
    text instead.

    Which workspaces are standalone is a per-repository decision, so they are
    passed as arguments. With no arguments the check passes with nothing
    checked. Task walkthroughs under `resources/tasks/` are historical
    evidence and are not checked. Links inside inline code spans are examples,
    not links.

Usage:
    python3 scripts/docs/check_workspace_links.py apps/<app> [apps/<app> ...]

Returns:
    Exit code 0 when no link crosses a boundary, 1 otherwise. Each crossing
    link is printed as `file:line: target`.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
HISTORY = ("/tasks/",)
LINK = re.compile(r"\]\(([^)\s]+)\)|(?:href|src)=\"([^\"]+)\"")
INLINE_CODE = re.compile(r"(?<!\\)(`+)(?:(?!\1)[^\n])+?\1(?!`)")  # CommonMark code span: unescaped, equal-length backtick runs


def documents() -> list:
    """Return repository-relative paths of tracked and untracked Markdown and HTML files. Runs git."""
    out = subprocess.run(["git", "ls-files", "--cached", "--others", "--exclude-standard", "*.md", "*.html"],
                         cwd=ROOT, capture_output=True, text=True, check=True).stdout
    return [p for p in out.splitlines()
            if os.path.exists(os.path.join(ROOT, p)) and not any(h in p for h in HISTORY)]


def workspace_of(path: str, workspaces: list):
    """Return the standalone workspace containing a repository-relative path, or None.

    Args:
        path: Repository-relative file or directory path.
        workspaces: Repository-relative workspace directories.
    """
    for w in workspaces:
        if path == w or path.startswith(w + "/"):
            return w
    return None


def crossing_links(rel: str, text: str, workspaces: list) -> list:
    """Return `file:line: target` messages for links in `text` that cross a workspace boundary.

    Pure: reads nothing from disk.

    Args:
        rel: Repository-relative path of the document.
        text: The document's full text.
        workspaces: Repository-relative standalone workspace directories.
    """
    found = []
    origin = workspace_of(rel, workspaces)
    for n, line in enumerate(text.splitlines(), 1):
        for m in LINK.finditer(INLINE_CODE.sub("", line)):
            target = m.group(1) or m.group(2)
            path = target.split("#", 1)[0]
            if not path or re.match(r"^[a-z][a-z0-9+.-]*:", target) or path.startswith("/"):
                continue
            resolved = os.path.normpath(os.path.join(os.path.dirname(rel), path))
            if workspace_of(resolved, workspaces) != origin:
                found.append(f"{rel}:{n}: {target}")
    return found


def main(argv: list) -> int:
    """Check every document against the given workspaces and print a summary.

    Args:
        argv: Command-line arguments; `argv[1:]` are workspace directories.

    Returns:
        Process exit code: 0 when nothing crosses a boundary, 1 otherwise.
    """
    workspaces = [w.strip("/") for w in argv[1:] if w.strip("/")]
    if not workspaces:
        print("Workspace links: no standalone workspace given; nothing to check.")
        return 0
    files = documents()
    problems = []
    for rel in files:
        text = open(os.path.join(ROOT, rel), errors="replace").read()
        problems += crossing_links(rel, text, workspaces)
    for msg in problems:
        print(msg)
    print(f"checked {len(files)} documents: {len(problems)} link(s) cross a standalone workspace boundary ({', '.join(workspaces)})")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
