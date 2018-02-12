wget 192.168.101.1 &> /dev/null
ret=$?
if [ $ret -ne 0 ]
then
    echo "Failed to connect to router over http on remote side"
    exit
fi
