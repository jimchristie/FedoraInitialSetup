#!/bin/bash

packageManager=$1

# install
if [ "$packageManager" == "dnf" ]; then
	fileName="slack.rpm"
	wget https://downloads.slack-edge.com/linux_releases/slack-2.0.6-0.1.fc21.x86_64.rpm -O $fileName
	$packageManager install $fileName -y
fi

if [ "$packageManager" == "apt-get" ]; then
	fileName="slack.deb"
	wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.0.6-amd64.deb -O $fileName
	dpkg -i install $fileName
fi

# cleanup
rm $fileName
