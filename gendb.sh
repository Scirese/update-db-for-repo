#!/bin/bash

mkdir packages -p

urls=$(echo `curl -d '{"path":"/PKGBUILD/x86_64"}' -H "Content-Type: application/json" "https://file.yidaozhan.ga/api/public/path" | jq -c '.data.files[]' | while read i; do echo $i | jq -cr ".name"|grep zst;done`)

for i in ${urls[*]}; do 
echo Downloading $i
wget -q https://file.yidaozhan.ga/d/PKGBUILD/x86_64/$i -P packages/
repo-add -p yidaozhan.db.tar.gz ./packages/$i
done

