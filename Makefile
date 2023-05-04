.PHONY: build docker_tag
build: ## Create docker image with dependencies needed for development.
	docker-compose build --build-arg COMMIT_HASH=$(git rev-parse HEAD)

.PHONY: run
run: ## Execute www docker container.
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose stop

.PHONY: restart
restart: down build up

.PHONY: docker_tag
docker_tag:
	docker tag <image-name>:<docker-compose-build-label> <image-name>:<commit-hash>
