#!/bin/bash

packageManager=$1

# install
if [ "$packageManager" == "dnf" ]; then
	fileName="google-chrome.rpm"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -O $fileName
	$packageManager install $fileName -y
fi

if [ "$packageManager" == "apt-get" ]; then
	fileName="google.chrome.deb"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $fileName
	dpkg -i install $fileName
fi

# cleanup
rm $fileName
