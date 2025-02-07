
```
sudo firewall-cmd --add-service={http,https} --permanent
sudo firewall-cmd --add-port=10050/tcp --permanent
sudo firewall-cmd --add-port=10051/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

sudo netstat -tulnp | grep 10051
ping zabbix-server
nslookup zabbix-server

docker network create zabbix-net
docker logs -f zabbix-server

docker ps | grep zabbix-server
docker ps -a | grep zabbix-server
docker start zabbix-server

docker network connect zabbix-net zabbix-server
docker network inspect zabbix-net
docker restart zabbix-db zabbix-server
docker exec -it zabbix-server bash
mysql -h zabbix-db -u zabbix -pzabbix_password
```

> # **Zabbix Server Setup Using Docker Compose**  ✅

## **Step-by-Step Guide**  

### **1️⃣ Install Docker**  
Follow the official Docker documentation to install Docker on your machine:  
🔗 [Docker Installation Guide](https://docs.docker.com/get-docker/)  

---

### **2️⃣ Open Your Linux Machine**  
Ensure you are on a **Linux system** where Docker is installed.  

---

### **3️⃣ Create a Directory for Zabbix**  
Run the following command to create a directory and navigate inside it:  
```bash
mkdir zabbix-docker && cd zabbix-docker
```

Now, create a **docker-compose.yml** file inside this directory:  
```bash
vi docker-compose.yml
```
Paste your **Zabbix Docker Compose YAML configuration** into this file and save it.

---

### **4️⃣ Start Zabbix Using Docker Compose**  
Run the following command inside the `zabbix-docker` directory:  
```bash
docker compose -f docker-compose.yml up -d
```
This will start the Zabbix server in detached mode (`-d`).

---

### **5️⃣ Wait for Zabbix to Start**  
The setup may take **around 5 minutes**.  

Once running, use the following credentials to log in:

#### **📌 PHPMyAdmin Credentials:**  
- **Username:** `root`  
- **Password:** `root_password`  

#### **📌 Zabbix Admin Credentials:**  
- **Username:** `Admin`  
- **Password:** `zabbix`  

---

✅ **Zabbix Server is now running on Docker!** 🚀 [YouTube Video Link](https://youtu.be/6p7B6qBtnos?si=b09sJVvaLwuXX52H)

<hr>

> # Agar aapne laptop reboot kar diya hai, toh aapke **Docker containers stop ho gaye honge**. Aapko unko **restart** karne ke liye niche diye gaye steps follow karne honge.  ✅

- **Enter Inside of Container:**
```
docker exec -it <container_name_or_id> bash
docker container exec -it <container_name_or_id> bash 
```

---

## **🔄 Containers Restart Karne Ka Tarika**  

### **1️⃣ Check Running Containers**  
Sabse pehle dekho ki koi container chalu hai ya nahi:  
```bash
docker ps -a
```
Agar aapke Zabbix containers **STOPPED** dikh rahe hain, toh unko start karna hoga.

---

### **2️⃣ Restart All Containers from `docker-compose.yml`**  
Agar aapne containers **docker-compose.yml** se chalaye the, toh unko wapas start karne ka best tarika ye hai:  
```bash
docker compose -f docker-compose.yml up -d
```
Yeh command **containers ko wapas start karegi** bina naye containers create kiye.

---

### **3️⃣ Start Containers Manually (Alternative Method)**  
Agar aap sirf existing containers start karna chahte ho, toh yeh command run karo:  
```bash
docker start $(docker ps -aq)
```
Yeh **sab stopped containers ko wapas start** karega.

Agar sirf specific containers (jaise `zabbix-server` aur `zabbix-db`) start karne hain, toh:  
```bash
docker start zabbix-server zabbix-db
```

---

### **4️⃣ Check If Everything is Running**  
Containers sahi se start hue ya nahi, yeh check karne ke liye:  
```bash
docker ps
```
Agar sab kuch sahi se chalu ho gaya hai, toh **containers running mode me dikhne chahiye**.

---

## **🎯 Important: Auto-Start Enable Karna**
Agar aap chahte ho ki **containers reboot ke baad automatically start ho jayein**, toh **restart policy** enable karo:  
```bash
docker update --restart unless-stopped $(docker ps -aq)
```
Isse **reboot ke baad bhi containers automatically start ho jayenge**.

---

## **✅ Final Check**
1. **Zabbix Server Running Check**:  
   ```bash
   docker logs zabbix-server | tail -n 20
   ```
2. **Zabbix Web Access**:  
   Browser me `http://localhost:8080` open karke dekho.

<hr>

> # Agar **sabhi containers ko down (stop) karna hai**, toh yeh command use karo:  ✅

```sh
docker stop $(docker ps -aq)
```
🔹 **`docker ps -aq`** → Yeh sabhi containers ke IDs deta hai.  
🔹 **`docker stop`** → Yeh sabhi running containers ko stop karega.  

---

### **Agar Sabhi Containers Ko Delete Karna Hai (Optional)**
Agar **sabhi containers ko remove (delete) bhi karna hai**, toh:  
```sh
docker rm $(docker ps -aq)
```
⚠️ **Warning:** Yeh **sabhi stopped containers** delete kar dega.  

Agar **sabhi images** bhi delete karni ho, toh:  
```sh
docker rmi $(docker images -q)
```

<hr>

> # Passwords of **Docker Compose file** ✅  

---

### **🔐 MySQL (Zabbix Database)**
| **Parameter**         | **Value**             |
|----------------------|----------------------|
| **Root Password**    | `root_password`      |
| **Database Name**    | `zabbix`             |
| **Database User**    | `zabbix`             |
| **Database Password**| `zabbix_password`    |

---

### **🔐 Zabbix Server & Web Interface**
| **Parameter**        | **Value**              |
|----------------------|----------------------|
| **Zabbix Admin User** | `Admin` (default)  |
| **Zabbix Admin Password** | `zabbix` (default) |

---

### **🔐 phpMyAdmin (for MySQL Management)**
| **Parameter**         | **Value**             |
|----------------------|----------------------|
| **MySQL Root Password** | `root_password`  |
| **PMA Host**          | `zabbix-db`         |

---

## **📌 Default Login Steps**
1️⃣ Open **Zabbix Web Interface**: `http://localhost:8080`  
2️⃣ Login karein:  
   - **Username:** `Admin`  
   - **Password:** `zabbix`  

3️⃣ Open **phpMyAdmin**: `http://localhost:8081`  
   - **Username:** `root`  
   - **Password:** `root_password`  

<!--

1. Download Docker follow officil documentation
2. Open you linux machine
3. Create dir directorie and that directorie carete a file docker-compose.yml and paste inside there yml code
4. Indide that folder run this cmd
```
docker compose -f docker-compose.yml up -d
```
5. wait a 5 minutes and tha use this pssword for PHP Admin And Zabbix
  - PHP Admin id - root
  - PHP Admin Pass - root_password

  - Zabbix Admin id - Admin
  - Zabbix Admin Pass - zabbix
  
  -->
