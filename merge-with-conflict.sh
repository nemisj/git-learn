#!/usr/bin/env bash

rm -rf merge-with-conflict
mkdir merge-with-conflict
cd merge-with-conflict

echo "" > books

git init
git add books
git commit -m "Initial commit"

echo "ABC" > books
GIT_AUTHOR_DATE=619863300 git commit -m "ABC" -a
PARENT_HASH=$(git rev-parse HEAD)

echo "Alchemist" >> books
GIT_AUTHOR_DATE=992007000 git commit -m "'Alchemist' by Paulo Coelho" -a

echo "Siddhartha" >> books
GIT_AUTHOR_DATE=1239045600 git commit -m "'Siddhartha' by Hermann Hesse" -a

git co -b sci-fi ${PARENT_HASH} 2> /dev/null

echo "A Journey to the Center of the Earth" >> books
GIT_AUTHOR_DATE=1508746500 git commit -m "'A Journey to the Center of the Earth' by Jules Verne" -a

echo "The War of the Worlds" >> books
GIT_AUTHOR_DATE=1529698920 git commit -m "'The War of the Worlds' by Herbert George Wells" -a

git co master
git merge sci-fi
git branch -D sci-fi

echo "ABC" > books
echo "Alchemist" >> books
echo "A Journey to the Center of the Earth" >> books
echo "The War of the Worlds" >> books

git add books
git commit --no-edit

echo "The Trial" >> books
git commit -m "'The Trial' by Franz Kafka" -a

echo "Metro 2033" >> books
git commit -m "'Metro 2033' by Dmitry Glukhovsky" -a
