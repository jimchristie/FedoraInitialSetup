#!/bin/bash

# Get the package manager for your distro

dnf=(Fedora)
apt=(Ubuntu Debian)
distro=`lsb_release -si`

echo "#!/bin/bash" > packageManager.sh
chown $SUDO_USER packageManager.sh
chgrp $SUDO_USER packageManager.sh
chmod 665 packageManager.sh

for item in "${dnf[@]}"; do
	[[ $distro = "$item" ]] && echo "packageManager=\"dnf\"" >> packageManager.sh
done

for item in "${apt[@]}"; do
	[[ $distro = "$item" ]] && echo "packageManager=\"apt-get\"" >> packageManager.sh
done
