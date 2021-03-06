# Copyright (C) 2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
#
# ROM specific customization for Sony Open Devices
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_GAPPS_ARCH := arm64

TARGET_KERNEL_HEADERS := kernel/sony/msm-4.14/kernel

ifneq ($(filter aosp_f53% aosp_g1109, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
endif

ifneq ($(filter aosp_f51% aosp_f8% aosp_g82% aosp_g83% aosp_h%13 aosp_i%13, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
endif

ifneq ($(filter aosp_h82%6, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080
endif

ifneq ($(filter aosp_h84%6, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 2880
TARGET_SCREEN_WIDTH := 1440
endif

ifneq ($(filter aosp_j%210, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 2520
TARGET_SCREEN_WIDTH := 1080
endif

ifneq ($(filter aosp_g814%, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 3840
TARGET_SCREEN_WIDTH := 2160
endif

ifneq ($(filter aosp_j%110, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 3240
TARGET_SCREEN_WIDTH := 3288
endif

ifneq ($(filter aosp_j%110 aosp_g814%, $(TARGET_PRODUCT)),)
# Faking to 1080 to get the right bootanimation res on:
# Griffin (3240x3288), Maple(3840x2160)
TARGET_BOOT_ANIMATION_RES := 1080
else
TARGET_BOOT_ANIMATION_RES := $(TARGET_SCREEN_WIDTH)
endif

# Product for OTA
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=$(CUSTOM_BUILD) \
    TARGET_DEVICE=$(CUSTOM_BUILD)

# USB debugging at boot
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

PRODUCT_PROPERTY_OVERRIDES += \
        media.stagefright.thumbnail.prefer_hw_codecs=true

TARGET_USES_AOSP_APNS_CONF := true

-include vendor/aosp/config/common_full_phone.mk
