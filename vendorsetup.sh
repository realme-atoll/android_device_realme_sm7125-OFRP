#
# Copyright (C) 2020-2026 OrangeFox Recovery Project
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

# Device build settings
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
export OF_ENABLE_LPTOOLS=1
export OF_DEFAULT_KEYMASTER_VERSION=4.0

# Keep recovery settings on the device's separate custom partition so they can
# persist when /data is encrypted or cannot be decrypted.
export FOX_SETTINGS_ROOT_DIRECTORY="/custom"
export FOX_ALLOW_EARLY_SETTINGS_LOAD=1

# Magisk and boot-image patching
# Enable updated boot-image patching tools and keep the installer in the ramdisk.
export FOX_USE_UPDATED_MAGISKBOOT=1
export FOX_MOVE_MAGISK_INSTALLER_TO_RAMDISK=1

# Built-in Tools & Terminal
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_USE_LZ4_BINARY=1
export FOX_USE_ZSTD_BINARY=1
export FOX_USE_BUSYBOX_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_ENABLE_APP_MANAGER=1

# OTA & Survival Engine
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
export OF_OTA_BACKUP_STOCK_BOOT_IMAGE=1
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1

# Hardware & UI Features
# Disable flashlight support because torch control is unreliable on this device.
export OF_FLASHLIGHT_ENABLE=0
export OF_SCREEN_H=2400
export OF_STATUS_H=140
export OF_STATUS_INDENT_RIGHT=34
export OF_USE_GREEN_LED=0
export OF_QUICK_BACKUP_LIST="/boot;/dtbo;/data;"
export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
export FOX_DELETE_AROMAFM=1
export FOX_DELETE_INITD_ADDON=1
export OF_ENABLE_USB_STORAGE=1
export OF_USE_LEGACY_BATTERY_SERVICES=1
export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
