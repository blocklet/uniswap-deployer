TOP_DIR=.
README=$(TOP_DIR)/README.md

WHITEPAPER_DIR=src/pages/generated/whitepaper/
VERSION=$(strip $(shell cat version))

build: pre-build
	@echo "Building the software..."
	@cd uniswap && rm -f .env.production
	@cd uniswap && sed -i -e "s#4bf032f2d38a4ed6bb975b80d6340847#ecc041a3b974472fbf2cf6ed9a2a1d3c#g" .env
	@cd uniswap && yarn build
	@cd uniswap && mv build ../build

init: install dep
	@echo "Initializing the repo..."

github-action-init: dep
	@echo "Initializing the repo..."
	@sudo npm install -g @abtnode/cli

install:
	@echo "Install software required for this repo..."
	@git submodule update --init
	@git submodule update --remote
	@npm install -g yarn

dep:
	@echo "Install npm dependencies required for this repo..."
	@yarn
	@cd uniswap && yarn

pre-build: clean
	@echo "Running scripts before the build..."

all: pre-build build

test:
	@echo "Running test suites..."

lint:
	@echo "Linting the software..."

doc:
	@echo "Building the documenation..."

precommit: dep lint doc build test

clean:
	@echo "Cleaning the build..."
	@rm -rf build

run:
	@echo "Running the software..."
	@cd uniswap
	@yarn start

deploy: build
	@echo "Deploying to Alibaba Cloud..."
	@abtnode bundle --create-release
	@abtnode deploy .blocklet/bundle

include .makefiles/*.mk

.PHONY: build init install dep pre-build all test doc precommit clean watch run bump-version create-pr
