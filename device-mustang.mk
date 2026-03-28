#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := 6.6
TARGET_KERNEL_DEVICE := muzel
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

# Inherit from laguna
include device/google/laguna/common.mk

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResOverlayProductMuzel \
    FrameworkResOverlayVendorMuzel \
    PixelNfcOverlayMuzel \
    SafetyRegulatoryInfoOverlayProductMuzel \
    SystemUIGoogleOverlayVendorMuzel

PRODUCT_PACKAGES += \
    ConnectivityResourcesOverlayMuzelOverride \
    DMServiceOverlayVendorMustang \
    FrameworkResOverlayProductMustang \
    FrameworkResOverlayVendorMustang \
    PixelDisplayServiceOverlayProductMustang \
    PixelNfcOverlayMustang \
    PixelUwbOverlayRG5 \
    PixelWifiOverlay2025Mustang \
    SettingsMustangOverlay \
    SystemUIGoogleOverlayVendorMustang

PRODUCT_PACKAGES += \
    ApertureOverlayMustang

# PowerShare
include hardware/google/pixel/powershare/device.mk

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mustang.rc

PRODUCT_PACKAGES += \
    init.recovery.muzel.touch.rc

# Satellite
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/conf/allowlist_satellite.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_satellite.xml \
    frameworks/native/data/etc/android.hardware.telephony.satellite.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.satellite.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Thread HAL
PRODUCT_PACKAGES += \
    com.android.hardware.threadnetwork

$(call soong_config_set,threadnetwork_apex,init_rc_namespace,device/google/muzel)

# VINTF
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml

# Window extensions
$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)
