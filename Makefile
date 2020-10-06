default:
	@echo "You need to supply an argument to make"
.PHONY: default


# Docker commands
docker-start:
	docker-compose pull && \
	docker-compose up -d
up: docker-start
.PHONY: docker-start up

docker-stop:
	docker-compose down -v
down: docker-stop
.PHONY: docker-stop down

docker-restart: docker-stop docker-start
restart: docker-restart
.PHONY: docker-restart restart


# Cache commands
cache-clear:
	bin/console cache:clear --env=prod
cc: cache-clear
.PHONY: cache-clear cc

cache-warmup: cache-clear
	bin/console cache:warmup --env=prod
.PHONY: cache-warmup


# DB commands
update: migrate
.PHONY: update

migrate:
	bin/console doctrine:migrations:migrate --no-interaction
.PHONY: migrate

