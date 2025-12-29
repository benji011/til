---
title: "`nohup` runs processes immune to hangup signals, allowing them to survive terminal closure"
date: 2025-12-23T00:00:00Z
tags: [linux, terminal, shell]
---

When you close your terminal or log out, the shell normally sends a SIGHUP signal to all running processes, terminating them. The `nohup` command (no hang up) makes processes immune to these signals, allowing them to continue running.

**Basic usage:**

```bash
nohup command [arguments] > /dev/null 2>&1 &
```

**What each part does:**

- `nohup command` - Runs the command immune to hangup signals
- `> /dev/null 2>&1` - Redirects stdout and stderr to null (discards output)
- `&` - Runs the process in the background

**Example:**

```bash
# Run a long-running script that survives terminal closure
nohup python training_script.py > /dev/null 2>&1 &

# Run a server process without Docker
nohup n8n start > /dev/null 2>&1 &
```

**Why use it:**

- Run long-running tasks without keeping terminal open
- Deploy simple background services without containers
- Execute overnight scripts that outlive your SSH session
- Avoid process interruption when connection drops

**Find running nohup processes:**

```bash
ps aux | grep command_name
```

**Keep output instead:**

```bash
# Save output to nohup.out (default)
nohup python script.py &

# Save to custom file
nohup python script.py > output.log 2>&1 &
```

This provides a lightweight alternative to systemd services, Docker containers, or tmux for simple persistent processes, especially useful on systems where you want background tasks without additional infrastructure.

[Original source](https://dev.to/benji011/til-about-the-command-nohup-2h21)
