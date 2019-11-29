DEVICE_PATH := device/realme/RMX1931
BOARD_VENDOR := realme

# Security patch level
VENDOR_SECURITY_PATCH := 2019-11-05

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml

-include vendor/realme/RMX1931/BoardConfigVendor.mk