#!/bin/bash

packageManager=$1

if [ "$packageManager" = "dnf" ]; then
	$packageManager update -y
fi

if [ "$packageManager" = "apt-get" ]; then
	$packageManager update && $packageManager dist-upgrade -y
fi
