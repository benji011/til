---
title: "How to make auto-hide/show for the dock faster"
date: 2025-09-17T00:00:00Z
tags: [macos, performance, productivity]
---

The macOS Dock's auto-hide animation has a noticeable delay by default. You can make it appear and disappear instantly using Terminal commands.

**Remove the delay:**

```bash
# Remove show delay (instant appearance)
defaults write com.apple.dock autohide-delay -float 0

# Remove animation duration (instant hide/show)
defaults write com.apple.dock autohide-time-modifier -float 0

# Restart Dock to apply changes
killall Dock
```

**What this does:**

- `autohide-delay` controls how long you must hover before the Dock appears (default: ~0.5 seconds)
- `autohide-time-modifier` controls the animation speed (default: ~0.24 seconds)
- Setting both to `0` makes the Dock respond instantly

**Adjust to your preference:**

You can use different values for a balance between instant and smooth:

```bash
# Fast but with slight animation
defaults write com.apple.dock autohide-delay -float 0.1
defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock
```

**Revert to default:**

```bash
defaults delete com.apple.dock autohide-delay
defaults delete com.apple.dock autohide-time-modifier
killall Dock
```

This makes the auto-hide Dock much more responsive, especially useful on larger displays where mouse movement takes time or when you need quick access to Dock icons.

[Original source](https://apple.stackexchange.com/a/70598)
