# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
"""Tests for scripts/verify_branch.sh.

Each test builds a throwaway git repository in a temporary directory, puts it
in the branch or rebase state under test, and runs the real script there. The
script lives one directory up from this file; it is discovered here so that
scripts/verify_docs.sh runs it with the other validator tests.

Usage:
    python3 -m unittest discover -s scripts/docs -p "test_*.py"
"""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parent.parent / "verify_branch.sh"
GIT_ENV = {
    "GIT_AUTHOR_NAME": "Test",
    "GIT_AUTHOR_EMAIL": "test@example.org",
    "GIT_COMMITTER_NAME": "Test",
    "GIT_COMMITTER_EMAIL": "test@example.org",
}


def run_git(repo, *args):
    """Runs a git command in repo and fails the test if git fails.

    Args:
        repo: Path of the repository working tree.
        *args: Arguments passed to git.
    """
    subprocess.run(["git", *args], cwd=repo, check=True, capture_output=True, env={**os.environ, **GIT_ENV})


def run_verify_branch(repo):
    """Runs verify_branch.sh inside repo.

    Args:
        repo: Path of the repository working tree.

    Returns:
        The completed process, with stdout captured as text.
    """
    env = {key: value for key, value in os.environ.items() if key != "FORCE_MAIN_COMMIT"}
    return subprocess.run(["bash", str(SCRIPT)], cwd=repo, capture_output=True, text=True, env=env)


def write_rebase_head_name(repo, head_name):
    """Simulates an in-progress interactive rebase by writing rebase-merge/head-name.

    Args:
        repo: Path of the repository working tree.
        head_name: Content git would record, e.g. "refs/heads/feat/x" or "detached HEAD".
    """
    rebase_dir = Path(repo) / ".git" / "rebase-merge"
    rebase_dir.mkdir()
    (rebase_dir / "head-name").write_text(head_name + "\n")


class VerifyBranch(unittest.TestCase):
    """Branch-name and detached-HEAD behaviour of verify_branch.sh."""

    def setUp(self):
        self._tmp = tempfile.TemporaryDirectory()
        self.repo = self._tmp.name
        run_git(self.repo, "init", "-q", "-b", "main")
        run_git(self.repo, "commit", "-q", "--allow-empty", "-m", "init")

    def tearDown(self):
        self._tmp.cleanup()

    def test_conventional_type_branch_passes(self):
        run_git(self.repo, "checkout", "-q", "-b", "feat/0.1-project-scaffold")
        result = run_verify_branch(self.repo)
        self.assertEqual(result.returncode, 0, result.stdout)

    def test_task_prefix_is_rejected(self):
        run_git(self.repo, "checkout", "-q", "-b", "task/0.1-project-scaffold")
        result = run_verify_branch(self.repo)
        self.assertEqual(result.returncode, 1)
        self.assertIn("permitted Conventional Commit type", result.stdout)

    def test_bad_slug_is_rejected(self):
        run_git(self.repo, "checkout", "-q", "-b", "feat/Bad_Slug")
        result = run_verify_branch(self.repo)
        self.assertEqual(result.returncode, 1)

    def test_main_is_rejected(self):
        result = run_verify_branch(self.repo)
        self.assertEqual(result.returncode, 1)
        self.assertIn("directly to the 'main' branch", result.stdout)

    def test_rebase_of_named_branch_validates_that_branch(self):
        run_git(self.repo, "checkout", "-q", "--detach")
        write_rebase_head_name(self.repo, "refs/heads/fix/login-bug")
        result = run_verify_branch(self.repo)
        self.assertEqual(result.returncode, 0, result.stdout)
        self.assertIn("'fix/login-bug'", result.stdout)

    def test_rebase_from_detached_head_reports_detached_head(self):
        run_git(self.repo, "checkout", "-q", "--detach")
        write_rebase_head_name(self.repo, "detached HEAD")
        result = run_verify_branch(self.repo)
        self.assertEqual(result.returncode, 1)
        self.assertIn("Detached HEAD", result.stdout)
        self.assertNotIn("git branch -m", result.stdout)


if __name__ == "__main__":
    unittest.main()
