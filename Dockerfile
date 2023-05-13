ARG BASE_IMAGE=docker.io/library/ubuntu:20.04
FROM $BASE_IMAGE

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	git \
	jq \
	python3-pip \
	rsync \
	unzip \
	vim \
	wget \
  sudo \
  rsyslog \
    && apt-get purge --auto-remove -y \
    && rm -rf /var/lib/apt/lists/*

