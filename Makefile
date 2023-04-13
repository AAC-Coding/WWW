.PHONY: build
build: ## Create docker image with dependencies needed for development.
	docker-compose build

.PHONY: run
run: ## Execute www docker container.
	docker-compose --env-file=.env up -d

.PHONY: stop
stop:
	docker-compose stop

.PHONY: restart
restart: down build up
