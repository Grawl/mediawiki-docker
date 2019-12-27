#!/usr/bin/make

SHELL := /bin/bash # Use bash syntax
PASSWORD_MIN_LENGTH := 8

include .env
export $(shell sed 's/=.*//' .env)

list: ## Show available commands list
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Initiate app first time
	@make up
	@git submodule update --init
	@sleep 10 # TODO listen for database is ready to operate
	@make install

reinit: ## Initiate app from scratch
	@docker-compose down --remove-orphans
	@if docker volume rm $$(basename "$$PWD")_mediawiki_mysql; then echo 'volume removed'; fi
	@make init

install: ## Install MediaWiki
	@make test
	@docker exec -it mediawiki_wiki /script/install.sh \
	"$$MEDIAWIKI_ADMIN_USERNAME" "$$MEDIAWIKI_ADMIN_PASSWORD"

up: ## Launch app
	@docker-compose up -d --build

test: ## Check password length
	@if [[ $${#MEDIAWIKI_ADMIN_PASSWORD} -lt ${PASSWORD_MIN_LENGTH} ]]; \
	then echo "Required password length is ${PASSWORD_MIN_LENGTH} or more symbols"; \
	exit 1; fi
