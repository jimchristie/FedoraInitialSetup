#!/bin/bash

#$REPO_FILE="/etc/yum.repos.d/google-chrome.repo"

#touch $REPO_FILE

# Enable the repo
#cat << EOF > $REPO_FILE
#[google-chrome]
#name=google-chrome - \$basearch
#baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
#enabled=1
#gpgcheck=1
#gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
#EOF

#install
#dnf install google-chrome-stable -y

#######################################################################

#ALTERNATE METHOD

#######################################################################

# download
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# install
dnf install google-chrome-stable_current_x86_64.rpm -y

# cleanup
rm google-chrome-stable_current_x86_64.rpm
