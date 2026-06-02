# 06 — System Testing

---

## Testing Types

### Unit Testing
Individual components tested in isolation — Wazuh agent, manager, FIM module, alert engine, and dashboard. Validated agent registration, log forwarding, file modification detection, and alert generation.

### Integration Testing
Verified seamless communication between Wazuh agent → manager → dashboard. Confirmed FIM events on the client machine are reflected as alerts in the centralized dashboard.

### Functional Testing
Validated all functional requirements: agent registration, real-time FIM, log collection, alert visualization, and MITRE ATT&CK mapping.

### White Box Testing
Internal structure and logic of each component tested with knowledge of the codebase — covers paths unreachable by black box testing.

### Black Box Testing
System tested purely on inputs and outputs without knowledge of internal workings — based on specification requirements.

---

## Test Cases

| Test Case ID | Module | Test Description | Input | Expected Result | Status |
|---|---|---|---|---|---|
| TC_01 | Manager | Verify Web Dashboard access | Manager URL | Wazuh GUI loads | ✅ Pass |
| TC_02 | Agent | Validate Agent connection | Agent ID | Status shows 'Active' | ✅ Pass |
| TC_03 | Detection | Brute Force Simulation | 10x Failed Logins | Alert Level 10 triggered | ✅ Pass |
| TC_04 | Response | Automated Blocking | Attack Trigger | Attacker IP blocked by Firewall | ✅ Pass |
| TC_05 | FIM | File Integrity Monitoring | Modifying config.sys | Integrity alert created | ✅ Pass |
| TC_06 | Execution | Detect Malicious Scripts | PowerShell Command | Process creation alert flagged | ✅ Pass |
| TC_07 | Recon | Port Scanning Detection | Nmap Scan | Network reconnaissance alert | ✅ Pass |
| TC_08 | Web Sec | SQL Injection Attempt | Malicious URI | SQLi pattern detected | ✅ Pass |
| TC_09 | Persistence | Scheduled Task Monitor | New task creation | Persistence alert triggered | ✅ Pass |

**All 9 test cases passed ✅**
