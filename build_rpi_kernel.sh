#!/bin/bash

function G {
	echo -e "\033[32m$1\033[0m"
}

G "Configure build output path"
KERNEL_TOP_PATH="$(cd "$(dirname "$0")"; pwd -P)"
OUTPUT="$KERNEL_TOP_PATH/out"
G "$OUTPUT"

BUILD_LOG="$KERNEL_TOP_PATH/rpi_build_log.txt"

G "Move to kernel source"
cd linux

G "Clean build"
make mrproper

G "Make defconfig"
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
	O=$OUTPUT bcm2711_defconfig

G "Build kernel"
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
	O=$OUTPUT Image modules dtbs -j4 2>&1 | tee $BUILD_LOG

if [ $? -ne 0 ]; then
	exit 1
fi
