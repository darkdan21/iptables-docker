wget 192.168.101.2 &> /dev/null
ret=$?
if [ $ret -ne 0 ]
then
    echo "Failed to connect to server over http"
    exit
fi
