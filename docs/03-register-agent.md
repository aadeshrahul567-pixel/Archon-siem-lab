# 03 — Registering the Agent with the Manager

---

## Step 1 — Generate Agent Key on the Ubuntu Manager

SSH into (or open a terminal on) your Ubuntu VM and run:

```bash
sudo /var/ossec/bin/manage_agents
```

Follow the prompts:

| Option | Action |
|---|---|
| `A` | Add a new agent |
| Name | Enter a name e.g. `WindowsHost` |
| IP | Leave blank (any IP) unless you need static assignment |
| `E` | Extract the key after creation |

Copy the full key string output — you'll need it on the Windows side.

---

## Step 2 — Apply the Key in the Windows Agent

1. Open **Wazuh Agent Manager GUI** from the Windows Start Menu.
2. Paste the copied key into the **Authentication Key** field.
3. Enter the **Manager IP** (your Ubuntu VM's IP address).
4. Click **Save** then **Restart**.

---

## Step 3 — Verify in the Dashboard

1. Open the Wazuh Dashboard at `https://<ubuntu-vm-ip>`.
2. Navigate to **Agents**.
3. Confirm the Windows agent appears with status **Active** ✅.
