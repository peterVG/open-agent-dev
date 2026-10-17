"""Unit tests for check_workspace_links.py.

The link analysis is pure (text in, messages out), so no files or git
repository are needed.

Usage:
    python3 -m unittest discover -s scripts/docs -p "test_*.py"
"""
import unittest

import check_workspace_links as cwl

WORKSPACES = ["apps/widget"]


class Membership(unittest.TestCase):
    """Which workspace a path belongs to."""

    def test_workspace_of_path(self):
        self.assertEqual(cwl.workspace_of("apps/widget/README.md", WORKSPACES), "apps/widget")
        self.assertEqual(cwl.workspace_of("apps/widget", WORKSPACES), "apps/widget")
        self.assertIsNone(cwl.workspace_of("apps/widgets/README.md", WORKSPACES))
        self.assertIsNone(cwl.workspace_of("README.md", WORKSPACES))


class CrossingLinks(unittest.TestCase):
    """Links that leave or enter a standalone workspace."""

    def test_links_inside_the_workspace_are_fine(self):
        text = "[a](./docs/a.md) [b](../widget/README.md#top) [c](https://x.org) [d](/abs.md)\n"
        self.assertEqual(cwl.crossing_links("apps/widget/README.md", text, WORKSPACES), [])

    def test_link_leaving_the_workspace_is_reported(self):
        text = "see [PRD](../../resources/prd.md)\n"
        found = cwl.crossing_links("apps/widget/resources/srs.md", text, WORKSPACES)
        self.assertEqual(found, ["apps/widget/resources/srs.md:1: ../../resources/prd.md"])

    def test_link_entering_the_workspace_is_reported(self):
        text = 'x\n<a href="apps/widget/README.md">w</a>\n'
        found = cwl.crossing_links("README.md", text, WORKSPACES)
        self.assertEqual(found, ["README.md:2: apps/widget/README.md"])

    def test_links_in_inline_code_are_examples(self):
        text = "use `[PRD](../../resources/prd.md)` style\n"
        self.assertEqual(cwl.crossing_links("apps/widget/README.md", text, WORKSPACES), [])

    def test_links_between_two_standalone_workspaces_are_reported(self):
        found = cwl.crossing_links("apps/widget/README.md", "[g](../gadget/README.md)\n", ["apps/widget", "apps/gadget"])
        self.assertEqual(len(found), 1)

    def test_nothing_is_reported_without_workspaces(self):
        self.assertEqual(cwl.crossing_links("README.md", "[w](apps/widget/README.md)\n", []), [])


if __name__ == "__main__":
    unittest.main()
