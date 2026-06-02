# 🛡️ ARCHON — Automated Response and Centralized Hazard Observation Network

> A cost-effective, open-source SIEM + XDR home lab built with **Wazuh**, **OpenSearch Dashboards**, and **Sysmon** — delivering enterprise-grade security monitoring without enterprise costs.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Lab Architecture](#lab-architecture)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Features](#features)
- [Screenshots](#screenshots)
- [Testing](#testing)
- [Conclusion](#conclusion)

---

## Overview

Project ARCHON provides a unified platform for:

- **Real-time log analysis** across endpoints
- **File Integrity Monitoring (FIM)** using Syscheck
- **Automated threat response** (block IPs, isolate endpoints)
- **Vulnerability detection** and CVE mapping
- **MITRE ATT&CK** technique mapping
- **Interactive dashboards** via OpenSearch

Built as an MCA final project at Ramnath Guljarilal Kedia College of Commerce (Affiliated to Osmania University, Hyderabad) — 2024–2026.

**Author:** Inavolu Aadesh Rahul | H.T.NO: 1170-24-862-046  
**Guide:** Mrs. Syeda Baseer Unnisa Begum (I/c Principal)

---

## Lab Architecture

| Component | Host | Role |
|---|---|---|
| Wazuh Manager | Ubuntu 22.04 (VirtualBox) | Collects, analyzes, and stores data from agents |
| Wazuh Agent | Windows 11 (host machine) | Sends logs and system events to the manager |
| OpenSearch Dashboard | Ubuntu (same VM) | Web-based visualization and alert management |

**Network:** VirtualBox **Bridged Adapter** — places Ubuntu on the same network as the Windows host.

```
[ Windows 11 Host ]  →  Wazuh Agent
        |
        |  (Port 1514 UDP — secure log transmission)
        ↓
[ Ubuntu VM — VirtualBox ]
        |
        ├── Wazuh Manager   (log correlation + rules)
        ├── Wazuh Indexer   (OpenSearch — data storage)
        └── Wazuh Dashboard (web UI — https://<ubuntu-ip>)
```

---

## Prerequisites

- VirtualBox installed
- Ubuntu Server 22.04+ (bridged networking)
- Internet access on Ubuntu VM
- Administrative access on Windows host
- 16 GB RAM minimum, 100 GB free disk space
- Stable broadband connection (100 Mbps+)

---

## Installation

### 1. Install Wazuh Manager (Ubuntu VM)

See full guide: [`docs/01-install-wazuh-manager.md`](docs/01-install-wazuh-manager.md)

```bash
# Add GPG Key
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo gpg --dearmor -o \
  /usr/share/keyrings/wazuh-archive-keyring.gpg

# Download and run installation script
curl -sO https://packages.wazuh.com/4.12/wazuh-install.sh && sudo bash ./wazuh-install.sh -a -i
```

### 2. Install Wazuh Agent (Windows Host)

See full guide: [`docs/02-install-wazuh-agent-windows.md`](docs/02-install-wazuh-agent-windows.md)

Download the MSI installer from the [official Wazuh documentation](https://documentation.wazuh.com/current/installation-guide/wazuh-agent/wazuh-agent-package-windows.html) and install with default settings.

### 3. Register Agent with Manager

See full guide: [`docs/03-register-agent.md`](docs/03-register-agent.md)

### 4. Configure File Integrity Monitoring

See full guide: [`docs/04-file-integrity-monitoring.md`](docs/04-file-integrity-monitoring.md)

---

## Configuration

| File | Purpose |
|---|---|
| [`config/ossec-manager.conf`](config/ossec-manager.conf) | Wazuh Manager core configuration |
| [`config/ossec-agent.conf`](config/ossec-agent.conf) | Agent configuration with FIM and syscheck |
| [`config/agent-group.conf`](config/agent-group.conf) | Agent group-level syscheck settings |
| [`scripts/install-manager.sh`](scripts/install-manager.sh) | Automated manager install script |
| [`scripts/install-agent.sh`](scripts/install-agent.sh) | Automated agent install script |

---

## Features

| Feature | Description |
|---|---|
| 🔍 Real-Time Threat Detection | Instant alerts for brute-force, privilege escalation, malware |
| 📁 File Integrity Monitoring | Tracks who modified files, what changed, and when |
| 🤖 Automated Response | Blocks attacker IPs via firewall rules automatically |
| 🧩 MITRE ATT&CK Mapping | Detected threats mapped to ATT&CK techniques |
| 📊 OpenSearch Dashboards | Interactive charts, heatmaps, and event timelines |
| 🔎 Vulnerability Management | Auto-scans endpoints for known CVEs |
| 📋 Compliance Support | Covers PCI DSS, HIPAA requirements via FIM |

---

## Screenshots

| Screenshot | Description |
|---|---|
| ![FIM Dashboard](screenshots/fim-dashboard.png) | File Integrity Monitoring overview |
| ![FIM Logs](screenshots/fim-logs.png) | FIM log collection details |
| ![Endpoint Management](screenshots/endpoint-management.png) | MITRE ATT&CK tactics and compliance view |
| ![Threat Management](screenshots/threat-management.png) | Threat hunting and alert dashboard |
| ![Vulnerabilities](screenshots/vulnerabilities.png) | CVE vulnerability detection |

---

## Testing

All test cases passed. See [`docs/06-testing.md`](docs/06-testing.md) for full test case table.

| Test ID | Module | Scenario | Result |
|---|---|---|---|
| TC_01 | Manager | Web Dashboard access | ✅ Pass |
| TC_02 | Agent | Agent connection validation | ✅ Pass |
| TC_03 | Detection | Brute Force Simulation (10x failed logins) | ✅ Pass |
| TC_04 | Response | Automated IP blocking | ✅ Pass |
| TC_05 | FIM | File integrity alert on config.sys modification | ✅ Pass |
| TC_06 | Execution | Malicious PowerShell detection | ✅ Pass |
| TC_07 | Recon | Nmap port scan detection | ✅ Pass |
| TC_08 | Web Sec | SQL Injection URI pattern detection | ✅ Pass |
| TC_09 | Persistence | Scheduled task creation alert | ✅ Pass |

---

## Conclusion

Project ARCHON proves that enterprise-level SOC capabilities can be achieved using free, open-source tools on consumer hardware. The framework significantly reduces Mean Time to Detect (MTTD) and Mean Time to Respond (MTTR), providing a scalable blueprint for real-world security operations.

---

## 📚 References

- [Wazuh Official Documentation](https://documentation.wazuh.com)
- [MITRE ATT&CK Framework](https://attack.mitre.org)
- [OpenSearch Dashboards](https://opensearch.org)
- [Wazuh Home Lab Video Guide](https://youtu.be/QT81wcuoRFY) by Royden Rebello (The Social Dork)

---

*Submitted in partial fulfillment of the requirements for the award of Master of Computer Applications — Osmania University, Hyderabad, 2024–2026.*
