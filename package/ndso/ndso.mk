#############################################################
#
# ndso
#
#############################################################

NDSO_VERSION = 0.1.0
NDSO_SITE = http://wiki.analog.com/_media/software/linux/docs/iio/

NDSO_SOURCE = ndso-$(NDSO_VERSION).tar.gz

define NDSO_BUILD_CMDS
	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
		-C $(@D) all
endef

define NDSO_INSTALL_TARGET_CMDS
	cp -a $(@D)/www $(TARGET_DIR)/var/
	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
	$(INSTALL) -m 0755 $(@D)/ndso \
		$(TARGET_DIR)/var/www/data/cgi-bin/ndso.cgi
endef

define NDSO_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/var/www/data/cgi-bin/ndso.cgi
endef

$(eval $(call GENTARGETS))
