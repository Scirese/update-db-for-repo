#!/bin/bash

mkdir packages -p

urls=$(echo `curl -d '{"path":"/od1/aarch64"}' -H "Content-Type: application/json" "https://alist.march7th.tk/api/public/path" | jq -c '.data.files[]' | while read i; do echo $i | jq -cr ".name"|grep zst;done`)

for i in ${urls[*]}; do 
echo Downloading $i
wget -q https://alist.march7th.tk/od1/aarch64/$i -P packages/
repo-add -p march7th.db.tar.gz ./packages/$i
done

