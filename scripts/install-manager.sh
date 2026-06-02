#!/bin/bash
# ============================================================
# ARCHON — Wazuh Manager Installation Script
# Run on: Ubuntu Server 22.04+
# ============================================================
set -e

echo "[*] Updating system packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl apt-transport-https gnupg lsb-release

echo "[*] Adding Wazuh GPG key..."
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" > /etc/apt/sources.list.d/wazuh.list

echo "[*] Installing Wazuh Manager, API, and Dashboard..."
sudo apt update
sudo apt install -y wazuh-manager wazuh-api wazuh-dashboard

echo "[*] Enabling and starting services..."
sudo systemctl enable --now wazuh-manager wazuh-api wazuh-dashboard

echo ""
echo "[✓] Wazuh Manager installation complete!"
echo "[✓] Access the dashboard at: https://$(hostname -I | awk '{print $1}')"
echo "[!] Use the credentials displayed during installation to log in."
