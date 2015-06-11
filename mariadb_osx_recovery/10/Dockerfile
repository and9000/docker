# Pull base image.
FROM ibandrea/mariadb_osx:10.0.19

COPY docker-entrypoint.sh /

# Remove log_bin from config file
#RUN sed -ri 's/^(log_bin\t*=\.*)/#\1/' /etc/mysql/my.cnf \
#	&& sed -ri 's/^(expire_logs_days\t*=.*)/#\1/' /etc/mysql/my.cnf 
