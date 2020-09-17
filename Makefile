TOP_DIR=.
README=$(TOP_DIR)/README.md

WHITEPAPER_DIR=src/pages/generated/whitepaper/
VERSION=$(strip $(shell cat version))

build: pre-build
	@echo "Building the software..."
	@DEBUG=www yarn build
	@rm public/*.js.map

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
	@cd uniswap
	@yarn

pre-build: install dep clean prepare
	@echo "Running scripts before the build..."

post-build:
	@echo "Running scripts after the build is done..."

all: pre-build build post-build

test:
	@echo "Running test suites..."

lint:
	@echo "Linting the software..."
	@yarn lint

doc:
	@echo "Building the documenation..."

precommit: dep lint doc build test

travis: precommit

travis-deploy:
	@echo "Deploy the software by travis"
	@.makefiles/build.sh

clean:
	@echo "Cleaning the build..."
	@rm -rf .cache public src/pages/generated

prepare:
	@echo "Prepare the software..."
	@rm -rf src/pages/generated && mkdir -p $(WHITEPAPER_DIR)
	@cp -r dependencies/Whitepaper/src/content/latest/images $(WHITEPAPER_DIR)
	@node tools/merge.js

run: prepare
	@echo "Running the software..."
	@cd uniswap
	@yarn start

deploy-aliyun:
	@echo "Deploying to Alibaba Cloud..."
	@yarn deploy-aliyun

include .makefiles/*.mk

.PHONY: build init travis-init install dep pre-build post-build all test doc precommit travis clean watch run bump-version create-pr
