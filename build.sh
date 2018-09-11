#!/bin/bash
 # options explanation at http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
set -x

git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

git submodule init
git submodule update

sudo npm install -g gitbook-cli
gitbook install
cd docs
gitbook build
mkdir -p /tmp/_book
cp -R _book/* /tmp/_book

# checkout to the gh-pages branch
git checkout gh-pages
cd ..
rm -rf *
cp -R /tmp/_book/* .
rm -rf docs

git add -A .
git commit -a -m "Update docs [ci skip]"

git push origin gh-pages
