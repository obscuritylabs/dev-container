TAG ?= latest

.PHONY: build
build:
	docker build -t obscuritylabs/dev-container:${TAG} -f Dockerfile .
.PHONY: push
push:
	docker push obscuritylabs/dev-container:${TAG}
.PHONY: pull
pull:
	docker pull obscuritylabs/dev-container:${TAG}
.PHONY: run
run:
	docker run \
		--net=host \
		--rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-w /root \
		--name dev-container \
		-it obscuritylabs/dev-container:${TAG}
