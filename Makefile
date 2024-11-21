#
# Makefile for Linux Atom ISP driver for Kernel >=6.10 .
#
# This driver needs multiple components, which some of them are not build in kernel relases
#   media/pci/intel/ipu-bridge.ko
#   media/pci/intel/ipu3/ipu3-cio2.ko
#   media/pci/intel/ivcs/mei_ace.ko
#   media/pci/intel/ivcs/mei_csi.c
#   staging/media/atomisp/pci/atomisp_gmin_platform.ko
#   staging/media/atomisp/i2c/atomisp-gc0310.ko
#   staging/media/atomisp/i2c/atomisp-gc2235.ko
#   staging/media/atomisp/i2c/atomisp-libmsrlisthelper.ko
#   staging/media/atomisp/i2c/atomisp-lm3554.ko
#   staging/media/atomisp/i2c/atomisp-mt9m114.ko
#   staging/media/atomisp/i2c/atomisp-ov2722.ko
#
# Also I found some missing drivers are not build by Debian Kernel by default in drivers/platform/x86/intel/
#
# If we compile only stanging/media/atomisp we will detect the camera but there is no v4l2 device under /dev/
#
#
# To respect the kernel flow, we need these definitions:
# 1. Build Intel media PCI drivers:
#   To build ipu-bridge.ko, ipu3-cio2.ko and ipu6.ko as module.
# 2. Build staging/media/atomisp drivers:
#   To build I2C modules atomisp-mt9m114, atomisp-gc2235, atomisp-ov2722, atomisp-gc0310 and atomisp-libmsrlisthelper.
# 3. Build additional platform drivers
#

#
# Each definition in Kconfig is expanded as:
#    If CONFIG_FOU=y, then we need to pass to compiler macro -DCONFIG_FOU
#    If CONFIG_FOU=m, then we need to pass to compiler macro -DCONFIG_FOU_MODULE
# and used my IS_ENABLE(), IS_MODULE() or IS_BUILTIN() macros in Kernel

# Autodetection if we have a driver for the specific MAJOR.MINOR version of kernel
export DRIVER_NAME := atomisp

# CONFIG_STAGING must be y to be able to build atomisp/drivers/${KVER}/staging/
export CONFIG_STAGING=y

# When you use make KVER=$(uname -r), make will not match this condition.
# First will go "else" and then will recall this Makefile with defined KERNELRELASE.

ifneq ($(KERNELRELEASE),)
# call from kernel build system

export KVER_MAJ_MIN = $(shell echo ${KERNELRELEASE} | sed "s/\([0-9]\+\.[0-9]\+\)\..*/\1/g")

#$(info "Include Kernel ver $(KVER_MAJ_MIN) specific symbols: Symbols-$(KVER_MAJ_MIN).mk and Kbuild-Cflags-$(KVER_MAJ_MIN).mk")

# Load symbols
include $(M)/Symbols-$(KVER_MAJ_MIN).mk
# Define KBUILD_CFLAGS for each Kernel version for each Symbol defined in Symbols-$(KVER_MAJ_MIN).mk
include $(M)/Kbuild-CFLAGS-$(KVER_MAJ_MIN).mk

obj-y := $(DRIVER_NAME)/

else
# external module build

#
# KDIR is a path to a directory containing kernel source.
# It can be specified on the command line passed to make to enable the module to
# be built and installed for a kernel other than the one currently running.
# By default it is the path to the symbolic link created when
# the current kernel's modules were installed, but
# any valid path to the directory in which the target kernel's source is located
# can be provided on the command line.
#
# In case we want to compile the module against different kernel version than current one
KVER		?= $(shell uname -r)
KDIR		?= /lib/modules/$(KVER)/build
MDIR		?= /lib/modules/$(KVER)
PWD		:= $(shell pwd)

#KVER_MAJ_MIN	:= $(word 2,$(VERS-AS-LIST))

KVER_MAJ_MIN = $(shell echo ${KVER} | sed "s/\([0-9]\+\.[0-9]\+\)\..*/\1/g")

#obj-y := $(DRIVER_NAME)/

$(info "External module build..")

%.ko:
	$(MAKE) -C $(KDIR) M=$(PWD)

PHONY += all
all: clean $(DRIVER_NAME).ko

PHONY += modules
modules: $(DRIVER_NAME).ko

PHONY += clean
clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

PHONY += help
help:
	$(MAKE) -C $(KDIR) M=$(PWD) help

PHONY += install
install:
	echo "Curent path: $(PWD)"
	for subdir in $(shell find $(PWD)/atomisp/$(KVER_MAJ_MIN)/drivers -maxdepth 1  -type d -printf "%f\n" | tail -n+2); do \
	    echo $$subdir; \
	    MODULE_PATH=$(PWD)/atomisp/$(KVER_MAJ_MIN)/drivers/$$subdir; \
	    echo $${MODULE_PATH}; \
	    for module in `find $${MODULE_PATH} \( -name "*.ko" \) -printf "%h/%f\n"`; do \
		MODULE_PATH=$${module#$(PWD)/atomisp/$(KVER_MAJ_MIN)/drivers/}; \
		echo $${MODULE_PATH} ; \
		install -m644 -b -D $$i $(PWD)/atomisp/$(KVER_MAJ_MIN)/drivers/$${MODULE_PATH} ${MDIR}/kernel/extra/$(DRIVER_NAME)/$$(dirname $${MODULE_PATH})/$$(basename $${MODULE_PATH}) ; \
	    done \
	done
	depmod -a

PHONY += uninstall
uninstall:
	$(info $(DRIVER_NAME))
	rm -rf ${MDIR}/kernel/extra/$(DRIVER_NAME) ; \
	depmod -a

endif

.PHONY : $(PHONY)
