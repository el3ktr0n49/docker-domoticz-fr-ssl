FROM lscr.io/linuxserver/domoticz:latest

ENV LANG="fr_FR.UTF-8" \
LANGUAGE="fr_FR.UTF-8" \
DOMAIN="ratons.ovh"

RUN \
 echo "**** config locales FR ****" && \
 apt-get update && \
 apt-get dist-upgrade -y && \
 apt-get upgrade -y && \
 locale-gen $LANG && \
 ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
 dpkg-reconfigure --frontend noninteractive tzdata && \
 apt-get install -y --no-install-recommends \
 	locales \
	build-essential \
	anacron \
	libcurl4-openssl-dev \
	libusb-dev \
	zlib1g-dev \
	libssl-dev \
	python3-dev && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# copy local files
COPY root/ /
