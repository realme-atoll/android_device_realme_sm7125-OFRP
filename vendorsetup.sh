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

export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C.UTF-8"

# OrangeFox Build Settings
export FOX_BUILD_DEVICE="sm7125"
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export TARGET_DEVICE_ALT="sm7125,RMX2170,RMX2061,RMX3081,atoll"
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

# Cryptography & Partitions
export OF_SUPPORT_OZIP_DECRYPTION=1
export TW_OZIP_DECRYPT_KEY="1c4c1ea3a12531ae491b21bb31613c11"
export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
export OF_UNBIND_SDCARD_F2FS=1
export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
export OF_ENABLE_LPTOOLS=1

# Magisk & Boot Image Patching
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_PATCH_AVB20=1
export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
export OF_DONT_PATCH_ENCRYPTED_DEVICE=1

# Built-in Tools & Terminal
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_USE_SED_BINARY=1
export FOX_REPLACE_BUSYBOX_PS=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_ENABLE_APP_MANAGER=1
export FOX_ADVANCED_SECURITY=1

# OTA & Survival Engine
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
export OF_OTA_BACKUP_STOCK_BOOT_IMAGE=1
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
export OF_PREVENT_RECOVERY_OVERWRITE=1
export OF_CHECK_OTA_SURVIVAL=1
export OF_DISABLE_INCREMENTAL_OTA_BY_DEFAULT=0

# Hardware & UI Features
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_FLASHLIGHT_ENABLE=1
export OF_USE_GREEN_LED=0
export OF_HIDE_NOTCH=1
export FOX_DELETE_AROMAFM=1
export FOX_DELETE_INITD_ADDON=1
export OF_ENABLE_USB_STORAGE=1

# Android 12+ Settings
export OF_ENABLE_FILE_LEVEL_ENCRYPTION=1
export FOX_DELETE_PRELOGD=1
export FOX_EXCLUDE_DEFAULTS=1
export FOX_USE_MKNTFS=1
export OF_ENABLE_LZ4_USING_CMD=1
export OF_ENABLE_ZSTD_USING_CMD=1
export FOX_CUSTOM_FOLDER_FOR_SETTINGS="/custom"
export FOX_RESET_SETTINGS_FOLDER="/custom"

