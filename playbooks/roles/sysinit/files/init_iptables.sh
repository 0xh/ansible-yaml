#!/bin/bash

# clear all rules
/sbin/iptables -F
/sbin/iptables -X

# Ping
/sbin/iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
/sbin/iptables -A INPUT -i lo -j ACCEPT  
/sbin/iptables -A INPUT -p icmp -j ACCEPT

# private ip
/sbin/iptables -A INPUT -s 10.0.0.0/8 -j ACCEPT

# public ip
/sbin/iptables -A INPUT -s 58.213.139.96/28 -j ACCEPT 
/sbin/iptables -A INPUT -s 118.184.5.0/24 -j ACCEPT

# open port
/sbin/iptables -A INPUT -p tcp --dport 22 -j ACCEPT


# deny other 
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP 

# save
/etc/init.d/iptables save
