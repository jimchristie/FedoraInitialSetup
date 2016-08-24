#!/bin/bash

pwd=`pwd`
installsDirectory="$pwd/install"
removeDirectory="$pwd/remove"
logFile="$pwd/log"
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
	
	echo "******************* init loop ***********************" > $logFile 2>&1
	cd init

	for initFile in `ls *.sh` 
	do
		chown $SUDO_USER $initFile
		chgrp $SUDO_USER $initFile			
		chmod 665 $initFile >> $logFile 2>&1;
		./$initFile $packageManager >> $logFile 2>&1;
	done

	cd ..
}

installLoop(){

	echo "******************* install loop ***********************" >> $logFile 2>&1
	cd $installsDirectory

	for installFile in `ls *.sh`
	do	
		chown $SUDO_USER $installFile
		chgrp $SUDO_USER $installFile
		chmod 665 $installFile >> $logFile 2>&1;
		./$installFile $packageManager >> $logFile 2>&1;

	done

	cd ..
}


removeLoop(){

	echo "******************* remove loop ***********************" >> $logFile 2>&1
	cd $removeDirectory

	for removeFile in `ls *.sh`
	do	
		echo "**************** removeFile $removeFile *********************" >> $logFile 2>&1
		chown $SUDO_USER $removeFile
		chgrp $SUDO_USER $removeFile
		chmod 665 $removeFile >> $logFile 2>&1;
		./$removeFile $packageManager >> $logFile 2>&1;

	done

	cd ..
}

#initialLoop

removeLoop

#installLoop

# run update again just in case any of the manually downloaded packages were outdated
cd init
./update.sh >> $logFile 2>&1;
cd ..

chown $SUDO_USER $logFile
chgrp $SUDO_USER $logFile
