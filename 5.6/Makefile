NS ?= docker.io/rammstein4o
PHP_VERSION ?= 5.6

IMAGE_NAME ?= php-image
CONTAINER_NAME ?= php
CONTAINER_INSTANCE ?= default

.PHONY: all build no-cache pull push tag-latest shell start stop rm release

all: build tag-latest

build:
	-docker pull $(NS)/$(IMAGE_NAME):$(PHP_VERSION)
	docker build -t $(NS)/$(IMAGE_NAME):$(PHP_VERSION) --build-arg PHP_VERSION=$(PHP_VERSION) .

no-cache:
	docker build --no-cache -t $(NS)/$(IMAGE_NAME):$(PHP_VERSION) --build-arg PHP_VERSION=$(PHP_VERSION) .

pull:
	docker pull $(NS)/$(IMAGE_NAME):$(PHP_VERSION)

push:
	docker push $(NS)/$(IMAGE_NAME):$(PHP_VERSION)

tag-latest:
	docker tag $(NS)/$(IMAGE_NAME):$(PHP_VERSION) $(NS)/$(IMAGE_NAME):latest

shell:
	-docker pull $(NS)/$(IMAGE_NAME):$(PHP_VERSION)
	docker run --rm --name $(CONTAINER_NAME)$(PHP_VERSION)-$(CONTAINER_INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(PHP_VERSION) /bin/bash

start:
	-docker pull $(NS)/$(IMAGE_NAME):$(PHP_VERSION)
	docker run -d --name $(CONTAINER_NAME)$(PHP_VERSION)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(PHP_VERSION)

stop:
	docker stop $(CONTAINER_NAME)$(PHP_VERSION)-$(CONTAINER_INSTANCE)

rm:
	docker rm $(CONTAINER_NAME)$(PHP_VERSION)-$(CONTAINER_INSTANCE)

release: build
	make tag-latest -e VERSION=$(PHP_VERSION)
	make push -e VERSION=$(PHP_VERSION)
	make push -e VERSION=latest

default: build
