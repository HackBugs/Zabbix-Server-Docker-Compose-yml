> # Install `docker-compose`  ✅

---

## **Docker Compose Install Karne Ka Tarika (RHEL 7/8/9 & CentOS 7/8/9)**
### **Step 1: Docker Compose Download Karein**
```bash
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

### **Step 2: Isko Executable Banayein**
```bash
sudo chmod +x /usr/local/bin/docker-compose
```

### **Step 3: System-wide Link Banayein**
```bash
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

### **Step 4: Verify Karein**
```bash
docker-compose version
```
Agar yeh command successfully run ho gaya, toh installation sahi se ho gaya hai. ✅

---

## **Agar Aap Docker Compose Plugin Use Kar Rahe Hain**
RHEL 9 aur naye versions me **`docker-compose`** command nahi hota, balki **`docker compose`** hota hai.

Agar aapko `docker-compose` nahi mil raha, toh yeh install karein:
```bash
sudo dnf install -y docker-compose-plugin
```

Aur check karein:
```bash
docker compose version
```

**Toh ab aapke paas 2 tarike hain:**
1. **`docker-compose` install karna** (agar aap traditional method chahte hain)
2. **`docker compose` plugin use karna** (naya tarika, jo Docker me built-in hai)
