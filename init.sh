#!/bin/bash

pwd=`pwd`
installsDirectory="$pwd/install"
logFile="$pwd/log"
distro=`lsb_release -si`
dnf=(Fedora)
apt=(Ubuntu Debian)

# assign the packageManager variable
for item in "${dnf[@]}"; do
	if [[ $distro = "$item" ]]; then
		packageManager="dnf"
	fi
done

for item in "${apt[@]}"; do
	if [[ $distro = "$item" ]]; then
		packageManager="apt-get"
	fi
done

initialLoop(){
	cd init

	for initFile in `ls *.sh` 
	do
		chown $SUDO_USER $initFile
		chgrp $SUDO_USER $initFile			
		chmod 665 $initFile > $logFile 2>&1;
		./$initFile >> $logFile 2>&1;
	done

	cd ..
}

installLoop(){
	cd $installsDirectory

	for installFile in `ls *.sh`
	do	
		chown $SUDO_USER $installFile
		chgrp $SUDO_USER $installFile
		chmod 665 $installFile >> $logFile 2>&1;
		./$installFile packageManager="$packageManager" >> $logFile 2>&1;

	done

	cd ..
}

initialLoop

installLoop

chown $SUDO_USER $logFile
chgrp $SUDO_USER $logFile

