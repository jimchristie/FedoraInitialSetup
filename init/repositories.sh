#!/bin/bash

################################################################################

# Red Hat

################################################################################

# RPMFusion
# The RPMFusion provides some free and non-free software for Fedora. 
# The repository is meant to provide stable and tested packages for Fedora.

packageManager=$1

if [ $packageManager == "dnf" ]; then

	rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm

fi





################################################################################

# Debian

################################################################################

if [ $packageManager == "apt-get" ]; then
	
echo "**************************************** apt-get *******************************************"

	# allow Debian to use add-apt-repository
	apt-get install software-properties-common -y

fi
