---
title: "You can inspect each layer in a Docker image using `dive`"
date: 2024-07-03T00:00:00Z
tags: [docker, tools]
---

Dive is a command-line tool that lets you explore Docker images layer-by-layer, showing exactly what each layer adds, modifies, or removes. It's perfect for understanding image structure and identifying ways to reduce image size.

**Installation:**

```bash
# macOS
brew install dive

# Linux (various package managers available)
# Or via Docker
docker pull wagoodman/dive
```

**Basic usage:**

```bash
dive <image-name>
```

**What it shows:**

- **Layer-by-layer breakdown**: View image contents organized by individual layers
- **Change tracking**: Visual indicators show which files were added, removed, or modified
- **Efficiency analysis**: Identifies wasted space and provides a percentage score
- **Size impact**: See how much each layer contributes to the total image size

**Build and analyze in one command:**

```bash
dive build -t my-image:latest .
```

**CI/CD integration:**

Set efficiency thresholds to fail builds with bloated images:
```bash
CI=true dive <image-name>
```

This tool is invaluable for optimizing Dockerfiles, understanding why images are large, and catching unnecessary files that accidentally made it into production images.

[Original source](https://github.com/wagoodman/dive)
