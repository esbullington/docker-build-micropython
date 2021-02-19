#!/bin/bash

echo "Building Micropython release: ${MICROPYTHON_RELEASE}..."
apt-get update
DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get -y -qq install build-essential libreadline-dev libffi-dev git pkg-config gcc-arm-none-eabi libnewlib-arm-none-eabi wget python3

cd /app
MICROPYTHON_PKG="micropython-${MICROPYTHON_RELEASE}"
MICROPYTHON_TARBALL="${MICROPYTHON_PKG}.tar.xz"

wget https://github.com/micropython/micropython/releases/download/v${MICROPYTHON_RELEASE}/${MICROPYTHON_TARBALL}
tar xf $MICROPYTHON_TARBALL
cd $MICROPYTHON_PKG/mpy-cross

make

cd ../ports/unix

make axtls
make
