#!/bin/bash
iptables -P INPUT DROP
iptables -A INPUT -p TCP --dport 22 -j ACCEPT
