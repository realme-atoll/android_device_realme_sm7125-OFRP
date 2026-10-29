#
# Copyright (C) 2019 The TwrpBuilder Open-Source Project
#
# Copyright (C) 2020-2026 The OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
PRODUCT_PLATFORM := atoll
TARGET_BOOTLOADER_BOARD_NAME := atoll
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := atoll
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618
QCOM_BOARD_PLATFORMS += atoll

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 \
	androidboot.hardware=qcom \
	androidboot.console=ttyMSM0 \
	androidboot.memcg=1 \
	lpm_levels.sleep_disabled=1 \
	video=vfb:640x400,bpp=32,memsize=3072000 \
	msm_rtb.filter=0x237 \
	service_locator.enable=1 \
	androidboot.usbcontroller=a600000.dwc3 \
	swiotlb=1 \
	androidboot.selinux=permissive \
	earlycon=msm_geni_serial,0xa88000 \
	androidboot.init_fatal_reboot_target=recovery \
	cgroup.memory=nokmem,nosocket \
	kpti=off \
	irqaffinity=0-3
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE          := 0x00000000
BOARD_KERNEL_TAGS_OFFSET   := 0x00000100
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_RAMDISK_OFFSET       := 0x01000000
BOARD_DTB_OFFSET           := 0x01f00000
TARGET_KERNEL_ARCH := arm64

BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dts
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo

BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 8476688384
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 8472494080
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm

# Explicitly disable virtual A/B
AB_OTA_UPDATER := false

# System as root
BOARD_ROOT_EXTRA_FOLDERS := bluetooth custom dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery & Bootloader Message (BCB) for GUI Factory Reset
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_USES_METADATA_PARTITION := true
BOARD_RECOVERY_BLDRMSG_OFFSET := 0

# Crypto - Android 16 FBE v2 support
PLATFORM_VERSION := 16
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_QCOM_FBE_DECRYPTION_V2 := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_ENCRYPTED := true
TW_USE_FSCRYPT := 1

# Realme / Oppo OZIP Decryption & Stock OTA Support
OF_SUPPORT_OZIP_DECRYPTION := 1
TW_OZIP_DECRYPT_KEY := 1c4c1ea3a12531ae491b21bb31613c11

# Custom ROM OTA Updating Support
OF_SUPPORT_ALL_BLOCK_OTA_UPDATES := 1
OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR := 1
OF_PREVENT_RECOVERY_OVERWRITE := 1
OF_CHECK_OTA_SURVIVAL := 1

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_SCREEN_BLANK := true
TW_BACKUP_EXCLUSIONS := /data/fonts/,/data/nandswap

# Android 16 specific flags
TW_SUPPORT_INPUT_AIDL_HIDX := true
TW_SUPPORT_INPUT_AIDL := true
TW_DEVICE_VERSION := sm7125_R12.0_A16
TARGET_OTA_ASSERT_DEVICE := sm7125,RMX2061,RMX2063,RMX2170,RMX3081,atoll
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/usb-ffs/mtp
TW_SCREEN_BLANK_ON_BOOT := true

# Set brightness path and level
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200

# Qcom EDL mode
TW_HAS_EDL_MODE := true

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

# Include some binaries
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_PYTHON := true

# Debug-tools
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Languages
TW_EXTRA_LANGUAGES := true

# Excludes
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true

# Set custom paths
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone4/temp"

# Other flags
TW_EXCLUDE_APEX := true

# Magisk v30.7, KernelSU v3.2.5, KernelSU Next v3.3.0, APatch support
TW_INCLUDE_Magisk := true

# AVB & filesystem flags
BOARD_MOVE_GSI_AVB_KEYS_TO_VBMETA := true
TARGET_USE_MKE2FS := true
