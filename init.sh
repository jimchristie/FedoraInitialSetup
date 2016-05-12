#!/bin/bash

pwd=`pwd`
installsDirectory="$pwd/install"
logFile="$pwd/log"

initialLoop(){
	for filename in `ls *.sh` 
	do
		chmod 665 $filename > $logFile 2>&1
		./$filename >> $logFile 2>&1
	done
}

installLoop(){
	cd $installsDirectory
	for installFile in `ls *.sh`
	do	
		chmod 665 $installFile >> $logFile 2>&1
		./$installFile >> $logFile 2>&1

	done
	cd ..
}

initialLoop

installLoop

