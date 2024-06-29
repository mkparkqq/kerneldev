#!/bin/bash

function G {
	echo -e "\033[32m$1\033[0m"
}

KERNEL=kernel8
KERNEL_TOP_PATH="$(cd "$(dirname "$0")"; pwd -P)"
MOD_PATH="$KERNEL_TOP_PATH/modules"
OUTPUT="$KERNEL_TOP_PATH/out"

echo -n "Configure kernel module install path : "
G $MOD_PATH

cd linux

echo -e "\nInstall the kernel modules" 
make -j$(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
	O=$OUTPUT \
	INSTALL_MOD_PATH=$MOD_PATH \
	modules_install

MOD_FILE="$(ls $MOD_PATH/lib/modules)"

echo -en "\nExtract "
G "$MOD_FILE"

mv $MOD_PATH/lib/modules/$MOD_FILE $KERNEL_TOP_PATH
rm -rf $MOD_PATH

