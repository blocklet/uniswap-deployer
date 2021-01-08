# Uniswap Blocklet

A blocklet for uniswap. To learn more about Uniswap, please go to https://github.com/Uniswap

## Install on my ABT Node

[![Install on my ABT Node](https://raw.githubusercontent.com/blocklet/development-guide/main/assets/install_on_abtnode.svg)](https://install.arcblock.io/?action=blocklet-install&meta_url=https%3A%2F%2Fgithub.com%2Fblocklet%2Funiswap-deployer%2Freleases%2Fdownload%2F0.2.2%2Fblocklet.json)

## Run and debug in the cloud with Gitpod

Click the "Open in Gitpod" button, Gitpod will start ABT Node and the blocklet.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/blocklet/uniswap-deployer)

## Run and debug locally

```shell
yarn global add @abtnode/cli
git clone git@github.com:blocklet/uniswap-deployer.git
cd uniswap-deployer
make install
make dep
make build
abtnode init --mode debug
abtnode start
blocklet dev
```

## License

The code is licensed under the MIT license found in the
[LICENSE](LICENSE) file.
