#!/bin/sh
#ulogd setup
ulogd -d

#iptables rules
iptables -N MYLOGGING
iptables -A MYLOGGING --match hashlimit --hashlimit-name "MYLOGGING" --hashlimit-upto 1/sec --hashlimit-mode srcip,dstport --hashlimit-burst 1 -j NFLOG --nflog-prefix "IPTABLES-DROPPED: "

iptables -A MYLOGGING -j DROP

iptables -A FORWARD -i eth0 -o eth1 -p tcp --syn --dport 22 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -j MYLOGGING

