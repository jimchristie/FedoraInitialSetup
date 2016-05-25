#!/bin/bash

packageManager=$1


# install
if [ "$packageManager" = "dnf" ]; then
	fileName="dropbox.rpm"
	wget https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm -O $fileName
	$packageManager install dropbox.rpm -y
fi

if [ "$packageManager" = "apt-get" ]; then
	wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb -O $fileName
	dpkg -i install dropbox.deb
fi

# cleanup
rm $fileName
