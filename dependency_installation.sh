#!/bin/bash
dnf update -y && sed -i "s/LANG/\#LANG/g" /etc/locale.conf && dnf -y install automake autoconf \
libtool flex bison openssl-devel libxml2-devel python-devel \
libaio-devel libibverbs-devel librdmacm-devel readline-devel lvm2-devel glib2-devel \
userspace-rcu-devel libcmocka-devel libacl-devel sqlite-devel fuse-devel redhat-rpm-config \
rpcgen libtirpc-devel make python3-devel rsync libuuid-devel systemd-udev attr iputils iproute \
openssh-server openssh-clients cronie tar rsync sos && dnf clean all -y && sed -i '/Port 22/c\Port 2222' /etc/ssh/sshd_config
