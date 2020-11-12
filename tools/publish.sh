VERSION=$(cat version | awk '{$1=$1;print}')
echo "publish version ${VERSION}"

git config --local user.name "wangshijun"
git config --local user.email "wangshijun2010@gmail.com"

make build
rm -f build/static/**/*.js.map
rm -f build/static/**/*.css.map


echo "publishing uniswap blocklet..."
npm config set '//registry.npmjs.org/:_authToken' "${NPM_TOKEN}"
abtnode bundle
npm publish .blocklet/bundle

make release

node tools/post-publish.js

# trigger ArcBlock/blocklets repo release
echo "trigger ArcBlock/blocklets repo release"
.makefiles/trigger_registry_build.sh
