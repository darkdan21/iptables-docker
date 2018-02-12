#!/bin/bash
GATEWAY=$(route -n | grep "^0.0.0.0" | awk -F " " '{print $2}'| awk -F "." '{print $1 "." $2 "." $3 "." $4}')
IPs=$(route | grep "^192" | awk -F "." '{print $1 "." $2 "." $3}')
COUNT=$(route | grep "^192" | awk -F "." '{print $1 "." $2 "." $3}' | wc -l)


if [ $COUNT -eq 2 ]
then
    #router
    echo "Router"
else
    #not router
    echo "Not Router"
    route add default gw $IPs.1
    route del -net 0.0.0.0 gw $GATEWAY
fi
    
#for i in {100..500..20}
#do
#    nc -lvk -d -c 'xargs -n1 echo' -p $i &>/dev/null &
#done
#for i in {500..1000..20}
#do
#    nc -lvk -u -c 'xargs -n1 echo' -p $i &>/dev/null &
#done
/usr/sbin/sshd -D& \
python3 -m http.server 120&
python3 -m http.server 110&
python3 -m http.server 100&
python3 -m http.server 90&
python3 -m http.server 80
