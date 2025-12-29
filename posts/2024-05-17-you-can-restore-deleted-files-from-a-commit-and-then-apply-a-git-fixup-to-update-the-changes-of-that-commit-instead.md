---
title: "You can restore deleted files from a commit and then apply a git fixup to update the changes of that commit instead"
date: 2024-05-17T00:00:00Z
tags: [git]
---

If you accidentally deleted a file in a commit and want to restore it while updating that same commit, you can use git's fixup functionality rather than rewriting history manually.

**The steps:**

1. **Restore the deleted file from the previous commit:**
   ```bash
   git checkout [commit_hash]^ -- [file_path]
   ```
   The caret (^) points to the parent commit where the file still existed.

2. **Create a fixup commit:**
   ```bash
   git commit --fixup [commit_hash]
   ```

3. **Rebase with autosquash to merge the fixup:**
   ```bash
   git rebase --autosquash --interactive origin/master
   ```
   This automatically applies the fixup commit to the original commit.

4. **Force push to your branch:**
   ```bash
   git push origin [your_branch] --force-with-lease
   ```

**For the most recent commit**, there's a simpler approach:
```bash
git reset HEAD~1  # Undo the last commit
# Restore the file so it's included
git commit -c ORIG_HEAD  # Recommit with the same message
git push --force-with-lease
```

Using `--fixup` preserves all other changes from the original commit while fixing the file deletion cleanly.

[Original source](https://dev.to/benji011/til-you-can-restore-deleted-files-from-a-commit-and-then-apply-a-git-fixup-to-update-the-changes-of-that-commit-instead-5f0k)
