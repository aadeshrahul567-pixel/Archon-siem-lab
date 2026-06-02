# 04 — File Integrity Monitoring (FIM) on Windows

Wazuh uses **Syscheck** to monitor file and folder changes in real time.

---

## Step 1 — Edit the Agent Configuration

Open the agent configuration file on the Windows host:

```
C:\Program Files (x86)\ossec-agent\ossec.conf
```

Add the following inside the `<syscheck>` block to monitor a specific folder:

```xml
<syscheck>
  <frequency>3600</frequency>

  <!-- Real-time monitoring of a custom folder -->
  <directories realtime="yes">C:\Users\YourUsername\Test</directories>

  <!-- Monitor critical system directories -->
  <directories check_all="yes">C:\Windows\System32\drivers\etc</directories>
</syscheck>
```

> Replace `C:\Users\YourUsername\Test` with the actual folder you want to monitor.

---

## Step 2 — Restart the Agent

After saving changes, restart the Wazuh agent service:

**Option A — GUI:**  
Open Wazuh Agent Manager → click **Restart**

**Option B — PowerShell (Admin):**
```powershell
Restart-Service -Name "WazuhSvc"
```

---

## Step 3 — Verify FIM Alerts

1. Open the Wazuh Dashboard.
2. Navigate to **File Integrity Monitoring**.
3. Create, modify, or delete a file inside the monitored folder.
4. Confirm alerts appear in the dashboard showing the file path, event type, and timestamp.

---

## What FIM Detects

| Event | Description |
|---|---|
| `added` | A new file was created in the monitored directory |
| `modified` | An existing file was changed |
| `deleted` | A file was removed |

FIM is critical for compliance (PCI DSS, HIPAA) as it provides an audit trail of all file changes.
