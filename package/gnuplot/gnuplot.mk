#############################################################
#
# gnuplot
#
#############################################################

#GNUPLOT_VERSION = 3.7.3
GNUPLOT_VERSION = 4.0.0
GNUPLOT_SITE = ftp://ftp.dante.de/pub/tex/graphics/gnuplot/
GNUPLOT_MAKE_ENV = CURSES_LIB="-lncurses"
GNUPLOT_CONF_OPT =
GNUPLOT_DEPENDENCIES = zlib libpng

GNUPLOT_CONF_OPT = \
   --without-x \
   --disable-mouse \
   --without-tutorial \
   --without-row-help \
   --without-lisp-files \
   --without-docs \

define GNUPLOT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/src/gnuplot $(TARGET_DIR)/usr/bin/gnuplot
endef

define GNUPLOT_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/gnuplot
endef

$(eval $(call AUTOTARGETS,package,gnuplot))
