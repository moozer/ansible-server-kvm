#!/bin/sh

# I get this URL from the output of
#   vagrant box add debian/jessie64
BOX="https://atlas.hashicorp.com/debian/boxes/jessie64/versions/8.5.0/providers/libvirt.box"
FILENAME="debian-jessie64-libvirt.box"

echo Downloading file for use in test box

cd files
wget $BOX -O $FILENAME

echo and use
echo    vagrant box add /vagrant/$FILENAME --name debian/jessie64
