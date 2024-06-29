#!/bin/bash

function G {
	echo -e "\033[32m$1\033[0m"
}

KERNEL_TOP_PATH="$(cd "$(dirname "$0")"; pwd -P)"
OUTPUT="$KERNEL_TOP_PATH/out"
TAR_FILE=rpi-kernel.tar.gz
KERNEL_ARCH=arm64

# kernel module
# .dtb files
# overlays/*.dtb*
# Image

KERNEL_MODULE_DIR="4.19.127-v8+"
TMP_OVERLAY_DIR=overlays
TMP_DTB_DIR=dtbs
TMP_IMAGE=kernel8.img
mkdir $TMP_OVERLAY_DIR
mkdir $TMP_DTB_DIR

cp $OUTPUT/arch/$KERNEL_ARCH/boot/dts/overlays/*.dtb* $TMP_OVERLAY_DIR
cp $OUTPUT/arch/$KERNEL_ARCH/boot/dts/broadcom/*.dtb $TMP_DTB_DIR
cp $OUTPUT/arch/$KERNEL_ARCH/boot/Image $TMP_IMAGE

tar -czvf $TAR_FILE $KERNEL_MODULE_DIR \
	$TMP_DTB_DIR \
	$TMP_OVERLAY_DIR \
	$TMP_IMAGE

rm -rf $TMP_OVERLAY_DIR
rm -rf $TMP_DTB_DIR
rm -rf $TMP_IMAGE

