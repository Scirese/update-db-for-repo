#!/bin/bash

mkdir packages -p

#urls=$(curl https://pkgbuild.yidaozhan.ga/x86_64/ -s | grep .tar.zst | awk -F"\">" '{print $2}' | awk -F"</A>" '{print $1}')

#for i in ${urls[*]}; do 

for i in `cat pkglist.txt`; do 
echo Downloading $i
wget -q https://pkgbuild.yidaozhan.ga/x86_64/$i -P packages/
repo-add -p yidaozhan.db.tar.gz ./packages/$i
done

