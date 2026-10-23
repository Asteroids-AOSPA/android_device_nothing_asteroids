#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Architecture
TARGET_BOARD_PLATFORM := volcano
TARGET_BOOTLOADER_BOARD_NAME := volcano

$(call inherit-product, vendor/nothing/asteroids/asteroids-vendor.mk)
$(call inherit-product-if-exists, hardware/dolby/dolby.mk)

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    alarm \
    audio \
    av \
    bt \
    display \
    gps \
    init \
    media \
    perf \
    telephony \
    usb \
    wfd \
    wlan

# A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)

PRODUCT_RO_FILE_SYSTEM ?= ext4

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=$(PRODUCT_RO_FILE_SYSTEM) \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=$(PRODUCT_RO_FILE_SYSTEM) \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := lz4

# API
PRODUCT_SHIPPING_API_LEVEL := 35

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ART
PRODUCT_ENABLE_UFFD_GC := true

# Adreno
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_3.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano_qssi/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths_volcano_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/mixer_paths_volcano_qrd.xml \
    $(LOCAL_PATH)/audio/mixer_paths_volcano_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano_qssi/mixer_paths_volcano_qrd.xml \
    $(LOCAL_PATH)/audio/mixer_paths_volcano_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_volcano_qrd.xml \
    $(LOCAL_PATH)/audio/resourcemanager_volcano_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/resourcemanager_volcano_qrd.xml \
    $(LOCAL_PATH)/audio/resourcemanager_volcano_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano_qssi/resourcemanager_volcano_qrd.xml \
    $(LOCAL_PATH)/audio/resourcemanager_volcano_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/resourcemanager_volcano_qrd.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano_qssi/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

DEVICE_MANIFEST_FILE += \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/common/manifest_non_qmaa.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/common/manifest_non_qmaa_extn.xml

$(call soong_config_set_bool,android_hardware_audio,skip_speaker_layout_channel_mask_field,true)


# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.nothing

$(call soong_config_set_bool,nothing_fingerprint,use_lhbm,true)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

TARGET_HAS_UDFPS := true

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot-service.qti \
    android.hardware.boot-service.qti.recovery

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.config-V2-ndk.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Device Extras, Assist Key & Doze
PRODUCT_PACKAGES += \
    AssistKey \
    DeviceExtras \
    NothingDoze

# Display
$(call soong_config_set,surfaceflinger,frame_rate_category_high,120)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_asteroids.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946978939328130.xml


# eUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_JPN/android.hardware.telephony.euicc.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_ProEEA/android.hardware.telephony.euicc.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_ProROW/android.hardware.telephony.euicc.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_ProTUR/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    NothingEsimSwitcher \
    default-permissions-com.google.android.euicc.xml \
    privapp-permissions-com.google.android.euicc.xml

# FeliCa
PRODUCT_PACKAGES += \
    NothingFelicaDisabler

# FWK Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti_vendor

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Graphics
PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true

PRODUCT_PACKAGES += \
    vulkan.pastel

# Glyph
PRODUCT_PACKAGES += \
    ParanoidGlyphPhone3a \
    GlyphAdapter

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0-service \
    hwservicemanager

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti \
    android.hardware.health-service.qti_recovery 

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

PRODUCT_PACKAGES += \
    fstab.default \
    fstab.zram.2g \
    init.asteroids.hw.rc \
    init.asteroids.nfc.sh \
    init.asteroids.rc \
    init.target.rc \
    ueventd.asteroids.rc



# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/fts_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/fts_ts.idc \
    $(LOCAL_PATH)/keylayout/fts_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/fts_ts.kl \
    $(LOCAL_PATH)/configs/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Keymint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore_V3.xml


# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles_volcano_v1_Base.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_volcano_v1_Base.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_volcano_v1_Pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_volcano_v1_Pro.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Memtrack
PRODUCT_PACKAGES += \
    vendor.qti.hardware.memtrack-service

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-hal-st21-BASE.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st21-BASE.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-hal-st21-PRO.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st21-PRO.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-hal-st54j-JPN.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st54j-JPN.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-hal-st54j-PRO.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st54j-PRO.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci-JPN.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci-JPN.conf

# Nothing-fwk
PRODUCT_PACKAGES += \
    nothing-fwk

PRODUCT_BOOT_JARS += \
    nothing-fwk

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_JPN/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml

PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rro_overlays/partition_order.xml:$(TARGET_COPY_OUT_PRODUCT)/overlay/partition_order.xml

PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    AsteroidsApertureDevOverlay \
    AsteroidsApertureOverlay \
    AsteroidsEuiccOverlay \
    AsteroidsFrameworksOverlay \
    AsteroidsMainlineWifiOverlay \
    AsteroidsProMainlineWifiOverlay \
    AsteroidsProSettingsProviderOverlay \
    AsteroidsProWifiOverlay \
    AsteroidsSettingsOverlay \
    AsteroidsSettingsProviderOverlay \
    AsteroidsSystemUIOverlay \
    AsteroidsWallpaperPicker2Overlay \
    AsteroidsWallpaperPicker2PixelOverlay \
    AsteroidsWifiOverlay \
    CarrierConfigResCommon_Vendor \
    FrameworksResCommon_Vendor \
    FrameworksResTarget_Vendor \
    SecureElementResTarget_Vendor \
    SettingsResCommon_Vendor \
    SystemUIResCommon_Vendor \
    TelephonyResCommon_Sys \
    TelephonyResCommon_Vendor \
    UwbResCommon_Vendor \
    WifiResCommonMainline_Vendor \
    WifiResCommon_Vendor \
    WifiResMainlineTarget \
    WifiResTarget

# Partitions
ENABLE_VENDOR_IMAGE := true
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_BUILD_RECOVERY_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    vendor_bt_firmware_mountpoint \
    vendor_dsp_mountpoint \
    vendor_firmware_mnt_mountpoint

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/default-permissions-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-nothing.xml \
    $(LOCAL_PATH)/configs/default-permissions-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/default-permissions/default-permissions-nothing.xml \
    $(LOCAL_PATH)/configs/hidden-api-whitelist-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hidden-api-whitelist-nothing.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-nothing.xml \
    $(LOCAL_PATH)/configs/sysconfig_qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/sysconfig_qti.xml \
    $(LOCAL_PATH)/configs/sysconfig_wfc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/sysconfig_wfc.xml

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/perf/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfconfigstore.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/perf/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.system_ext.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries.txt

# Ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Secure Element
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_JPN/android.hardware.se.omapi.ese.xml

# Sku properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sku/build_EEA.prop:$(TARGET_COPY_OUT_ODM)/etc/build_EEA.prop \
    $(LOCAL_PATH)/sku/build_IND.prop:$(TARGET_COPY_OUT_ODM)/etc/build_IND.prop \
    $(LOCAL_PATH)/sku/build_JPN.prop:$(TARGET_COPY_OUT_ODM)/etc/build_JPN.prop \
    $(LOCAL_PATH)/sku/build_TUR.prop:$(TARGET_COPY_OUT_ODM)/etc/build_TUR.prop \
    $(LOCAL_PATH)/sku/build_ProEEA.prop:$(TARGET_COPY_OUT_ODM)/etc/build_ProEEA.prop \
    $(LOCAL_PATH)/sku/build_ProIND.prop:$(TARGET_COPY_OUT_ODM)/etc/build_ProIND.prop \
    $(LOCAL_PATH)/sku/build_ProROW.prop:$(TARGET_COPY_OUT_ODM)/etc/build_ProROW.prop \
    $(LOCAL_PATH)/sku/build_ProTUR.prop:$(TARGET_COPY_OUT_ODM)/etc/build_ProTUR.prop

PRODUCT_PACKAGES += \
    android.hardware.secure_element-service.thales

# Security
BOOT_SECURITY_PATCH := 2026-01-05
INIT_BOOT_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := 2026-04-05

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.dynamic.head_tracker.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.stepdetector.xml

TP_SYSFS_PATH := /sys/devices/platform/soc/ac0000.qcom,qupv3_0_geni_se/a80000.spi/spi_master/spi0/spi0.0

$(call soong_config_set,nothing_sensors,tp_single_tap_path,$(TP_SYSFS_PATH)/fts_gesture_single_tap_pressed)
$(call soong_config_set,nothing_sensors,tp_single_tap_enabled_path,$(TP_SYSFS_PATH)/fts_gesture_single_tap_enabled)
$(call soong_config_set,nothing_sensors,tp_single_tap_coords_path,/proc/touchpanel/gesture_code)

$(call soong_config_set,nothing_sensors,tp_udfps_path,$(TP_SYSFS_PATH)/fts_fod_pressed)
$(call soong_config_set,nothing_sensors,tp_udfps_enabled_path,$(TP_SYSFS_PATH)/fts_fod_enabled)

PRODUCT_PACKAGES += \
    android.hardware.sensors-service.nothing-multihal \
    sensors.nothing \
    sensors.dynamic_sensor_hal

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# Task profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Telephony
PRODUCT_PACKAGES += \
    qcrilNrDb_vendor

PRODUCT_BOOT_JARS += \
    nt-telephony-interface

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.qti

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator.service.nothing-rt_ics

# Wi-Fi
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml

PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    libwifi-hal-ctrl

