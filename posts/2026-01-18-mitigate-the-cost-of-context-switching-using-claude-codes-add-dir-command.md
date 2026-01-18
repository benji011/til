---
title: "Mitigate the cost of context switching using Claude Codes `/add-dir` command"
date: 2026-01-18T00:00:00Z
tags: []
---

Claude Code provides a useful `/add-dir` slash command to add additional working directories to your current workflow. In my case, I've found this to be useful when I need to change or add new environment variables in another repo that happens to be the infrastructure of my current working application. 

The command looks something like below:

```bash
/add-dir /path/to/your/infrastructure-repo
```

Context is saved in this current session (assuming you choose this option vs the others shown below), you make your changes on your infrastructure repo, submit your PR and then and is then when you're done with the whole session all context is automatically removed for you. 

It's also worth noting there are other use cases, e.g. what if you want to investigate what and where something had went wrong in production across multiple repos.

![cc_add-dir.png](/til/cc_add-dir.png)

Reference:
- https://qiita.com/nakamasato/items/97ba0a6119b3f4b5f2e9
- https://code.claude.com/docs/en/slash-commands
