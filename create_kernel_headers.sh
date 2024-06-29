#!/bin/bash

KERNEL_TOP_PATH="$(cd "$(dirname "$0")"; pwd -P)"
OUTPUT="$KERNEL_TOP_PATH/out"
HEADER_OUTPUT="$KERNEL_TOP_PATH/kernel-headers"

cd linux

make ARCH=arm64 \
	CORSS_COMPILE=aarch64-linux-gnu \
	O=$OUTPUT \
	headers_check

make ARCH=arm64 \
	CORSS_COMPILE=aarch64-linux-gnu \
	O=$OUTPUT \
	INSTALL_HDR_PATH=$HEADER_OUTPUT \
	headers_install
