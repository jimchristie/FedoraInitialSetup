#!/bin/bash

pwd=`pwd`
installsDirectory="$pwd/install"
removeDirectory="$pwd/remove"
#logFile="$pwd/log"
distro=`lsb_release -si`
dnf=(Fedora)
apt=(Ubuntu Debian)

# assign the packageManager variable
for item in "${dnf[@]}"; do
	if [[ "$distro" = "$item" ]]; then
		packageManager="dnf"
	fi
done

for item in "${apt[@]}"; do
	if [[ "$distro" = "$item" ]]; then
		packageManager="apt-get"
	fi
done

initialLoop(){
	
	echo "******************* init loop ***********************"
	cd init

	for initFile in `ls *.sh` 
	do
		chown $SUDO_USER $initFile
		chgrp $SUDO_USER $initFile			
		chmod 665 $initFile
		./$initFile $packageManager
	done

	cd ..
}

installLoop(){

	echo "******************* install loop ***********************"
	cd $installsDirectory

	for installFile in `ls *.sh`
	do	
		chown $SUDO_USER $installFile
		chgrp $SUDO_USER $installFile
		chmod 665 $installFile
		./$installFile $packageManager

	done

	cd ..
}


removeLoop(){

	echo "******************* remove loop ***********************"
	cd $removeDirectory

	for removeFile in `ls *.sh`
	do	
		echo "**************** removeFile $removeFile *********************"
		chown $SUDO_USER $removeFile
		chgrp $SUDO_USER $removeFile
		chmod 665 $removeFile
		./$removeFile $packageManager
	done

	cd ..
}

initialLoop

removeLoop

installLoop

# run update again just in case any of the manually downloaded packages were outdated
cd init
./update.sh
cd ..

#chown $SUDO_USER $logFile
#chgrp $SUDO_USER $logFile
