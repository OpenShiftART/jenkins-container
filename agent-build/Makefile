#!/usr/bin/make -f

IMAGE_NAME = "markllama/cd-jenkins-agent-build"

DOCKER_GROUP = docker
DOCKER_GID = `grep ${DOCKER_GROUP} /etc/group | cut -d: -f3`

build:
	docker build -t ${IMAGE_NAME} .

clean:
	-docker rm -f ${IMAGE_NAME}

run:
	docker run -it --rm \
	--name jenkins-agent \
	--volume ~/jenkins-agent-keys:/jenkins/agent/.ssh:z \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	-e MASTER_SERVER=${MASTER_SERVER} \
	-e AGENT_NAME=${AGENT_NAME} \
	-e AGENT_SECRET=${AGENT_SECRET} \
	-e JENKINS_UID=`id -u` \
	-e JENKINS_GID=`id -g` \
  -e DOCKER_GID=${DOCKER_GID} \
	${IMAGE_NAME}

rund:
	docker run -d \
	--name jenkins-agent \
	--volume ~/jenkins-agent-keys:/jenkins/agent/.ssh:z \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	-e MASTER_SERVER=${MASTER_SERVER} \
	-e AGENT_NAME=${AGENT_NAME} \
	-e AGENT_SECRET=${AGENT_SECRET} \
	-e JENKINS_UID=`id -u` \
	-e JENKINS_GID=`id -g` \
  -e DOCKER_GID=${DOCKER_GID} \
	${IMAGE_NAME}