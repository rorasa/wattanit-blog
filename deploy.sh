#!/bin/bash

if [[ ! -d "wattanit.github.io" ]]
then
    echo "Cloning the production site repository"
    git clone https://github.com/wattanit/wattanit.github.io.git
fi

echo "Cleaning old resources"
rm -rf public
rm -rf resources

echo "Building production site"
HUGO_ENV=production hugo --gc --minify

echo "Pushing production site to repository"
cp -r public/* wattanit.github.io/
dt=$(date '+%d/%m/%Y %H:%M:%S')
cd wattanit.github.io
git add . && git commit -m "Deploy production site at $dt" && git push origin master