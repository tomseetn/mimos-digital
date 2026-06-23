#!/bin/bash
# Fix: MJC Leisure project card — correct name + replace emoji with "M"

cd "/Users/tomsee/Documents/Mimo Solutions/website" || exit 1

python3 -c "
with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace ALL instances of 'MJ Leisure' with 'MJC Leisure'
content = content.replace('MJ Leisure', 'MJC Leisure')

# Replace slot machine emoji with letter M
content = content.replace('emoji:\"\U0001F3B0\"', 'emoji:\"M\"')

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
print('✅ Done — MJC Leisure + emoji M')
"

git add index.html
git commit -m "fix: MJC Leisure — correct name and M icon"
git push origin main

echo "✅ Pushed. Hard refresh mimos-digital.pages.dev in ~1 min."
