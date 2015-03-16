run:
	docker-compose up -d
	docker-compose run dev bash
	docker-compose stop

.PHONY: run
