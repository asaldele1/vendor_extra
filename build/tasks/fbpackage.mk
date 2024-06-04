RISING_TARGET_PACKAGE := $(PRODUCT_OUT)/RisingOS-$(RISING_BUILD_VERSION)-ota.zip
RISING_TARGET_UPDATEPACKAGE := $(PRODUCT_OUT)/RisingOS-$(RISING_BUILD_VERSION)-fastboot.zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: fbpackage
fbpackage: $(DEFAULT_GOAL) $(INTERNAL_OTA_PACKAGE_TARGET) $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(RISING_TARGET_PACKAGE)
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(RISING_TARGET_UPDATEPACKAGE)
	$(hide) $(SHA256) $(RISING_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(RISING_TARGET_PACKAGE).sha256sum
	@echo ""
	@echo "                                                               " >&2
	@echo "                                                               " >&2
	@echo "                                                               " >&2
	@echo "                                                               " >&2
	@echo "  ______ _____ _______ _____ __   _  ______      _____  _______" >&2
	@echo " |_____/   |   |______   |   | \  | |  ____     |     | |______" >&2
	@echo " |    \_ __|__ ______| __|__ |  \_| |_____|     |_____| ______|" >&2
	@echo "                                                               " >&2
	@echo "                                                               " >&2
	@echo "                   rising from the bottom                      " >&2
	@echo "                                                               " >&2
	@echo "                                                               " >&2
	@echo "                                                               " >&2
	@echo "                                                               " >&2
	@echo ""
	@echo "Creating json OTA..." >&2
	$(hide) ./vendor/rising/build/tools/createjson.sh $(TARGET_DEVICE) $(PRODUCT_OUT) RisingOS-$(RISING_BUILD_VERSION)-ota.zip $(RISING_VERSION) $(RISING_CODENAME) $(RISING_PACKAGE_TYPE) $(RISING_RELEASE_TYPE)
	$(hide) cp -f $(PRODUCT_OUT)/$(TARGET_DEVICE).json vendor/risingOTA/$(TARGET_DEVICE).json
	@echo ":·.·.·::·.·.·::·.·.·::·.·.·::·.·.·::·.·.·::·.·.·::·.·.·::·.·.·:" >&2
	@echo " Size            : $(shell du -hs $(RISING_TARGET_PACKAGE) | awk '{print $$1}')"
	@echo " Size(in bytes)  : $(shell wc -c $(RISING_TARGET_PACKAGE) | awk '{print $$1}')"
	@echo " Package Complete: $(RISING_TARGET_PACKAGE)" >&2
	@echo ":·.·.·::·.·.·::·.·.·::·.·.·::·.·.·::·.·.·::·.·.·::·.·.·::·.·.·:" >&2
	@echo ""
	@echo "*************************FASTBOOT BUILD*************************" >&2
	@echo " Size            : $(shell du -hs $(RISING_TARGET_UPDATEPACKAGE) | awk '{print $$1}')"
	@echo " Size(in bytes)  : $(shell wc -c $(RISING_TARGET_UPDATEPACKAGE) | awk '{print $$1}')"
	@echo " Package Complete: $(RISING_TARGET_UPDATEPACKAGE)               " >&2
	@echo "****************************************************************" >&2
	@echo ""
