#!/usr/bin/env python3

import re
import requests

BOT_TOKEN = "8187304433:AAH0acnFjvSuvudNUX-qjl0Oz0tFujmTzf8"
CHAT_ID = "7267900441"

def send_telegram_alert(message):
    url = f"https://api.telegram.org/bot{BOT_TOKEN}/sendMessage"
    payload = {
        "chat_id": CHAT_ID,
        "text": message
    }
    try:
        requests.post(url, data=payload)
    except Exception as e:
        print(f"Failed to send alert: {e}")

log_path = "/var/log/auth.log"
suspicious_entries = []

try:
    with open(log_path, "r") as file:
        logs = file.readlines()

    for line in logs:
        if "Failed password" in line or "authentication failure" in line:
            suspicious_entries.append(line.strip())

    print("Suspicious SSH login attempts:")
    for entry in suspicious_entries:
        print(entry)

    if suspicious_entries:
        alert_message = f"🚨 {len(suspicious_entries)} suspicious SSH attempts:\n" + "\n".join(suspicious_entries[:5])
        send_telegram_alert(alert_message)

except FileNotFoundError:
    print(f"Log file not found at: {log_path}")
