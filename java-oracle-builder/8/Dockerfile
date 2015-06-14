FROM debian:jessie
MAINTAINER Andrea Lorenzetti <andrea@ibuildings.it>

ENV JAVA_VERSION 	8u45

ENV LC_ALL      	C
ENV JAVA_HOME   	/usr/lib/jvm/jdk-8-oracle-x64

ENV JDK_FILE		jdk-$JAVA_VERSION-linux-x64.tar.gz
ENV JDK_HTTP_PATH	http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-b14/$JDK_FILE

RUN deps=" \
	java-package \
	nano \
	java-common \
	libgl1-mesa-glx \
	libgtk2.0-0 \
	libxslt1.1 \
	libxtst6 \
	libxxf86vm1 \
	wget \
	" \
	&& buildDeps=" \
	build-essential \
	" \
	&& set -x \
	&& sed -ri 's/(.*\ main)/\1\ contrib non-free/' /etc/apt/sources.list \
    && export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get upgrade -y $buildDeps $deps --no-install-recommends \
	\
	&& cd /tmp \
	&& wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "$JDK_HTTP_PATH" \
	&& useradd -r tmpuser \
	&& chown tmpuser $JDK_FILE \
	&& su tmpuser -c "yes | fakeroot make-jpkg $JDK_FILE" \
	&& userdel tmpuser \
	&& dpkg -i oracle*deb \
	&& update-alternatives --install /usr/lib/mozilla/plugins/mozilla-javaplugin.so iceweasel-javaplugin.so $JAVA_HOME/jre/lib/amd64/libnpjp2.so 1 \
	&& update-java-alternatives -s $JAVA_HOME \
	\
	&& apt-get clean \
	&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $buildDeps \
	&& rm -rf /var/lib/apt/lists/* /var/tmp/* 
	#&& rm -rf /tmp/* 
