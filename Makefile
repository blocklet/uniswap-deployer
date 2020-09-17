TOP_DIR=.
README=$(TOP_DIR)/README.md

WHITEPAPER_DIR=src/pages/generated/whitepaper/
VERSION=$(strip $(shell cat version))

build: pre-build
	@echo "Building the software..."
	@cd uniswap && yarn build
	@cd uniswap && mv build ../build

init: install dep
	@echo "Initializing the repo..."

travis-init: install dep
	@echo "Initialize software required for travis (normally ubuntu software)"

install:
	@echo "Install software required for this repo..."
	@git submodule update --init
	@npm install -g yarn

dep:
	@echo "Install npm dependencies required for this repo..."
	@yarn
	@cd uniswap && yarn

pre-build: install dep clean
	@echo "Running scripts before the build..."


all: pre-build build

test:
	@echo "Running test suites..."

lint:
	@echo "Linting the software..."

doc:
	@echo "Building the documenation..."

precommit: dep lint doc build test

travis: precommit

clean:
	@echo "Cleaning the build..."
	@rm -rf build

run:
	@echo "Running the software..."
	@cd uniswap
	@yarn start

deploy-aliyun:
	@echo "Deploying to Alibaba Cloud..."
	@yarn deploy-aliyun

include .makefiles/*.mk

.PHONY: build init travis-init install dep pre-build all test doc precommit travis clean watch run bump-version create-pr
