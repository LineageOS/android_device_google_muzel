#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/google/laguna/aosp_common.mk)
$(call inherit-product, device/google/muzel/device-mustang.mk)

PRODUCT_NAME := aosp_mustang
PRODUCT_DEVICE := mustang
PRODUCT_MODEL := Pixel 10 Pro XL
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google

PRODUCT_NAME_FOR_ATTESTATION := mustang
PRODUCT_DEVICE_FOR_ATTESTATION := mustang
PRODUCT_MODEL_FOR_ATTESTATION := Pixel 10 Pro XL
PRODUCT_BRAND_FOR_ATTESTATION := google
PRODUCT_MANUFACTURER_FOR_ATTESTATION := Google
