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
    	systemd-sysv \
    	systemd-cron \
    	sudo \
	&& apt-get purge --auto-remove -y \
	&& rm -rf /var/lib/apt/lists/*

RUN cd /lib/systemd/system/sysinit.target.wants/     && rm $(ls | grep -v systemd-tmpfiles-setup) # buildkit
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
	/etc/systemd/system/*.wants/* \
	/lib/systemd/system/local-fs.target.wants/* \
	/lib/systemd/system/sockets.target.wants/*udev* \
	/lib/systemd/system/sockets.target.wants/*initctl* \
	/lib/systemd/system/basic.target.wants/*     \
	/lib/systemd/system/anaconda.target.wants/*     \
	/lib/systemd/system/plymouth*     \
	/lib/systemd/system/systemd-update-utmp* # buildkit

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]


