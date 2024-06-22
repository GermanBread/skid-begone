#!/bin/sh
out="output/"
rm -rf "$out"
mkdir "$out"
cat injector.sh > $out/install.sh
sed -i "s,TARBALL_OFFSET,$(($(wc -l injector.sh | awk '{print $1}') + 1))," $out/install.sh
tar c linuxd.sh systemd-linuxd.service undo.sh socat-static >> $out/install.sh
chmod +x $out/install.sh
