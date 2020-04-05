#!/usr/bin/env bash

rm -rf branch-with-label
mkdir branch-with-label
cd  branch-with-label

git init

touch zork
git add .
git commit -m "Initial commit"

echo 1 > zork
git add .
git commit -m "Starting with 1"
git branch octopus
git checkout -b cat

git branch -D master

echo 1.1.1 >> zork
git add .
git commit -m "Added 1.1.1"

echo 1.1.2 >> zork
git add .
git commit -m "Added 1.1.2"

git checkout octopus 2> /dev/null

echo 1.2.1 >> zork
git add .
git commit -m "Added 1.2.1"

echo 1.2.2 >> zork
git add .
git commit -m "Added 1.2.2"
