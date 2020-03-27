#!/usr/bin/env bash

rm -rf branch-without-branch
mkdir branch-without-branch
cd  branch-without-branch

git init

touch zork
git add .
git commit -m "Initial commit"

echo 1 > zork
git add .
git commit -m "Starting with 1"
split=$(git rev-parse HEAD)

echo 1.1.1 >> zork
git add .
git commit -m "Added 1.1.1"

echo 1.1.2 >> zork
git add .
git commit -m "Added 1.1.2"

master=$(git rev-parse master)
git checkout ${split} 2> /dev/null
git branch -D master

echo 1.2.1 >> zork
git add .
git commit -m "Added 1.2.1"

echo 1.2.2 >> zork
git add .
git commit -m "Added 1.2.2"

# echo "Branch 1 - $(git rev-parse HEAD)"
# echo "Branch 2 - ${master}"
