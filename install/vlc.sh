#!/bin/bash

$packageManager=$1

# NOTE: Depends on rpmFusion when installing in Red Hat distros
$packageManager vlc -y
