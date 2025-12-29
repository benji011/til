---
title: "Automate mundane routines with MacOS Folder Actions"
date: 2025-02-14T00:00:00Z
tags: [macos, automation, productivity]
---

Folder Actions automatically run scripts when files are added, removed, or modified in specific folders on macOS.

**How to set up:**

1. Right-click a folder in Finder
2. Select **Services > Folder Actions Setup**
3. Enable folder actions for that folder
4. Attach a script (AppleScript or shell script) to run on folder events

**Common automation examples:**

- **Auto-organize downloads**: Sort files into subfolders by type (PDFs to Documents, images to Pictures)
- **Image processing**: Automatically resize or compress images when added to a folder
- **File conversion**: Convert documents to different formats
- **Backup automation**: Copy files to a backup location when modified
- **Notification system**: Alert you when specific files appear

**Example AppleScript:**

```applescript
on adding folder items to this_folder after receiving added_items
    repeat with this_item in added_items
        -- Process each added file
        tell application "Finder"
            -- Do something with this_item
        end tell
    end repeat
end adding folder items to
```

**Use cases:**

- Watch a "Screenshots" folder and auto-upload to cloud storage
- Monitor downloads for specific file types and move them automatically
- Process scanned documents as they're saved
- Auto-rename files based on patterns

Built into macOS, no third-party tools needed.

[Original source](https://interfacecraft.online/posts/blog/2025/how-i-automated-my-computer-life-with-macos-folder-actions/)
