# 01 — Installing the Wazuh Manager (Ubuntu)

Run all steps on your **Ubuntu VirtualBox server**.

---

## Step 1 — Add Wazuh GPG Key

```bash
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo gpg --dearmor -o \
  /usr/share/keyrings/wazuh-archive-keyring.gpg
```

This adds the GPG key used to verify Wazuh packages.

---

## Step 2 — Download and Execute the Installation Script

```bash
curl -sO https://packages.wazuh.com/4.12/wazuh-install.sh && sudo bash ./wazuh-install.sh -a -i
```

| Flag | Meaning |
|---|---|
| `-a` | Installs all components (manager, indexer, dashboard) |
| `-i` | Runs in interactive mode |

The script automatically installs and configures all required services.

---

## Step 3 — Access the Wazuh Dashboard

After installation completes:

```bash
# Check your Ubuntu VM's IP address
ifconfig
```

Open a browser and navigate to:

```
https://<ubuntu-vm-ip>
```

1. Accept the browser security warning (self-signed certificate).
2. Log in using the credentials shown at the end of the install script output.

---

## Step 4 — Verify Services Are Running

```bash
sudo systemctl status wazuh-manager
sudo systemctl status wazuh-indexer
sudo systemctl status wazuh-dashboard
```

All three should show `active (running)`.

---

## Network Configuration

Use **Bridged Adapter** in VirtualBox settings so the Ubuntu VM sits on the same network as your Windows host. This allows direct communication between the agent and manager.
