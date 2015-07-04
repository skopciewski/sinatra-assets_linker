run:
	touch Gemfile.lock
	docker-compose run dev sh

.PHONY: run
