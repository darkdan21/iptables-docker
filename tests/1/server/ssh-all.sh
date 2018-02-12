CLIENT=192.168.100.2
SERVER=192.168.101.2
ROUTER1=192.168.100.1
ROUTER2=192.168.101.1
current=$SERVER
sshpass -p 'a' ssh -o StrictHostKeyChecking=no root@$current exit &> /dev/null
ret=$?
echo $ret
if [ $ret -ne 0 ]
then
    echo "Failed to connect to $current over SSH"
    exit
fi

current=$CLIENT
sshpass -p 'a' ssh -o StrictHostKeyChecking=no root@$current exit &> /dev/null
ret=$?
echo $ret
if [ $ret -ne 0 ]
then
    echo "Failed to connect to $current over SSH"
    exit
fi

current=$ROUTER1
sshpass -p 'a' ssh -o StrictHostKeyChecking=no root@$current exit &> /dev/null
ret=$?
echo $ret
if [ $ret -ne 0 ]
then
    echo "Failed to connect to $current over SSH"
    exit
fi

current=$ROUTER2
sshpass -p 'a' ssh -o StrictHostKeyChecking=no root@$current exit &> /dev/null
ret=$?
echo $ret
if [ $ret -ne 0 ]
then
    echo "Failed to connect to $current over SSH"
    exit
fi
