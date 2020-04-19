#!/usr/bin/env bash

rm -rf three-way-merge
mkdir three-way-merge
cd three-way-merge

echo "a" > zork

git init
git add zork
git commit -m "Initial commit"
git co -b one
git branch -D master

echo "b" >> zork
git commit -m "Added b" -a

echo "c" >> zork
git commit -m "Added c" -a

git branch two

echo "d" >> zork
git commit -m "one: Added d" -a

echo "This is head" > head
cat head zork > zork-with-head
rm head zork
mv zork-with-head zork
git commit -m "one: Added head" -a

git co two 2> /dev/null

tail -n +2 zork > zork-without-a
echo "x" > head
cat head zork-without-a > zork-with-head
rm head zork-without-a
mv zork-with-head zork
git commit -m "two (start): Change a to x" -a

echo "z" >> zork
git commit -m "two: Added z at the end" -a

git co two~1 2> /dev/null
