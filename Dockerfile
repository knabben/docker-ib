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
    auditd \
	wget \
    software-properties-common \
    rsyslog \
    systemd \
    systemd-cron \
    sudo \
    && apt-get purge --auto-remove -y \
    && rm -rf /var/lib/apt/lists/*


RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf
RUN rm -f /lib/systemd/system/systemd*udev* \
  && rm -f /lib/systemd/system/getty.target

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]

