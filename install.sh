#!/usr/bin/env sh

# load environment variables from .env
export $(egrep -v '^#' .env | xargs)

PASSWORD_MIN_LENGTH=8

# check password length
if [[ ${#MEDIAWIKI_ADMIN_PASSWORD} -lt ${PASSWORD_MIN_LENGTH} ]]; \
	then echo "Password must be $PASSWORD_MIN_LENGTH or more symbols"; exit 1; \
	fi

# run Mediawiki install script in wiki service container
docker-compose exec wiki /script/install.sh \
	"$MEDIAWIKI_ADMIN_USERNAME" "$MEDIAWIKI_ADMIN_PASSWORD"
