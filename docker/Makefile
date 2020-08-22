

OS=$(shell uname -s)

ifeq ($(OS),Darwin)
	ECHO=echo
endif

PODMAN=$(shell which podman-compose)
DOCKER=$(shell which docker-compose)

ECHO?=echo -e

.PHONY: check all proxy app web db redis help


usage:
	@$(ECHO)
	@$(ECHO) " USAGE: make [target] where [target] is one of the following:"
	@$(ECHO)
	@$(ECHO) " TARGETS:"
	@$(ECHO) "  check\t\tCheck syntax"
	@$(ECHO) "  all\t\tBuild: all containers"
	@$(ECHO) "  proxy\t\tBuild: Traefik container"
	@$(ECHO) "  web\t\tBuild: NGINX web server container"
	@$(ECHO) "  app\t\tBuild: Nextcloud container"
	@$(ECHO) "  redis\t\tBuild: Redis container"
	@$(ECHO) "  push\t\tPush containers to the docker hub"



check:
	@docker-compose config --quiet >/dev/null 2>&1 && $(ECHO) "syntax is ok" || $(ECHO) "syntax check failed"

all: 
	@docker-compose build --no-cache --parallel

proxy:
	@docker-compose build --no-cache proxy

app:
	@docker-compose build --no-cache app

web:
	@docker-compose build --no-cache web

redis:
	@docker-compose build --no-cache redis

push:
	@docker login
	@docker-compose push 

help: usage