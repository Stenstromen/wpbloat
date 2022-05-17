#!/bin/bash
#/usr/sbin/mysqld --user=root && sleep 5 && nginx -c /etc/nginx/sites-enabled/wp.conf -g "pid /var/run/nginx.pid; worker_processes 2;"
#sleep 5 &&\
#mysql -uroot -h localhost -e "CREATE DATABASE wpdb; GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost' IDENTIFIED BY 'passwd'; FLUSH PRIVILEGES" &&\
#nginx -c /etc/nginx/sites-enabled/wp.conf -g "pid /var/run/nginx.pid; worker_processes 2;"
#echo hello

/sbin/service mariadb start &
sleep 10 && mysql -uroot -e "CREATE DATABASE wpdb; GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost' IDENTIFIED BY 'passwd'; FLUSH PRIVILEGES" && nginx -c /etc/nginx/sites-enabled/wp.conf -g "pid /var/run/nginx.pid; worker_processes 2;"