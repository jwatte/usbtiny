# ======================================================================
# USBtiny global Makefile
#
# Copyright 2006-2010 Dick Streefland
#
# This is free software, licensed under the terms of the GNU General
# Public License as published by the Free Software Foundation.
# ======================================================================

DIR	= spi ir usbtinyisp template util
TARGETS = all clean clobber

define deftarget
$(1):	$(patsubst %,make_$(1)_%,$(DIR))
endef

$(foreach target,$(TARGETS),$(eval $(call deftarget,$(target))))

define mktarget
make_$(1)_$(2):
	$(MAKE) $(MFLAGS) -C $(2) $(1)
endef

$(foreach target,$(TARGETS),$(foreach dir,$(DIR),$(eval $(call mktarget,$(target),$(dir)))))
