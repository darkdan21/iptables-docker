wget --tries=1 --timeout=1 192.168.101.2 &> /dev/null
ret=$?
if [ $ret -eq 0 ]
then
    echo "Connected to server over http on port 80"
    exit
fi
wget --tries=1 --timeout=1 192.168.101.2:90 &> /dev/null
if [ $ret -eq 0 ]
then
    echo "Connected to the server over http on port 90"
    exit
fi
wget --tries=1 --timeout=1 192.168.101.2:100 &> /dev/null
ret=$?
if [ $ret -eq 0 ]
then
    echo "Connected to the server over http on port 100"
    exit
fi
wget --tries=1 --timeout=1 192.168.101.2:110 &> /dev/null
ret=$?
if [ $ret -eq 0 ]
then
    echo "Connected to the server over http on port 110"
    exit
fi
wget --tries=1 --timeout=1 192.168.101.2:120 &> /dev/null
ret=$?
if [ $ret -eq 0 ]
then
    echo "Connected to the server over http on port 120"
    exit
fi
