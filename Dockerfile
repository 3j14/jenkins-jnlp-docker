ARG AGENT_VERSION=4.3-4-jdk11
FROM jenkins/inbound-agent:$AGENT_VERSION

ARG version=1.0.0
LABEL Description="Inbound Jenkins Agent (JNLP) with Docker and Docker Compose" maintainer="jonas@drtlf.de" Version="$version"

ARG DOCKER_GID=998
ARG DOCKER_VERSION="5:19.03.11~3-0~debian-buster"
ARG DOCKER_COMPOSE_VERSION="1.26.0"

USER root

RUN apt-get update
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update
RUN apt-get install -y docker-ce=$DOCKER_VERSION docker-ce-cli=$DOCKER_VERSION containerd.io

# Install Docker Compose
RUN curl -sL \
    "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

RUN groupmod -g $DOCKER_GID docker
RUN usermod -aG docker jenkins

USER jenkins
