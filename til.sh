#!/bin/bash
# A bash script that accepts a url and an arbitrary title then appends
# a formatted link into the top of README.md

while [[ $# -gt 0 ]]; do
    case "$1" in
        --url=*)
            url="${1#*=}"
            ;;
        --title=*)
            title="${1#*=}"
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

content=$(curl -s "$url")

today=$(date +"%B %d, %Y")
link="* [$title]($url) on $today"

if [ -f README.md ]; then
    tmpfile=$(mktemp)
    echo "$link" > "$tmpfile"
    cat README.md >> "$tmpfile"
    mv "$tmpfile" README.md
else
    echo "$link" > README.md
fi
