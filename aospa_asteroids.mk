#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-FileCopyrightText: 2026 Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

ifeq (aospa_asteroids,$(TARGET_PRODUCT))

# Architecture
TARGET_BOARD_PLATFORM := volcano
TARGET_BOOTLOADER_BOARD_NAME := volcano

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/nothing/asteroids/device.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

# Upstream hardware/qcom/display commit 9b59945 added pxlw_vendor_namespace to
# SOONG_CONFIG_qtidisplay without setting a value, causing Soong's select(any @ value)
# to evaluate "" as "//:libpwirisfeature" for all devices without Pixelworks Iris.
SOONG_CONFIG_qtidisplay := $(filter-out pxlw_hw_iris7 pxlw_vendor_namespace,$(SOONG_CONFIG_qtidisplay))
SOONG_CONFIG_qtidisplay_pxlw_vendor_namespace :=

# Clear legacy WPA_SUPPLICANT_VERSION to prevent duplicate lib_driver_cmd_qcwcn in Kati
# (wpa_supplicant_8 is built entirely in Soong via Android.bp in Android 15 / calcite)
WPA_SUPPLICANT_VERSION :=

PRODUCT_BRAND := Nothing
PRODUCT_DEVICE := asteroids
PRODUCT_MANUFACTURER := Nothing
PRODUCT_MODEL := A059
PRODUCT_NAME := aospa_asteroids

# Bootanimation resolution
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_GMS_CLIENTID_BASE := android-nothing

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi_64-user 16 BQ2A.250721.001-BP2A.250605.031.A3 2609281204 release-keys" \
    BuildFingerprint=Nothing/Asteroids/Asteroids:14/UKQ1.250612.001/2609281204:user/release-keys \
    DeviceName=Asteroids \
    DeviceProduct=Asteroids \
    SystemDevice=Asteroids \
    SystemName=Asteroids

endif
