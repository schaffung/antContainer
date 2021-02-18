#!/usr/bin/env bash

set -o errexit

container=$(buildah from fedora:32)

buildah config --label maintainer="srijan-sivakumar <ssivakum@redhat.com>" $container

buildah copy $container dependency_installation.sh /tmp/dependency_installation.sh
buildah copy $container glusterfs /tmp/glusterfs

buildah run $container sh /tmp/dependency_installation.sh
buildah run $container dnf clean all

buildah config --workingdir /tmp/glusterfs $container

buildah run $container ./autogen.sh
buildah run $container ./configure --enable-fusermount --enable-debug
buildah run $container make CFLAGS="-Wall -DDEBUG -g3 -O0" install 1>/dev/null
buildah config --workingdir /tmp $container
buildah run $container rm -rf /tmp/glusterfs

buildah config --entrypoint /bin/bash $container

buildah commit --format docker $container gluster:latest
