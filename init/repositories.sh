#!/bin/bash

################################################################################

# Red Hat

################################################################################

# RPMFusion
# The RPMFusion provides some free and non-free software for Fedora. 
# The repository is meant to provide stable and tested packages for Fedora.

packageManager=$1

if [ $packageManager="dnf" ]; then

	rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm

fi





################################################################################

# Debian

################################################################################

if [ $packageManager="apt-get" ]; then

	# add some repos here

fi
