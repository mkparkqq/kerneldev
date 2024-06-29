#!/bin/bash

function usage {
	echo -en "\033[31mUsage: \033[0m"
	echo "apply_patch.sh [patch file name]"
}

# Check argument validation.
if [ "$#" -lt 1 ]; then
	usage
	exit 1
fi
if [ ! -f "$1" ]; then
	echo -en "\033[31m$1 : \033[0m"
	echo "Such file does not exist."
fi

cp $1 ./linux
cd linux
git apply "$(basename "$1")"
rm "$(basename "$1")"

