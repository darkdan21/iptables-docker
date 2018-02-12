#!/bin/bash
user=$(whoami)
if [ $user != "root" ]; then
    echo "You need to be root for this."
    exit
fi
sysctl net.ipv4.conf.all.forwarding=1 &> /dev/null
echo 0 >/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts


docker ps &> /dev/null
prev=$?
if [ $prev -ne 0 ]; then
    echo "Docker is not running correctly"
    exit
fi

docker-compose down; docker-compose up -d
./tests/reset.sh

./tests/test1.sh

docker exec -i server sh < ./submissions/part2.sh
./tests/test2.sh


docker exec -i server sh < ./submissions/part3.sh
./tests/test3.sh

docker exec -i router sh < ./submissions/part4.sh
./tests/test4.sh

docker exec -i router sh < ./submissions/part5.sh
./tests/test5.sh

docker exec -i router sh < ./submissions/part6.sh
./tests/test6.sh

docker-compose down;
