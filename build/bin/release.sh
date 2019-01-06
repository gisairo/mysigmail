# !/usr/bin/env sh
set -e
CURRENT=$(node -p "require('./package.json').version")
echo "Current $CURRENT"
echo "Enter release version: "
read VERSION

read -p "Releasing $VERSION - are you sure? (y/n)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  npm run build
  git add -A
  git commit -m "release $VERSION"
  npm version $VERSION -m "release $VERSION"
  git push origin master
fi