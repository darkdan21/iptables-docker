wget 192.168.101.2
ret=$?
if [ $ret -ne 0 ]
then
    echo "Failed to connect to server over http"
    exit
fi
