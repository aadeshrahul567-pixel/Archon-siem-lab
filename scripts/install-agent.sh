#!/bin/bash
# ============================================================
# ARCHON — Wazuh Agent Installation Script (Linux/Ubuntu)
# Run on: Endpoint machines
# ============================================================
set -e

# ---- CONFIGURE THIS ----
MANAGER_IP="192.168.X.X"   # Replace with your Wazuh Manager VM IP
# -------------------------

echo "[*] Installing dependencies..."
sudo apt update && sudo apt install -y curl apt-transport-https

echo "[*] Adding Wazuh repository..."
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" > /etc/apt/sources.list.d/wazuh.list

echo "[*] Installing Wazuh Agent..."
sudo apt update
sudo apt install -y wazuh-agent

echo "[*] Configuring agent to connect to manager at $MANAGER_IP ..."
sed -i "s/<address>.*<\/address>/<address>$MANAGER_IP<\/address>/" \
  /var/ossec/etc/ossec.conf

echo "[*] Enabling and starting Wazuh Agent service..."
sudo systemctl enable --now wazuh-agent

echo ""
echo "[✓] Wazuh Agent installed and connected to $MANAGER_IP"
echo "[!] Remember to register this agent on the manager using manage_agents."
