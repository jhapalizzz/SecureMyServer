# SecureMyServer: Automated Linux Hardening & Threat Monitoring Script

## Overview

SecureMyServer is a practical bash/Python tool designed to harden and monitor Linux servers (Ubuntu/Debian). It helps improve server security by disabling unused services, configuring firewall rules, enforcing SSH security, and monitoring suspicious activities like brute-force login attempts.

---

## Features

- Disables unused services (e.g., telnet, FTP)
- Configures UFW firewall with secure defaults
- Enforces SSH hardening (disables root login, password auth)
- Enables automatic security updates
- Installs and configures Fail2ban for brute-force protection
- Parses auth logs to detect suspicious SSH login attempts
- Sends real-time alerts via Telegram for suspicious activity

---

## Getting Started

### Prerequisites

- Ubuntu/Debian server (tested on Ubuntu 20.04/22.04)
- Python 3
- `requests` Python module (`pip install requests`)
- Telegram account and bot (token & chat ID)

### Installation

1. Clone the repo:

   git clone https://github.com/yourusername/SecureMyServer.git
   cd SecureMyServer

2. Make scripts executable:

   chmod +x securemyserver.sh log_parser.py
 
3. Install required Python packages:

   pip3 install requests

4. Run the main hardening script:

   sudo ./securemyserver.sh

5. Test log parser & alerts:

   sudo ./log_parser.py


Configuration

Update Telegram bot token and chat ID in log_parser.py:

BOT_TOKEN = "8187304433:AAH0acnFjvSuvudNUX-qjl0Oz0tFujmTzf8"
CHAT_ID = "7267900441"


Automation

Set up a cron job to run the log parser regularly (e.g., every 10 minutes):

   crontab -e
   */10 * * * * /usr/bin/sudo /path/to/log_parser.py
