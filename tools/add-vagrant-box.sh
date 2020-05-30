#!/bin/sh

VERSION=1.0.0
BOX_NAME=freebsd121-${VERSION}.box

vagrant box add --name FreeBSD/12.1/ZFS packer/box/virtualbox/${BOX_NAME}
