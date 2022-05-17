#!/bin/bash
#/usr/sbin/mysqld --user=mysql & \
#sleep 5 &&\
#mysql -uroot -h localhost -e "CREATE DATABASE wpdb; GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost' IDENTIFIED BY 'passwd'; FLUSH PRIVILEGES" &&\
#nginx -c /etc/nginx/sites-enabled/wp.conf -g "pid /var/run/nginx.pid; worker_processes 2;"
echo hello