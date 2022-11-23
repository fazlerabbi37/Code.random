#!/bin/bash

# https://ostechnix.com/how-to-extend-kvm-virtual-machine-disk-size-in-linux/

IMAGE_LOC=/var/lib/libvirt/images
if ! command -v virt-filesystems &> /dev/null
then
    echo "virt-filesystems not found!"
    echo "install with apt-get install libguestfs-tools"
    exit
fi

if [[ "$#" -eq 0 ]]
then
    read -p "image name: " IMAGE_NAME
    read -p "new disk size (50G,100G): " SIZE

elif [[ "$#" -lt 2 ]]
then
    echo "incomplete cli argument"
    echo "format is"
    echo "./kvm_disk_expand.sh IMAGE +SIZE"
    exit
else
    IMAGE_NAME=$1
    SIZE=$2
fi

echo "showing image partitions"
sudo virt-filesystems --long --parts --blkdevs -h -a $IMAGE_LOC/$IMAGE_NAME.qcow2

echo "making a backup of the image"
sudo mv $IMAGE_LOC/$IMAGE_NAME.qcow2 $IMAGE_LOC/$IMAGE_NAME.qcow2.bak

echo "creating new image with given size"
sudo qemu-img create -f qcow2 -o preallocation=metadata $IMAGE_LOC/$IMAGE_NAME.qcow2 $SIZE

read -p "select a partation (/dev/sda1): " PARTATION
echo "resizing image..."

sudo virt-resize --expand $PARTATION $IMAGE_LOC/$IMAGE_NAME.qcow2.bak $IMAGE_LOC/$IMAGE_NAME.qcow2

echo ""
echo "sudo rm $IMAGE_LOC/$IMAGE_NAME.qcow2.bak"
