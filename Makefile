#!/usr/bin/make -f
IMAGE := rabrowne/phalcon

.PHONY: all build push

# ------------------------------------------------------------------------------

all: build

build:
	docker build -t=$(IMAGE):7.3 -t=$(IMAGE):latest -f 7.3/apache/Dockerfile .
	docker build -t=$(IMAGE):7.2 -f 7.2/apache/Dockerfile .
	docker build -t=$(IMAGE):7.1 -f 7.1/apache/Dockerfile .
	docker build -t=$(IMAGE):7.0 -f 7.0/apache/Dockerfile .

push:
	docker push $(IMAGE):7.3
	docker push $(IMAGE):7.2
	docker push $(IMAGE):7.1
	docker push $(IMAGE):7.0
	docker push $(IMAGE):latest
