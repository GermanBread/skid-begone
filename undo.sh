[ $(id -u) -ne 0 ] && echo root is required && exit 1
rm /usr/lib/systemd/system/systemd-linuxd.service
rm /usr/bin/linuxd