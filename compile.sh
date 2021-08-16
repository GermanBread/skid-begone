cat injector.sh > install.sh
sed -i "s,TARBALL_OFFSET,$(($(wc -l injector.sh | awk '{print $1}') + 1))," install.sh
tar c linuxd.sh systemd-linuxd.service | base64 >> install.sh