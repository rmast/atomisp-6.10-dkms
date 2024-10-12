# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the Linux kernel device drivers.
#
# 15 Sep 2000, Christoph Hellwig <hch@infradead.org>
# Rewritten to use lists instead of if-statements.
#

# Some driver Makefiles miss $(srctree)/ for include directive.
ifdef building_out_of_srctree
MAKEFLAGS += --include-dir=$(srctree)
endif

obj-y				+= media/
obj-$(CONFIG_STAGING)		+= staging/
