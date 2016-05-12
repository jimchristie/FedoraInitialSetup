#!/bin/bash

# download
wget https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm -O dropbox.rpm

# install
dnf install dropbox.rpm -y

# cleanup
rm dropbox.rpm
