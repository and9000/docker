FROM ibandrea/server-jre-oracle:8u51
MAINTAINER Andrea Lorenzetti <andrea@ibuildings.it>

ENV JIRA_VERSION 6.4.9

ENV MYSQL_CONNECTOR_JAVA_VERSION 5.1.36

ENV JIRA_HOME     /var/local/atlassian/jira
ENV JIRA_INSTALL  /usr/local/atlassian/jira

RUN deps=" \
	libtcnative-1 xmlstarlet \
	wget \
	" \
	set -x && \
    export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get upgrade -y $deps --no-install-recommends && \
	\
	cd /tmp && \
	wget --no-check-certificate http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-$JIRA_VERSION.tar.gz && \
	mkdir -p $JIRA_INSTALL && \
	tar zxf atlassian-jira-$JIRA_VERSION.tar.gz --strip=1 -C $JIRA_INSTALL && \
	mkdir -p $JIRA_HOME && \
	echo -e "\njira.home=$JIRA_HOME" >> "$JIRA_INSTALL/atlassian-jira/WEB-INF/classes/jira-application.properties" && \
	chown -R daemon:daemon $JIRA_HOME && \
	chown -R daemon:daemon $JIRA_INSTALL && \
	\
	wget --no-check-certificate http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION.tar.gz && \
	tar xzf mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION.tar.gz -C /tmp && \
	cp /tmp/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION-bin.jar $JIRA_INSTALL/lib/ && \
	\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER daemon:daemon

VOLUME ["/var/local/atlassian/jira"]

EXPOSE 8080

CMD ["/usr/local/atlassian/jira/bin/start-jira.sh", "-fg"]