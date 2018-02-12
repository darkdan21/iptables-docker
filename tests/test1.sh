#!/bin/bash
cd "$(dirname "$0")"

for file in 1/client/*
do
    docker exec -i client bash < $file
done

for file in 1/server/*
do
    docker exec -i server bash < $file
done

for file in 1/router/*
do
    docker exec -i router bash < $file
done

echo "TEST1: If nothing printed above, PASS - all accessible from everywhere on http and ssh"

./reset.sh
