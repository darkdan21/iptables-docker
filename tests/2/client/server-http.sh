wget 192.168.101.2 &> /dev/null
ret=$?
if [ $ret -eq 0 ]
then
    echo "Can still access server from client over http"
    exit
fi
