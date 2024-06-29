#!/bin/bash

function G {
	echo -e "\033[32m$1\033[0m"
}

G "Configure build output path"
KERNEL_TOP_PATH="$(cd "$(dirname "$0")"; pwd -P)"
OUTPUT="$KERNEL_TOP_PATH/out"
G "$OUTPUT"

BUILD_LOG="$KERNEL_TOP_PATH/preproc_build_log.txt"

PREPROCESS_FILE=$1
G "Target file : $PREPROCESS_FILE"


echo "Move to the kernel source."
cd linux

echo "Apply patch file to Makefile"
cp ../patches/save-temps-obj.patch ./
git apply save-temps-obj.patch

G "Make defconfig"
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
	O=$OUTPUT bcm2711_defconfig

G "Build kernel"
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
	$PREPROCESS_FILE O=$OUTPUT Image modules dtbs -j4 2>&1 | tee $BUILD_LOG

G "Rollback Makefile"
git apply --reverse save-temps-obj.patch
