#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
"""Check that each PRD's Vision allocation covers every requirement row of its product vision.

Purpose:
    A product vision may list requirements as Markdown table rows whose first
    column is an ID such as `U-01`, `CAP-03`, or `FE-2`. When it does, the
    matching PRD MUST carry a `## Vision allocation` section whose table maps
    every one of those IDs to at least one PRD heading. This script finds each
    vision and PRD pair, extracts the vision's requirement IDs, and confirms
    that each appears in the first column of the allocation table (under a
    `### <product> vision` subsection when the PRD has one, otherwise the whole
    section). It also confirms that every allocation cell links to a PRD
    heading that exists, and reports allocation IDs that no longer exist in
    the vision.

    Rows whose ID prefix is `O-` (outcomes), `M-` (measures), or `REF-`
    (sources) describe the product rather than require something of it, so
    they are not allocated. A vision without requirement IDs needs no
    allocation section. A repository without any vision and PRD pair passes
    with nothing checked.

Pairs:
    `resources/product-vision.md` with `resources/prd.md`, and
    `apps/<app>/resources/product-vision.md` with `apps/<app>/resources/prd.md`.

Usage:
    python3 scripts/docs/check_prd_allocation.py   (from the repository root)

Returns:
    Exit code 0 when every requirement ID is allocated and every allocation
    target exists, 1 otherwise. A summary line is printed per pair, followed
    by any problems.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
DESCRIPTIVE_PREFIXES = {"O", "M", "REF"}
ROW_ID = re.compile(r"^\|\s*([A-Z]{1,4})-(\d+)\s*\|")
ANY_ID = re.compile(r"\b([A-Z]{1,4}-\d+)\b")
ANCHOR_LINK = re.compile(r"\]\(#([^)]+)\)")
SECTION_HEADING = "## Vision allocation"


def vision_ids(text: str) -> set:
    """Return the requirement-row IDs declared in a vision document.

    Args:
        text: Full product-vision Markdown text.

    Returns:
        IDs found in the first column of a table row, excluding descriptive
        prefixes (outcomes, measures, references).
    """
    found = set()
    for line in text.splitlines():
        m = ROW_ID.match(line)
        if m and m.group(1) not in DESCRIPTIVE_PREFIXES:
            found.add(f"{m.group(1)}-{m.group(2)}")
    return found


def product_name(text: str) -> str:
    """Return the product name from a vision's first H1, before any colon.

    Args:
        text: Full product-vision Markdown text.

    Returns:
        The name, or an empty string when the document has no H1.
    """
    for line in text.splitlines():
        if line.startswith("# "):
            return line[2:].split(":", 1)[0].strip()
    return ""


def slugify(heading: str) -> str:
    """Return the GitHub anchor slug for a Markdown heading text.

    Args:
        heading: The heading text without leading hashes.

    Returns:
        The lower-case, hyphenated anchor GitHub generates for it.
    """
    text = re.sub(r"[`*_~]", "", heading).strip().lower()
    text = re.sub(r"[^\w\- ]", "", text)
    return text.replace(" ", "-")


def prd_anchors(text: str) -> set:
    """Return all heading anchors in the PRD text.

    Args:
        text: Full PRD Markdown text.

    Returns:
        Set of anchor slugs (duplicates are not suffixed).
    """
    return {slugify(m.group(1)) for m in re.finditer(r"(?m)^#{1,6}\s+(.*?)\s*$", text)}


def has_allocation_section(text: str) -> bool:
    """Return True when the PRD text contains a `## Vision allocation` heading.

    Args:
        text: Full PRD Markdown text.
    """
    return text.startswith(SECTION_HEADING) or f"\n{SECTION_HEADING}" in text


def allocation_rows(text: str, product: str) -> list:
    """Return (first-column IDs, allocation cell) pairs from the PRD allocation table.

    Args:
        text: Full PRD Markdown text.
        product: Product name; selects the `### <product> vision` subsection
            when the PRD has one, otherwise the whole section is read.

    Returns:
        List of tuples (set of IDs in column 1, text of column 2). Empty when
        the PRD has no allocation section.
    """
    if not has_allocation_section(text):
        return []
    section = text.split(SECTION_HEADING, 1)[1].split("\n## ", 1)[0]
    marker = f"### {product} vision"
    block = section.split(marker, 1)[1].split("\n### ", 1)[0] if marker in section else section
    rows = []
    for line in block.splitlines():
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if len(cells) < 2 or not line.startswith("|") or cells[0] in ("Vision ID", "---"):
            continue
        rows.append((set(ANY_ID.findall(cells[0])), cells[1]))
    return rows


def row_link_problems(label: str, rows: list, anchors: set) -> list:
    """Return problems for allocation rows whose PRD links are missing or dangling.

    Args:
        label: Pair label used as the message prefix.
        rows: Output of `allocation_rows`.
        anchors: Valid PRD heading anchors.
    """
    problems = []
    for ids, cell in rows:
        targets = ANCHOR_LINK.findall(cell)
        if not targets:
            problems.append(f"{label}: row {sorted(ids)} has no PRD link")
        problems += [f"{label}: row {sorted(ids)} links missing #{a}" for a in targets if a not in anchors]
    return problems


def check_pair(label: str, vision_text: str, prd_text: str) -> list:
    """Check one vision against its PRD allocation table. Pure: reads nothing.

    Args:
        label: Pair label used as the message prefix (e.g. `resources`).
        vision_text: Full product-vision Markdown text.
        prd_text: Full PRD Markdown text.

    Returns:
        List of problem messages (empty when the vision is fully allocated or
        declares no requirement IDs).
    """
    declared = vision_ids(vision_text)
    if not declared:
        return []
    if not has_allocation_section(prd_text):
        return [f"{label}: vision declares {len(declared)} requirement IDs but the PRD has no '{SECTION_HEADING}' section"]
    rows = allocation_rows(prd_text, product_name(vision_text))
    allocated = set().union(*(ids for ids, _ in rows)) if rows else set()
    problems = [f"{label}: {i} not allocated" for i in sorted(declared - allocated)]
    problems += [f"{label}: {i} allocated but not in vision" for i in sorted(allocated - declared)]
    problems += row_link_problems(label, rows, prd_anchors(prd_text))
    return problems


def discover_pairs(root: pathlib.Path) -> list:
    """Return (label, vision path, PRD path) for every directory holding both files.

    Args:
        root: Repository root.

    Returns:
        Root `resources` first, then `apps/<app>/resources` in name order.
    """
    candidates = [root / "resources"]
    apps = root / "apps"
    if apps.is_dir():
        candidates += [p / "resources" for p in sorted(apps.iterdir()) if p.is_dir()]
    pairs = []
    for d in candidates:
        vision, prd = d / "product-vision.md", d / "prd.md"
        if vision.is_file() and prd.is_file():
            pairs.append((d.relative_to(root).as_posix(), vision, prd))
    return pairs


def main() -> int:
    """Run the allocation check for each vision and PRD pair and print the result.

    Returns:
        Process exit code: 0 on success, 1 when any problem is found.
    """
    pairs = discover_pairs(ROOT)
    if not pairs:
        print("PRD allocation: no product-vision.md and prd.md pair found; nothing to check.")
        return 0
    problems = []
    for label, vision, prd in pairs:
        vision_text, prd_text = vision.read_text(), prd.read_text()
        pair_problems = check_pair(label, vision_text, prd_text)
        print(f"{label}: {len(vision_ids(vision_text))} requirement IDs, {len(pair_problems)} problem(s)")
        problems += pair_problems
    for p in problems:
        print(p)
    print("OK: every vision requirement ID is allocated" if not problems else f"FAIL: {len(problems)} problem(s)")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
