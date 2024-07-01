# Dev keys
include vendor/lineage-priv/keys/keys.mk

# Overlays
    PRODUCT_PACKAGES += \
        RisingUpdaterOverlay$(RISING_PACKAGE_TYPE)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
