---
title: "You can re-order your commit history using git rebase interactive"
date: 2023-06-13T00:00:00Z
tags: [git]
---

Git's interactive rebase allows you to reorder commits in your history, making it easier to organize your work before pushing or to create a cleaner narrative.

**The command:**

```bash
git rebase -i HEAD~x
```

Where `x` is the number of commits you want to include.

**How it works:**

1. **Open the editor**: Running the command opens your default text editor showing commits in reverse chronological order (newest first)

2. **Rearrange the lines**: Simply cut and paste commit lines to their desired positions. Each line represents one commit.

3. **Save and close**: Git will reapply the commits in your new order

4. **Verify**: Check `git log` to confirm the commits are correctly ordered

**Example:**

If you want to move commit 6 to appear after commit 4, just move that line in the editor and save.

**Caution**: Only rebase commits that haven't been pushed publicly. Reordering changes commit hashes and can cause issues for collaborators.

[Original source](https://dev.to/benji011/til-you-can-re-order-your-commit-history-through-rebase-i-35kn)
