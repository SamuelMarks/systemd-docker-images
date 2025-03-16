ARG IMAGE_BASE='debian'
ARG IMAGE_TAG='stable-slim'
FROM ${IMAGE_BASE}:${IMAGE_TAG}

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
