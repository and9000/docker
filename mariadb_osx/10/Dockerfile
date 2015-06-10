# Pull base image.
FROM ibandrea/mariadb:10.0.19

# Let mariadb run as root
RUN sed -ri 's/^(user\t*=).*/\1\ root/' /etc/mysql/my.cnf