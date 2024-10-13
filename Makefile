env:
	cp .env.example .env

compose:
	docker-compose down
	docker volume prune -f
	docker-compose up --build -d
	docker logs server -f
