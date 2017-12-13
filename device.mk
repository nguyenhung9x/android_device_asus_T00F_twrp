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

BOARD_TOUCHSCREEN_DRIVER := synaptics_dsx

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/T00F/overlay

# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Asus properties
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.build.asus.sku=WW

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.redhookbay \
    init.recovery.redhookbay.rc \
    intel_prop.cfg \
    ueventd.redhookbay.rc
