#!/bin/sh
set -e # остановить выполнение, если что-то не сработало
git config user.name
destination="./widget-api2"
BUILDKITE_REPO="git@github.com:babtshe/buildkite-sandbox.git"
git clone $BUILDKITE_REPO $destination
cd $destination
npm publish --dry-run
rm $destination
