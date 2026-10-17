# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
"""Unit tests for check_prd_allocation.py.

Each test writes its own vision and PRD files into a temporary directory, so
the tests do not depend on this repository's documents.

Usage:
    python3 -m unittest discover -s scripts/docs -p "test_*.py"
"""
import pathlib
import tempfile
import unittest

import check_prd_allocation as cpa

VISION = """# Acme: Product Vision

## User Requirements
| ID | Requirement |
|---|---|
| U-01 | Upload a file |
| U-02 | Tag a file |

## Outcomes
| ID | Outcome |
|---|---|
| O-01 | Fewer lost files |
"""

PRD = """# Project Requirements Document: Acme

## F-001: Upload
Text.

## F-002: Tagging
Text.

## Vision allocation
| Vision ID | PRD items |
|---|---|
| U-01 | [F-001](#f-001-upload) |
| U-02 | [F-002](#f-002-tagging) |
"""


class VisionParsing(unittest.TestCase):
    """Vision ID extraction and product naming."""

    def test_requirement_ids_exclude_outcomes_measures_and_references(self):
        self.assertEqual(cpa.vision_ids(VISION), {"U-01", "U-02"})
        self.assertEqual(cpa.vision_ids("| M-01 | x |\n| REF-01 | y |\n| CAP-03 | z |\n"), {"CAP-03"})

    def test_product_name_is_the_h1_before_the_colon(self):
        self.assertEqual(cpa.product_name(VISION), "Acme")
        self.assertEqual(cpa.product_name("# Widget\n"), "Widget")
        self.assertEqual(cpa.product_name("no heading\n"), "")


class AllocationRows(unittest.TestCase):
    """Reading the PRD allocation table."""

    def test_rows_from_whole_section_when_no_product_subsection(self):
        rows = cpa.allocation_rows(PRD, "Acme")
        self.assertEqual([ids for ids, _ in rows], [{"U-01"}, {"U-02"}])

    def test_rows_from_product_subsection_when_present(self):
        prd = PRD.replace("## Vision allocation\n", "## Vision allocation\n### Other vision\n| Vision ID | PRD items |\n|---|---|\n| U-09 | [x](#x) |\n### Acme vision\n")
        self.assertEqual([ids for ids, _ in cpa.allocation_rows(prd, "Acme")], [{"U-01"}, {"U-02"}])

    def test_missing_section_yields_no_rows(self):
        self.assertFalse(cpa.has_allocation_section("# PRD\n## F-001\n"))
        self.assertTrue(cpa.has_allocation_section(PRD))


class PairChecks(unittest.TestCase):
    """Problems reported for one vision and PRD pair."""

    def test_fully_allocated_pair_has_no_problems(self):
        self.assertEqual(cpa.check_pair("Acme", VISION, PRD), [])

    def test_unallocated_stale_and_broken_rows_are_reported(self):
        prd = PRD.replace("| U-02 | [F-002](#f-002-tagging) |", "| U-03 | [F-002](#nope) |\n| U-04 | no link |")
        problems = cpa.check_pair("Acme", VISION, prd)
        self.assertTrue(any("U-02 not allocated" in p for p in problems), problems)
        self.assertTrue(any("U-03 allocated but not in vision" in p for p in problems), problems)
        self.assertTrue(any("#nope" in p for p in problems), problems)
        self.assertTrue(any("no PRD link" in p for p in problems), problems)

    def test_vision_ids_without_allocation_section_is_a_problem(self):
        problems = cpa.check_pair("Acme", VISION, "# PRD\n## F-001: Upload\n")
        self.assertEqual(len(problems), 1)
        self.assertIn("Vision allocation", problems[0])

    def test_vision_without_ids_needs_no_allocation(self):
        self.assertEqual(cpa.check_pair("Acme", "# Acme\nFree text only.\n", "# PRD\n"), [])


class Discovery(unittest.TestCase):
    """Vision and PRD pairs are found at the root and inside apps."""

    def test_pairs_need_both_files(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = pathlib.Path(tmp)
            (root / "resources").mkdir()
            (root / "resources" / "product-vision.md").write_text(VISION)
            (root / "resources" / "prd.md").write_text(PRD)
            (root / "apps" / "one" / "resources").mkdir(parents=True)
            (root / "apps" / "one" / "resources" / "product-vision.md").write_text(VISION)
            (root / "apps" / "two" / "resources").mkdir(parents=True)
            (root / "apps" / "two" / "resources" / "product-vision.md").write_text(VISION)
            (root / "apps" / "two" / "resources" / "prd.md").write_text(PRD)
            pairs = cpa.discover_pairs(root)
            self.assertEqual([p[0] for p in pairs], ["resources", "apps/two/resources"])

    def test_empty_repository_has_no_pairs(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(cpa.discover_pairs(pathlib.Path(tmp)), [])


if __name__ == "__main__":
    unittest.main()
