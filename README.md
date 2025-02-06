# **Zabbix Server Setup Using Docker Compose**  

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

✅ **Zabbix Server is now running on Docker!** 🚀


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
