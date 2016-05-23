#!/bin/bash

source ../init/packageManager.sh

if [ $packageManager="dnf" ] then;
	$packageManager copr enable region51/chrome-gnome-shell -y
	$packageManager install chrome-gnome-shell -y
fi 

if [ $packageManager="apt-get" ]
	add-apt-repository ppa:ne0sight/chrome-gnome-shell
	$packageManager update
	$packageManager install chrome-gnome-shell
