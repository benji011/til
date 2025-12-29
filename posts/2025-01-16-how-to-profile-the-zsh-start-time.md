---
title: "How to profile the `zsh` start time"
date: 2025-01-16T00:00:00Z
tags: [zsh, shell, performance]
---

If your terminal is slow to open, you can profile zsh startup to identify what's causing the delay and optimize your configuration.

**Quick timing check:**

```bash
time zsh -i -c exit
```

This creates a temporary zsh subshell and shows total startup time.

**Detailed profiling:**

Add these lines to your `~/.zshrc`:

```bash
# At the top of the file
zmodload zsh/zprof

# ... rest of your config ...

# At the bottom of the file
zprof
```

The built-in profiler will output timing data showing "num calls, time, self, and name" for each function, revealing which processes are slowest.

**Common culprits:**

Package managers often cause startup delays:
- **nvm** (Node Version Manager)
- **pyenv** (Python version management)
- **conda** (Python environment management)

**Example:**

One developer found that conda initialization was responsible for 4+ seconds of a 4.6-second startup time. Commenting out the conda block reduced startup to ~1 second.

**Fix slow startup:**

1. Run `zprof` to identify slow processes
2. Disable or lazy-load unnecessary initialization code
3. Consider using alternatives like `zsh-defer` for non-critical plugins
4. Remove tools you don't actively use

[Original source](https://dev.to/benji011/til-how-to-profile-zsh-start-time-2bob)
