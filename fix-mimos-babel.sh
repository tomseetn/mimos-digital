#!/bin/bash
# Fix: Pin @babel/standalone to 7.29.0 (same as FHA — confirmed working)
# Root cause: unpinned babel resolves to newest version with automatic JSX runtime
# which generates `import` statements that break in non-module <script> context

cd "/Users/tomsee/Documents/Mimo Solutions/website" || exit 1

# Pin Babel version
sed -i '' 's|unpkg.com/@babel/standalone/babel.min.js|unpkg.com/@babel/standalone@7.29.0/babel.min.js|g' index.html

# Also remove data-presets="react" override — not needed with pinned 7.29.0
sed -i '' 's| data-presets="react"||g' index.html

echo "✅ Babel version pinned. Committing..."

git add index.html
git commit -m "fix: pin @babel/standalone@7.29.0 (fixes import error on black page)"
git push origin main

echo "✅ Done. Cloudflare will rebuild in ~1 min. Then hard refresh: Cmd+Shift+R"
