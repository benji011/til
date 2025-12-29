---
title: "You can stage specific hunks interactively in your file(s) using `git add -p`"
date: 2024-12-05T00:00:00Z
tags: [git]
---

Instead of staging entire files, `git add -p` (or `--patch`) lets you interactively review and stage individual chunks (hunks) of changes. This is perfect for creating focused, logical commits from a file with mixed changes.

**Usage:**

```bash
git add -p [file]
```

Git will show each hunk and prompt you with options:

**Common options:**

- `y` - Stage this hunk
- `n` - Don't stage this hunk
- `s` - Split into smaller hunks
- `e` - Manually edit the hunk
- `q` - Quit (don't stage this or remaining hunks)
- `?` - Show help for all options

**Example scenario:**

You have a file with both bug fixes and new features. Using `git add -p`, you can:

1. Stage only the bug fix hunks → commit them separately
2. Stage the feature hunks → commit them as a different logical change

**Why use it:**

- Create clean, focused commits
- Separate unrelated changes in the same file
- Review each change before staging
- Build a more readable git history
- Make code reviews easier by grouping related changes

**Split large hunks:**

If Git's hunks are too large, use `s` to split them into smaller pieces, or `e` to manually edit which lines to stage.

This approach encourages better commit hygiene and makes it easier to revert specific changes later without affecting unrelated code.

[Original source](https://stackoverflow.com/a/6290646/4477547)
