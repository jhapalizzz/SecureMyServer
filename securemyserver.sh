#!/bin/bash

LOG="securemyserver.log"

echo "[+] Starting server hardening..." | tee $LOG

# Disable telnet and FTP (if installed)
echo "[+] Checking for telnet and FTP services..." | tee -a $LOG

if systemctl list-units --type=service | grep -q "telnet"; then
    sudo systemctl stop telnet.socket && echo "[OK] Telnet stopped." | tee -a $LOG
    sudo systemctl disable telnet.socket && echo "[OK] Telnet disabled." | tee -a $LOG
else
    echo "[SKIP] Telnet service not found." | tee -a $LOG
fi

if systemctl list-units --type=service | grep -q "vsftpd"; then
    sudo systemctl stop vsftpd && echo "[OK] FTP stopped." | tee -a $LOG
    sudo systemctl disable vsftpd && echo "[OK] FTP disabled." | tee -a $LOG
else
    echo "[SKIP] FTP service not found." | tee -a $LOG
fi

# Enable UFW firewall
echo "[+] Setting up UFW firewall..." | tee -a $LOG
sudo ufw default deny incoming | tee -a $LOG
sudo ufw allow ssh | tee -a $LOG
sudo ufw --force enable | tee -a $LOG

echo "[✅] Basic Linux hardening complete." | tee -a $LOG
