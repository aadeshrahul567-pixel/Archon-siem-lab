# 02 — Installing the Wazuh Agent (Windows Host)

Run these steps on your **Windows 11 host machine**.

---

## Step 1 — Download the Installer

Download the latest Wazuh Agent MSI installer from the official documentation:

👉 [Wazuh Agent for Windows](https://documentation.wazuh.com/current/installation-guide/wazuh-agent/wazuh-agent-package-windows.html)

---

## Step 2 — Install the MSI Package

Run the downloaded `.msi` file and follow the installation wizard using **default settings**.

After installation, the Wazuh Agent service will be installed but not yet connected to a manager.

---

## Step 3 — Configure the Manager IP

Open the Wazuh Agent configuration file:

```
C:\Program Files (x86)\ossec-agent\ossec.conf
```

Find the `<client>` block and set the manager's IP address:

```xml
<client>
  <server>
    <address>192.168.X.X</address>  <!-- Replace with your Ubuntu VM IP -->
    <port>1514</port>
    <protocol>udp</protocol>
  </server>
</client>
```

---

## Next Step

Proceed to [03 — Register Agent with Manager](03-register-agent.md) to generate and apply the authentication key.
