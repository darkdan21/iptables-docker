wget 192.168.100.2 &> /dev/null
ret=$?
if [ $ret -ne 0 ]
then
    echo "Failed to connect to client over http"
    exit
fi
