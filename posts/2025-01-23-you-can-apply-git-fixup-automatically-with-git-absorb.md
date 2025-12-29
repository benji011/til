---
title: "You can apply `git fixup` automatically with `git absorb`"
date: 2025-01-23T00:00:00Z
tags: [git, tools]
---

`git absorb` is an unofficial Git extension that automatically applies fixup commits to their corresponding original commits, without manually finding commit SHAs.

**The manual way:**

```bash
# Find the commit to fix
git log
# Create fixup commit
git commit --fixup <commit-sha>
# Rebase to apply
git rebase --autosquash --interactive origin/master
```

**The automatic way with git absorb:**

```bash
# Install (via cargo or package manager)
cargo install git-absorb

# Stage your changes
git add -p

# Automatically create and apply fixups
git absorb --and-rebase
```

**What it does:**

Git absorb analyzes your staged changes and intelligently determines which commits they should be fixed into, automatically creating fixup commits and rebasing them.

**Transforms this:**

```
commit 3: linting issue for Feature A
commit 2: Fix bug for Feature A
commit 1: Feature A
```

**Into this:**

```
commit 2: Feature B
commit 1: Feature A (with bug fix and linting integrated)
```

**Why use it:**

- No need to hunt for commit SHAs
- Automatically determines which commit to fix
- Creates clean, atomic commits
- Saves time during code review prep
- Makes git history more readable

Perfect for cleaning up small fixes, typos, and linting issues before pushing or creating a pull request.

[Original source](https://dev.to/benji011/til-you-can-apply-git-fixup-automatically-with-git-absorb-44hk)
