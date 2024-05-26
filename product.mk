# Overlays
ifdef RisingUpdaterOverlay$(RISING_PACKAGE_TYPE)
    PRODUCT_PACKAGES += \
        RisingUpdaterOverlay$(RISING_PACKAGE_TYPE)
endif

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
