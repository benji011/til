---
title: "You can create a separate `.gitignore` that doesnt need to be committed into a repo"
date: 2025-12-29T00:00:00Z
tags: [git]
---

Git has a built-in file at `.git/info/exclude` that works exactly like `.gitignore` but is never committed to the repository. This is perfect for personal ignore patterns that don't need to be shared with the team.

For example, if you use a specific editor or have personal debugging files, you can add them here:

```bash
# Add to .git/info/exclude
.vscode/
*.local
.DS_Store
```

No configuration needed - Git automatically reads this file. It uses the same syntax as `.gitignore`.

**Alternative approach**: You can also create a custom ignore file and configure it per-repo with:
```bash
git config --local core.excludesFile .mygitignore
```

[Original source](https://dev.to/fronkan/a-personal-gitignore-even-for-a-single-repository-4o7h)
