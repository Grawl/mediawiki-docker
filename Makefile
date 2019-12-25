init:
	make up
	docker exec -it mediawiki_wiki /script/install.sh root root
up:
	docker-compose up -d
