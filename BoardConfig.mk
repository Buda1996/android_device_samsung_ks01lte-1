# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from common msm8974
-include device/samsung/msm8974-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/ks01lte/include

TARGET_OTA_ASSERT_DEVICE := ks01ltexx,GT-I9506,ks01lte,ks01lteskt,ks01ltektt

TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/ks01lte
TARGET_KERNEL_CONFIG := unicornblood_ks01lte_defconfig
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 --second_offset 0x00f00000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/ks01lte/mkbootimg.mk

# Audio
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_DISABLED_FM := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/ks01lte/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/ks01lte/bluetooth/vnd_ks01lte.txt

# GPS
TARGET_NO_RPC := true
TARGET_GPS_HAL_PATH := device/samsung/ks01lte/gps

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Logging
TARGET_USES_LOGD := false

# NFC
TARGET_USES_OS_NFC := true
BOARD_NFC_HAL_SUFFIX := msm8974

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
ifeq ($(HOST_OS),linux)
TARGET_USERIMAGES_USE_F2FS := true
endif
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2390753280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12685655040
BOARD_FLASH_BLOCK_SIZE := 131072

# Power HAL
TARGET_POWERHAL_VARIANT := qcom
TARGET_USES_CPU_BOOST_HINT := true
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/ks01lte/power/power_ext.c

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_FSTAB := device/samsung/ks01lte/rootdir/etc/fstab.qcom
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/msm_dwc3/f9200000.dwc3/gadget/lun%d/file

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/ks01lte

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"

# RIL
BOARD_VENDOR := samsung
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6360

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/ks01lte/cmhw

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# RIL Class (for correct tech assignment)
BOARD_RIL_CLASS := ../../../device/samsung/ks01lte/ril

# Camera
TARGET_PROVIDES_CAMERA_HAL := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Recovery
TARGET_RECOVERY_DEVICE_DIRS := device/samsung/ks01lte/recovery

# TWRP Recovery
TW_THEME := portrait_hdpi
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_CRYPTO := true
# The real path for this is /sys/devices/mdp.0/qcom,cmdss_fb_primary.173/leds/lcd-backlight/brightness but the comma doesn't compile correctly
TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.173/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_INCLUDE_FB2PNG := true
TW_TARGET_USES_QCOM_BSP := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_QCOM_RTC_FIX := true

# SElinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/samsung/ks01lte/sepolicy

BOARD_SEPOLICY_UNION += \
    bluetooth.te \
    file_contexts \
    file.te \
    genfs_contexts \
    healthd.te \
    hostapd.te \
    init.te \
    insthk.te \
    keystore.te \
    mediaserver.te \
    mm-pp-daemon.te \
    mm-qcamerad.te \
    mpdecision.te \
    property_contexts \
    property.te \
    rild.te \
    rmt_storage.te \
    sensorhubservice.te \
    service.te \
    service_contexts \
    system_server.te \
    tee.te \
    thermal-engine.te \
    time_daemon.te \
    ueventd.te \
    vold.te \
    wpa.te
