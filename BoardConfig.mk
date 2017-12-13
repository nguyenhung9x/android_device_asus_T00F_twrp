#
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := atom
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_OTA_ASSERT_DEVICE := T00F,T00F1,T00G,T00J,T00J1,ASUS_T00J,ASUS_T00G,ASUS_T00F,a600cg,a500cg,a501cg
TARGET_DROIDBOOT_LIBS := libintel_droidboot

# OTA Packaging / Bootimg creation
BOARD_CUSTOM_MKBOOTIMG := pack_intel
BOARD_CUSTOM_BOOTIMG_MK := device/asus/T00F/mkbootimg.mk
DEVICE_BASE_BOOT_IMAGE := device/asus/T00F/base_images/boot.img
DEVICE_BASE_RECOVERY_IMAGE := device/asus/T00F/base_images/recovery.img
NEED_KERNEL_MODULE_ROOT := true

# Inline kernel building
TARGET_PREBUILT_KERNEL := device/asus/T00F/kernel
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=ttyS0 console=logk0 earlyprintk=nologger bootup.uart=0 loglevel=8 kmemleak=off androidboot.selinux=permissive androidboot.bootmedia=sdcard androidboot.hardware=redhookbay watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=172M

TARGET_RECOVERY_UPDATER_LIBS += libosip_updater
TARGET_RECOVERY_UPDATER_EXTRA_LIBS += libintel_updater liboempartitioning_static

# Adb
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Dex-preoptimization: Speeds up initial boot (if we ever o a user build, which we don't)
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Init
TARGET_INIT_VENDOR_LIB := libinit_ctp
TARGET_LIBINIT_DEFINES_FILE := device/asus/T00F/init/init_ctp.cpp
TARGET_INIT_UMOUNT_AND_FSCK_IS_UNSAFE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 1677721600
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5277466624 ##5277483008 - 16384 // 5033MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 519045120 # // 495MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1320157184 # // 1259MB
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/asus/T00F/rootdir/etc/fstab.redhookbay 
TARGET_RECOVERY_DEVICE_MODULES := libinit_ctp librecovery_updater_ctp intel_prop thermald upi_ug31xx

# TWRP
TW_INPUT_BLACKLIST := "accelerometer\x0akxtj9_accel"
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_SUPERSU := true
TW_NO_USB_STORAGE := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_NTFS_3G := true
BOARD_SUPPRESS_EMMC_WIPE := true
RECOVERY_VARIANT := twrp
TW_TIME_ZONE_GUISEL	:= "THAIST-7;THAIDT"
TARGET_RECOVERY_FSTAB := device/asus/T00F/recovery/root/etc/twrp.fstab

#Disable Ninja
USE_NINJA := false
