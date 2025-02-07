docker run -d \
  --name zabbix-server \
  -e DB_SERVER_HOST=zabbix-db \
  -e MYSQL_DATABASE=zabbix \
  -e MYSQL_USER=zabbix \
  -e MYSQL_PASSWORD=zabbix_password \
  --network zabbix-net \
  -p 10051:10051 \
  zabbix/zabbix-server-mysql:latest
