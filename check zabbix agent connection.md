### ✅ **Zabbix Agent Port 10050 Listen Kar Raha Hai, But Connection Issue Hai**  
Aapke netstat output se confirm ho gaya hai ki **Zabbix Agent 10050 port pe listen kar raha hai**, lekin phir bhi **Zabbix Server se connect nahi ho raha**.  

---

## **🔍 1️⃣ Check Karo Ki Agent Container Ka IP Address Kya Hai**  
Sabse pehle **Zabbix Agent ka Docker Container IP Address check karo:**  

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zabbix-agent
```
Agar output kuch aisa aaye:  
```
172.18.0.5
```
Toh ye **Zabbix Agent ka internal IP hai**, jo Zabbix Server ko use karna chahiye.  

---

## **🔍 2️⃣ Zabbix Server Se Ping Karo Ki Agent Accessible Hai Ya Nahi**  
Zabbix Server ke andar jaake **Zabbix Agent ka IP Ping Karo**:  

```bash
docker exec -it zabbix-server ping -c 4 172.18.0.5
```
**Agar ping fail ho raha hai**, toh iska matlab **Agent aur Server alag networks pe hain**.  
Toh **Docker Network Bridge Check Karo:**  
```bash
docker network ls
```
Aur **dono containers ko ek hi network me daalo**:  
```bash
docker network connect <network_name> zabbix-agent
docker network connect <network_name> zabbix-server
```

---

## **🔍 3️⃣ Zabbix Agent Ki Configuration File Check Karo**  
Agar network sahi hai phir bhi nahi chal raha, toh **Agent ke andar `zabbix_agent2.conf` check karo**:  

```bash
docker exec -it zabbix-agent cat /etc/zabbix/zabbix_agent2.conf | grep "Server="
```
Agar output kuch aisa hai:  
```ini
Server=127.0.0.1
ServerActive=127.0.0.1
```
Toh **ye galat hai**, kyunki **Server aur Agent alag containers me hain**.  
Isko **correct karo**:  
```ini
Server=zabbix-server
ServerActive=zabbix-server
ListenPort=10050
```
Aur **restart karo**:  
```bash
docker restart zabbix-agent
```

---

## **🔍 4️⃣ Zabbix Server Pe Agent Check Karo**  
Zabbix Server ke andar **manually check karo ki Agent accessible hai ya nahi:**  

```bash
zabbix_get -s 172.18.0.5 -p 10050 -k agent.ping
```
Agar output `1` aata hai toh **connection theek hai**.  
Agar **connection refused aata hai**, toh **firewall check karo**:

```bash
sudo firewall-cmd --add-port=10050/tcp --permanent
sudo firewall-cmd --reload
```

---

## **📌 Conclusion**
✅ **Agent Docker IP (172.x.x.x) find karo aur Server se ping karo**  
✅ **Agent ka `zabbix_agent2.conf` me Server IP ya name change karo**  
✅ **Agent ko ek hi Docker network me daalo jo Server use kar raha hai**  
✅ **Server se `zabbix_get -s 172.x.x.x -p 10050 -k agent.ping` run karo**  
