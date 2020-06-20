# Jenkins Agent with Docker and Docker Compose

![Docker Pulls](https://img.shields.io/docker/pulls/jonasdrotleff/jenkins-jnlp-docker)[https://hub.docker.com/r/jonasdrotleff/jenkins-jnlp-docker]

This image is based upon the Debian Buster JDK 11 version of
[`jenkins/inbound-agent`](https://hub.docker.com/r/jenkins/inbound-agent/)
and provides a Jenkins agent with Docker and Docker Compose preinstalled.

## Usage

**Linux**:
```bash
docker run --init jonasdrotleff/jenkins-jnlp-docker:latest -url <JENKINS_URL> <secret> <agent name>
```

Once your agent is connected with Jenkins, you can use the Docker Plugin
to build Dockerfiles, run commands in Containers, etc.

For more information about the JNLP agent, see 
[jenkinsci/docker-inbound-agent](https://github.com/jenkinsci/docker-inbound-agent).
