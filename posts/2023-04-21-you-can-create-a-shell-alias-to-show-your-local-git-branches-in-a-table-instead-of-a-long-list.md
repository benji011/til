---
title: "You can create a shell alias to show your local Git branches in a table instead of a long list"
date: 2023-04-21T00:00:00Z
tags: [git, shell]
---

Instead of scrolling through a long list of git branches, you can create a shell alias that displays them in a clean, formatted table with useful information like commit date and author.

Here's the alias:

```bash
alias gb='git --no-pager branch --sort=committerdate --format="%(color:yellow)%(refname:short)%09%(color:green)%(committerdate:relative)%09%(color:red)[%(authorname)]" --color=always | column -t -s$'\t''
```

Add this to your `~/.bashrc`, `~/.zshrc`, or equivalent shell configuration file.

**What it does:**

- Lists all git branches sorted by most recent commit date
- Displays three color-coded columns:
  - Branch name (yellow)
  - Relative commit date (green)
  - Author name (red)
- Uses `column` to align everything into neat, tab-separated columns

Instead of a simple list, you'll see a formatted table showing when each branch was last updated and who worked on it - perfect for quickly identifying stale branches or finding recent work.

[Original source](https://gist.github.com/benji011/8210b3eeda1b80935b87be3026c6a40e)
