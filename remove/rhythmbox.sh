#!/bin/bash

packageManager=$1

if [ "$packageManager" = "dnf" ]; then
	$packageManager remove rhythmbox -y
fi

if [ "$packageManager" = "apt-get" ]; then
	$packageManager purge rhythmbox -y
fi
