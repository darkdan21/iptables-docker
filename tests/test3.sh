#!/bin/bash
cd "$(dirname "$0")"

for file in 3/client/*
do
    docker exec -i client bash < $file
done

echo "TEST3: If nothing printed above, PASS - only port 22 is allowed"

./reset.sh
