#!/usr/bin/make

SHELL := /bin/bash # Use bash syntax

.PHONY: list init reinit install up

list: ## Show available commands list
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Initiate app first time
	@make up
	@git submodule update --init
	@sleep 10 # TODO listen for database is ready to operate
	@sh ./install.sh

reinit: ## Initiate app from scratch
	@docker-compose down --remove-orphans
	@if docker volume rm $$(basename "$$PWD")_mysql; then echo 'volume removed'; fi
	@make init

up: ## Launch app
	@docker-compose up -d --build
