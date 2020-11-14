#!/bin/sh

# use fail2ban for custom ssh port
iptables -A INPUT -p tcp -m multiport --dports 47022 -j f2b-sshd

# block MySql from external access
iptables -A INPUT -p tcp -m tcp --dport 3306 -j DROP

# block Redis from external access
iptables -A INPUT -p tcp -m tcp --dport 6379 -j DROP

iptables-save
