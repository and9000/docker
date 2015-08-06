FROM debian:8.1
MAINTAINER Andrea Lorenzetti <andrea@ibuildings.it>

ENV JAVA_VERSION 	8u51

ENV LC_ALL      	C
ENV JAVA_HOME   	/usr/lib/jvm/jre-8-oracle-x64/

ENV JRE_FILE		server-jre-$JAVA_VERSION-linux-x64.tar.gz
ENV JRE_HTTP_PATH	http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-b16/$JRE_FILE

RUN binDeps=" \
	libx11-6 \
	libxext6 \
	libxi6 \
	libxtst6 \
	libasound2 \
	libxrender1 \
	" && \
	buildDeps=" \
	build-essential \
	java-package \
	wget \
	" && \
	\
	set -x && \
	sed -ri 's/(.*\ main)/\1\ contrib non-free/' /etc/apt/sources.list && \
    export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get upgrade -y $binDeps $buildDeps --no-install-recommends && \
	\
	cd /tmp && \
	wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "$JRE_HTTP_PATH" && \
	useradd -r tmpuser && \
	chown tmpuser $JRE_FILE && \
	su tmpuser -c "yes | fakeroot make-jpkg $JRE_FILE" && \
	userdel tmpuser && \
	dpkg -i oracle-java*.deb && \
	\
	apt-get clean && \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $buildDeps && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
