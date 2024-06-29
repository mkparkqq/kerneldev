#!/bin/bash

function G {
	echo -e "\033[32m$1\033[0m"
}

G "\nUnzip tar.gz file"
tar -xvzf rpi-kernel.tar.gz -C ./

G "\nUpdate kernel modules"
cp -r ./4.19.127-v8+/ /lib/modules

G "\nUpdate dtb files"
cp ./dtbs/* /boot/firmware

G "\nUpdate overlays directory"
cp -r ./overlays/ /boot/firmware

cp ./kernel8.img /boot/firmware

G "\nRemove temporary files"
rm -rf 4.19.127-v8+ dtbs kernel8.img overlays
