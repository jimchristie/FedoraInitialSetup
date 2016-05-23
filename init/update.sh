#!/bin/bash

source packageManager.sh
$packageManager update -y

if [ $packageManager="dnf" ] then;
	$packageManager update -y
fi

if [ $packageManager="apt-get" ] then;
	$packageManager update && $packageManager dist-upgrade -y
fi
