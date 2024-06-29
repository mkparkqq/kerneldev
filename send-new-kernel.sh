#!/bin/bash

echo "Remove old files."

if [ -e rpi-kernel.tar.gz ]; then
	rm rpi-kernel.tar.gz
fi

if [ -e 4.19.127-v8+ ]; then
	rm -rf 4.19.127-v8+
fi

echo "Install modules."
./install_modules.sh
check

echo "Zip kernel."
./zip_kernel.sh
check

echo "Send zipped kernel."
scp -P 9903 rpi-kernel.tar.gz root@$RPI_IPV4_ADDR:/root/kernel

echo "Remove tar.gz file."
rm rpi-kernel.tar.gz

