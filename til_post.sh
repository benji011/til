#!/bin/bash
# Create a new TIL post with pre-populated markdown file
# Usage: ./til_post.sh "Your TIL description here"

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 \"Your TIL description\""
    exit 1
fi

DESCRIPTION="$1"

# Slugify the description for filename
SLUG=$(echo "$DESCRIPTION" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')

# Get today's date in ISO format
TODAY=$(date +%Y-%m-%d)

# Create filename
FILENAME="posts/${TODAY}-${SLUG}.md"

# Check if file already exists
if [ -f "$FILENAME" ]; then
    echo "Error: File $FILENAME already exists"
    exit 1
fi

# Create the post with Hugo front matter
cat > "$FILENAME" <<EOF
---
title: "$DESCRIPTION"
date: ${TODAY}T00:00:00Z
tags: []
---

EOF

echo "Created: $FILENAME"

# Open in editor if EDITOR is set, otherwise use vim
if [ -n "$EDITOR" ]; then
    $EDITOR "$FILENAME"
else
    vim + "$FILENAME"
fi
