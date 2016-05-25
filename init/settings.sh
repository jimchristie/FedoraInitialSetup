#!/bin/bash

##############################################################
# git
##############################################################
unset GIT_ASKPASS
unset SSH_ASKPASS
git config --global credential.helper 'cache --timeout=3600'
