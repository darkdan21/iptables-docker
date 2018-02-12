#!/bin/sh
iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 192.168.101.0/24 -s 192.168.100.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -I FORWARD -m pkttype --pkt-type broadcast -j DROP
iptables -I OUTPUT -m pkttype --pkt-type broadcast -j DROP
iptables -I INPUT -m pkttype --pkt-type broadcast -j DROP


