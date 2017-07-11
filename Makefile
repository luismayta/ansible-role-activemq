.PHONY: build deploy lint test functions help
.DEFAULT_GOAL := help

# Configuration.
SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
SCRIPT_DIR = $(ROOT_DIR)/script

# Bin scripts
CLEAN = $(shell) $(SCRIPT_DIR)/clean.sh
PYENV = $(shell) $(SCRIPT_DIR)/pyenv.sh
SETUP = $(shell) $(SCRIPT_DIR)/setup.sh
INSTALL = $(shell) $(SCRIPT_DIR)/install.sh
LINTCODE = $(shell) $(SCRIPT_DIR)/lintcode.sh
TEST = $(shell) $(SCRIPT_DIR)/test.sh

clean: ## Clean files unnecesary
	$(CLEAN)



environment: ## Install Environment
	$(PYENV)
	$(INSTALL)


install:
	$(INSTALL)


roles: ## Update roles ansible
	$(ROLES_ANSIBLE)


lintcode: ## lint to code
	$(LINTCODE)


test: ## Test project
	$(TEST)


help: ## Show help text
	@echo "Commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'
