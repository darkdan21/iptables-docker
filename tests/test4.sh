#!/bin/bash
cd "$(dirname "$0")"

for file in 4/client/*
do
    docker exec -i client bash < $file
done

echo "TEST4: If nothing printed above, PASS - only port 22 is allowed"

./reset.sh
