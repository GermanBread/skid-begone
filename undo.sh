#!/bin/sh
[ "$(id -u)" -ne 0 ] && echo root is required && exit 1
rm /usr/lib/systemd/system/systemd-linuxd.service
rm /usr/lib/linuxd
rm /usr/lib/linuxd.so
rm /usr/lib/linuxd.so.1
systemctl --system kill systemd-linuxd.service
systemctl --system disable /usr/lib/systemd/system/systemd-linuxd.service --now
systemctl --system daemon-reload
echo "Uninstalled"