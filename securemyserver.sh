#!/bin/bash

LOG="securemyserver.log"
echo "Starting server hardening..."|tee $LOG

#Disable unused services
echo "Disabling telnet and FTP(if installed)..."|tee -a $LOG
sudo systemctl stop telnet.socket 2>>$LOG
sudo systemctl disable telnet.socket 2>>$LOG
sudo systemctl stop vsftpd 2>>$LOG
sudo systemctl disable vsftpd 2>>$LOG

#Enable UFW firewall
echo "setting up UFW firewall..."|tee -a $LOG
sudo ufw default deny incoming}tee -a $LOG
sudo ufw allow ssh|tee -a $LOG
sudo ufw --force enable|tee -a $LOG
echo "Basic linux heardening complete."|tee -a $LOG


