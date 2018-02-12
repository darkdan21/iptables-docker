SERVER=192.168.101.2
current=$SERVER
sshpass -p 'a' ssh -o StrictHostKeyChecking=no root@$current exit &> /dev/null
ret=$?
echo $ret
if [ $ret -ne 0 ]
then
    echo "Failed to connect to $current over SSH"
    exit
fi
