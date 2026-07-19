### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
properties() { '
kernel.string=Docker Kernel Pixel 8a (KSU-Next + SuSFS)
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
do.check_boot_version=0
device.name1=akita
device.name2=shiba
device.name3=husky
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; }

### AnyKernel install
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

. tools/ak3-core.sh

split_boot

# GKI devices (Pixel 8a) have ramdisk — use unpack_ramdisk + write_boot
if [ -f "$SPLITIMG/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi

ui_print " "
ui_print "Docker Kernel for Pixel 8a (akita)"
ui_print "KSU-Next + SuSFS included"
ui_print " "
