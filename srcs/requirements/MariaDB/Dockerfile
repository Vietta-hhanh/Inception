FROM debian:buster

RUN mkdir -p /var/lib/mysql
EXPOSE 3306
RUN apt update && apt install -y mariadb-server mariadb-client
ARG MYSQL_ROOT_PASSWORD MYSQL_USER MYSQL_PASSWORD MYSQL_DATABASE
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/initdb.sh .

RUN chown -R mysql:mysql /var/lib/mysql && bash initdb.sh && rm -rf initdb.sh
USER mysql
CMD /usr/bin/mysqld_safe