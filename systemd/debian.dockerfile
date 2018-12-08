ARG DEBIAN_VERSION=9
FROM debian:${DEBIAN_VERSION}

RUN apt-get update \
	&& apt-get install -y \
		systemd \
		systemd-sysv \
		python3 \
		python3-pip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& find /etc/systemd/system \
		/lib/systemd/system \
		-path '*.wants/*' \
		-not -name '*journald*' \
		-not -name '*systemd-tmpfiles*' \
		-not -name '*systemd-user-sessions*' \
		-delete -print \
	&& systemctl set-default multi-user

STOPSIGNAL SIGRTMIN+3
ENTRYPOINT ["/sbin/init"]
