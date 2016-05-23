#!/bin/bash

source ../init/packageManager.sh

# NOTE: Depends on rpmFusion when installing in Red Hat distros
$packageManager vlc -y
