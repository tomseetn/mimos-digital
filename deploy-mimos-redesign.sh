#!/bin/bash
# Deploy mimos.digital redesign — light theme + MS favicon
# Run from Terminal: bash "/Users/tomsee/Documents/Mimo Solutions/Corp Doc/deploy-mimos-redesign.sh"

set -e

SRC="/Users/tomsee/Documents/Mimo Solutions/Corp Doc"
DEST="/Users/tomsee/Documents/Mimo Solutions/website"

echo "📦 Copying files to website folder..."

# Copy new index.html
cp "$SRC/index.html" "$DEST/index.html"

# Copy favicons
cp "$SRC/favicon.ico"     "$DEST/favicon.ico"
cp "$SRC/favicon-32.png"  "$DEST/favicon-32.png"
cp "$SRC/favicon-192.png" "$DEST/favicon-192.png"
cp "$SRC/favicon-512.png" "$DEST/favicon-512.png"

echo "✅ Files copied."

# Git commit + push
cd "$DEST"
git add -A
git commit -m "redesign: light theme + MS favicon + MJC Leisure fix"
git push origin main

echo ""
echo "✅ Pushed to GitHub. Cloudflare will rebuild in ~1 minute."
echo "🔗 Hard refresh: https://mimos-digital.pages.dev (Cmd+Shift+R)"
