#!/bin/bash

packageManager=$1

if [ "$packageManager" == "dnf" ]; then
	$packageManager remove evolution -y
fi

if [ "$packageManager" == "apt-get" ]; then
	$packageManager purge evolution -y
fi
