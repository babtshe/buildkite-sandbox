version="1.0.10"
branch="dependency/widget-api/$version"
git config user.email "babtshe@yandex.com"
git config user.name "PackageUpdate Bot"
git checkout master
git checkout -b $branch
npm install -E prettier
git add package.json package-lock.json
git commit -m "widget-api version update to $version"
git push origin $branch
# curl \
#   -X POST \
#   -H "Accept: application/vnd.github.v3+json" \
#   https://api.github.com/repos/babtshe/buildkite-sandbox/pulls \
#   -d '{"head":"$branch","base":"master"}'
dependency/widget-api/1.0.10

curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/babtshe/buildkite-sandbox/pulls \
  -d '{"head":"dependency/widget-api/1.0.10","base":"master"}'