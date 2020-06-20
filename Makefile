.PHONY: build docker-version

IMAGE_NAME:=jenkins-jnlp-docker

build:
	docker build -t ${IMAGE_NAME} .

docker-version:
	docker run --entrypoint /usr/bin/apt-cache ${IMAGE_NAME} madison docker-ce
