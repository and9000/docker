# Pull base image.
FROM mariadb:10.0.19

# Remove log_bin from config file
RUN sed -ri 's/^(log_bin\t*=\.*)/#\1/' /etc/mysql/my.cnf \
	&& sed -ri 's/^(expire_logs_days\t*=.*)/#\1/' /etc/mysql/my.cnf 
