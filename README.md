# Kali Anon Script

A simple Bash script to enhance basic anonymity on Kali Linux by changing the MAC address, configuring a firewall, setting the timezone to UTC, and optionally clearing logs:

- Changes the MAC address of the active network interface.
- Configures UFW firewall to block incoming traffic and allow outgoing HTTP/HTTPS (ports 80 and 443).
- Sets the system timezone to UTC.
- Optionally clears basic logs (`/var/log/syslog` and `/var/log/auth.log`) with a 3-second delay to cancel.

## Requirements
Before running the script, ensure the following tools are installed on your Kali Linux system:
- `macchanger`: To spoof the MAC address.
- `ufw`: Uncomplicated Firewall for managing firewall rules.
- Basic utilities like `ip`, `awk`, and `sed` (usually pre-installed on Kali).

### Installation Commands
Run these commands in the terminal to install the required tools:
```bash
sudo apt update && sudo apt install macchanger ufw -y
````

### Script Details
The script performs the following actions:

- Interface Detection: Automatically detects the active network interface (e.g., eth0, wlan0) using ip link.
- MAC Address Change: Randomizes the MAC address with macchanger.
- Firewall Setup: Resets UFW, denies incoming traffic, allows outgoing traffic, and permits TCP ports 80 and 443.
- Timezone Adjustment: Sets the system timezone to UTC using timedatectl.
- Log Clearing: Clears /var/log/syslog and /var/log/auth.log after a 3-second delay (press Ctrl+C to skip).

### Notes
Limitations: This script provides basic anonymity and does not replace advanced tools like VPNs or Tor.
