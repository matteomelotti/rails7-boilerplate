help:
	@ echo 'setup install_gems  start attach_web console_app console_db'

setup:
	docker-compose build

install_gems:
	docker-compose run --rm web bundle install -j8

start:
	docker-compose up

startd:
	docker-compose up -d

stop:
	docker-compose stop

attach_web:
	docker attach rails7-on-docker-web-1

console_app:
	@ DB_CONTAINER_ID=$(shell docker ps -aqf "name=rails7-on-docker-web-1");  docker exec -it $$DB_CONTAINER_ID bash
console_db:
	@ DB_CONTAINER_ID=$(shell docker ps -aqf "name=rails7-on-docker-db-1");  docker exec -it $$DB_CONTAINER_ID bash

copy_dump:
	export DB_CONTAINER_ID="$$(docker inspect --format="{{.Id}}" rails7-on-docker-db-1)" && docker cp db/dump.sql.gz $$DB_CONTAINER_ID:/dump.sql.gz

import_database:
	export DB_CONTAINER_ID="$$(docker inspect --format="{{.Id}}" rails7-on-docker-db-1)" && docker exec -it $$DB_CONTAINER_ID bash -c "setup_database.sh"