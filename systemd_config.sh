#!/bin/bash

sed -i 's/Requires\=rpcbind\.service//g' /usr/local/lib/systemd/system/glusterd.service && \
sed -i 's/rpcbind\.service/gluster-setup\.service/g' /usr/local/lib/systemd/system/glusterd.service && \
systemctl disable systemd-udev-trigger.service && \
systemctl disable systemd-udev.service && \
systemctl disable nfs-server.service && \
systemctl enable rpcbind.service && \
systemctl enable sshd.service && \
systemctl enable glusterd.service && \
mkdir -p /var/log/core;

true && \
systemctl mask getty.target && \
systemctl mask systemd-journal-flush.service && \
systemctl mask rpcbind.socket && true
