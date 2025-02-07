docker run -d \
  --name zabbix-db \
  -e MYSQL_ROOT_PASSWORD=root_password \
  -e MYSQL_DATABASE=zabbix \
  -e MYSQL_USER=zabbix \
  -e MYSQL_PASSWORD=zabbix_password \
  --network zabbix-net \
  mysql:8.0
