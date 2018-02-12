#!/bin/bash
cd "$(dirname "$0")"

for file in 1/client/*
do
    docker exec -i client bash < $file
done

echo "TEST5: If nothing printed above, PASS - the server is accessible only from the client"

./reset.sh
