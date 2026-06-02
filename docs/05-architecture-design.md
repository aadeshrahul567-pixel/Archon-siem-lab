# 05 — System Architecture & Design

---

## Architecture Overview

Project ARCHON follows a **7-layer centralized SIEM model**:

```
┌─────────────────────────────────────────────┐
│  7. User Interface Layer                     │  ← SOC Analyst (Web Dashboard)
├─────────────────────────────────────────────┤
│  6. Visualization Layer                      │  ← OpenSearch Dashboards
├─────────────────────────────────────────────┤
│  5. Data Analysis & Modelling Layer          │  ← Rule Engine + MITRE ATT&CK
├─────────────────────────────────────────────┤
│  4. Data Storage Layer                       │  ← Wazuh Indexer (OpenSearch)
├─────────────────────────────────────────────┤
│  3. Data Processing Layer                    │  ← Log cleaning + normalization
├─────────────────────────────────────────────┤
│  2. Data Acquisition Layer                   │  ← Wazuh Agents
├─────────────────────────────────────────────┤
│  1. Data Source Layer                        │  ← Windows endpoints, servers
└─────────────────────────────────────────────┘
```

---

## System Modules

### Data Collection Module
- Wazuh agents installed on Windows/Linux endpoints
- Captures login attempts, process execution, file changes, network activity
- Securely transmits data to the centralized Wazuh Manager

### Data Cleaning Module
- Removes duplicate, incomplete, and irrelevant log entries
- Standardizes timestamps and system identifiers
- Ensures clean, reliable data for analysis

### Data Interpretation Module
- Detects suspicious activity: unauthorized access, abnormal behavior
- Maps threats to **MITRE ATT&CK** techniques
- Enables quick, informed analyst response actions

---

## Functional Requirements

| Requirement | Description |
|---|---|
| User Authentication | SOC analyst securely logs in to the Wazuh dashboard |
| Agent Registration | Endpoints registered using unique authentication keys |
| Log Collection | Collects system logs, security events, and FIM data |
| Secure Transmission | Encrypted log transfer from agents to SIEM server |
| Threat Detection | Real-time log analysis for suspicious activities |
| Alert Generation | Alerts triggered when security rules are violated |
| Dashboard Visualization | Centralized display of alerts, logs, and agent status |

---

## Non-Functional Requirements

| Property | Requirement |
|---|---|
| Performance | Alerts generated instantly on suspicious activity |
| Security | Encrypted transmission between agents and server |
| Usability | Simple, user-friendly dashboard |
| Scalability | Supports adding more endpoints without major reconfiguration |
| Reliability | Continuous monitoring without interruption |
| Maintainability | Easy to update and troubleshoot |
| Availability | Available whenever endpoints are active |

---

## Feasibility

| Type | Assessment |
|---|---|
| Economic | Fully open-source — zero licensing cost. Runs on consumer hardware. |
| Technical | Ubuntu + Wazuh is widely supported. Minimal hardware needed. |
| Social | Monitors only system activity logs. No ethical concerns. Improves data safety. |
