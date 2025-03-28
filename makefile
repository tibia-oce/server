.PHONY: up down clean env

compose: up

up: env
	docker build -t server-base:local -f docker/Dockerfile.base .
	docker build --build-arg BASE_IMAGE=server-base:local --build-arg RELEASE_ARCH=release_64 -t server-compiled:local -f docker/Dockerfile.compiled .
	docker build --build-arg APP_IMAGE=server-compiled:local -t server:local -f docker/Dockerfile.datapack .
	docker-compose -f docker/docker-compose.yml --env-file ./.env up -d
	docker logs server -f

down:
	docker-compose -f docker/docker-compose.yml --env-file ./.env down

clean:
	docker-compose -f docker/docker-compose.yml --env-file ./.env down -v
	docker system prune -a --volumes -f

env:
	@if [ ! -f .env ]; then cp .env.example .env; fi
