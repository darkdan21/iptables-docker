#!/bin/sh
iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -o eth1 -p tcp --syn --dport 22 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

