VERSION=$(cat version | awk '{$1=$1;print}')
echo "publish version ${VERSION}"

git config --local user.name "wangshijun"
git config --local user.email "wangshijun2010@gmail.com"

make release
npm config set '//registry.npmjs.org/:_authToken' "${NPM_TOKEN}"
npm install -g @abtnode/cli

echo "publishing uniswap blocklet..."
make build
rm -f build/static/**/*.js.map
rm -f build/static/**/*.css.map
abtnode bundle
npm publish _blocklet

node tools/post-publish.js
