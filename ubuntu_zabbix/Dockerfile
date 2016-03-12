FROM ubuntu:14.04-update
MAINTAINER lyx

ENV work /work
WORKDIR ${work}
ADD ./zabbix-release_3.0-1+trusty_all.deb ${work}
RUN pwd
RUN ls
RUN dpkg -i zabbix-release_3.0-1+trusty_all.deb
RUN apt-get update
RUN apt-get install -y zabbix-server-mysql zabbix-frontend-php
RUN apt-get install -y supervisor

# mysql
# zabbix
RUN /etc/init.d/mysql start && \
  mysql -e "create database zabbix character set utf8 collate utf8_bin;" && \
  mysql -e "grant all privileges on zabbix.* to 'zabbix'@'localhost' identified by 'zabbix';" && \
  cd /usr/share/doc/zabbix-server-mysql && \
  zcat create.sql.gz | mysql -uroot zabbix
  

# zabbix conf
COPY ./zabbix_server.conf /etc/zabbix/zabbix_server.conf

# supervisor
COPY ./supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord"]
