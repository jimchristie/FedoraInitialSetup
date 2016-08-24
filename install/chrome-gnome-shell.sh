#!/bin/bash

packageManager=$1

if [ "$packageManager" = "dnf" ]; then
	$packageManager copr enable region51/chrome-gnome-shell -y
	$packageManager install chrome-gnome-shell -y
fi 

if [ "$packageManager" = "apt-get" ]; then
	add-apt-repository ppa:ne0sight/chrome-gnome-shell -y
	$packageManager update
	$packageManager install chrome-gnome-shell -y
fi
