# Uniswap Blocklet

A blocklet for uniswap. To learn more about Uniswap, please go to https://github.com/Uniswap

## Install on my ABT Node

[![Install on my ABT Node](https://raw.githubusercontent.com/blocklet/development-guide/main/assets/install_on_abtnode.svg)](https://install.arcblock.io/?action=blocklet-install&meta_url=https%3A%2F%2Fblocklet.arcblock.io%2Fblocklet%2Fz8iZsspkkY4AEXqRj8pAWKafC4KM3zN2WfNGA.json)


## Run and debug in the cloud with Gitpod
Click the "Open in Gitpod" button, Gitpod will start ABT Node and the blocklet.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/blocklet/uniswap-deployer)

## Run and debug locally

```shell
yarn global add @abtnode/cli
git clone git@github.com:blocklet/uniswap-deployer.git
cd uniswap-deployer
make build
abtnode init --mode debug
abtnode start
abtnode dev
```

## License

The code is licensed under the MIT license found in the
[LICENSE](LICENSE) file.
