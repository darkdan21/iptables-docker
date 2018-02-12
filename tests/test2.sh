#!/bin/bash
cd "$(dirname "$0")"

for file in 2/client/*
do
    docker exec -i client bash < $file
done

echo "TEST2: If nothing printed above, PASS - server http not accessible on client"

./reset.sh

