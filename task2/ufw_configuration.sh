#!/bin/bash
#install ufw (uncomplicated firewall) using command sudo apt install ufw
#to see the status (active or inactive) of firewall
sudo ufw status 
#to activate the firewall
echo "************************************"
echo "Activating firewall..."
sudo ufw enable 
echo "************************************"
sudo ufw status
echo "************************************"
#see the applications supported by firewall
echo "List of applications supported by firewall"
sudo ufw app list
echo "************************************"
sudo ufw default deny incoming
sudo ufw default allow outgoing
echo "************************************"
#to see detailed status
echo "Detailed status of firewall"
sudo ufw status verbose
echo "************************************"
echo "Allowing SSH and denying HTTP incoming traffic"
sudo ufw allow 22/tcp
sudo ufw allow 22/udp
sudo ufw deny 80/tcp
sudo ufw deny 80/udp
echo "To deny outgoing http traffic"
sudo ufw deny out to any proto tcp port 80
echo "************************************"
echo "Detailed status of firewall"
sudo ufw status verbose
echo "************************************"
echo "Displaying rules with numbers"
sudo ufw status numbered
echo "************************************"
echo "To delete a rule eg.rule 2"
sudo ufw delete 2
echo "Status of firewall"
sudo ufw status
