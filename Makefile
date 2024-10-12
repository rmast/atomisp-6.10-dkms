#
# Makefile for Linux ATOMISP Media filesystem driver.
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
# If we compile only stanging/media/atomisp we will detect the camera but there is no v4l2 device under /dev/
#
# To respect the kernel flow, we need these definitions:
#   To build ipu-bridge.ko as module:
#     CONFIG_IPU_BRIDGE=m
#   To build ipu3-cio2.ko as module:
#     CONFIG_VIDEO_IPU3_CIO2=m
#   To build mei_ace.ko mei_csi.ko as module:
#     CONFIG_INTEL_VSC=m
#   To build staging/media/atomisp:
#     CONFIG_STAGING=y
#     CONFIG_INTEL_ATOMISP=m
#     CONFIG_VIDEO_ATOMISP=m
#   For  Anniedale (Merrifield+ / Moorefield) and Cherrytrail SoCs:
#     CONFIG_VIDEO_ATOMISP_ISP2401=y
#   Setting this symbol to NO will enables support for Atom ISP2400-based boards (Merrifield and Baytrail SoCs)
#
# Each definition in Kconfig is expanded as:
#    If CONFIG_FOU=y, then we need to pass to compiler macro -DCONFIG_FOU
#    If CONFIG_FOU=m, then we need to pass to compiler macro -DCONFIG_FOU_MODULE
# and used my IS_ENABLE(), IS_MODULE() or IS_BUILTIN() macros in Kernel

# Autodetection if we have a driver for the specific MAJOR.MINOR version of kernel
export KVER_MAJ_MIN = $(shell echo ${KERNELRELEASE} | sed "s/\([0-9]\+\.[0-9]\+\)\..*/\1/g")

export DRIVER_NAME := atomisp

# Define SYMBOLS / MACROS for which modules to build
export CONFIG_STAGING=y

# Build pci/intel/ipu-bridge.ko
export CONFIG_IPU_BRIDGE=m
export CONFIG_INTEL_VSC=m
# CONFIG_VIDEO_INTEL_IPU6 added in 6.10
export CONFIG_VIDEO_INTEL_IPU6=m
export CONFIG_VIDEO_IPU3_CIO2=m

# Build :
#   Dependency of CONFIG_INTEL_ATOMISP
#     stating/media/atomisp/isp/atomisp-mt9m114.o
#     stating/media/atomisp/isp/atomisp-gc2235.o
#     stating/media/atomisp/isp/atomisp-ov2722.o
#     stating/media/atomisp/isp/atomisp-gc0310.o
#     stating/media/atomisp/isp/atomisp-libmsrlisthelper.o
#     stating/media/atomisp/isp/atomisp-lm3554.o
#
#   Dependency of CONFIG_VIDEO_ATOMISP
#     stating/media/atomisp/atomisp.ko
#     stating/media/atomisp/pci/atomisp_gmin_platform.ko

# CONFIG_INTEL_ATOMISP removed in 6.10
export CONFIG_VIDEO_ATOMISP=m
export CONFIG_VIDEO_ATOMISP_OV2722=m
export CONFIG_VIDEO_ATOMISP_GC2235=m
export CONFIG_VIDEO_ATOMISP_MSRLIST_HELPER=m
export CONFIG_VIDEO_ATOMISP_MT9M114=m
# CONFIG_VIDEO_ATOMISP_OV5693 removed in 6.7
export CONFIG_VIDEO_ATOMISP_GC0310=m
# CONFIG_VIDEO_ATOMISP_LM3554 was removed in 6.10
# CONFIG_VIDEO_ATOMISP_ISP2401 removed in 6.7

# Add necessary macros to the compiler depending on whan we get on make command
ifeq ($(CONFIG_IPU_BRIDGE),m)
KBUILD_CFLAGS += -DCONFIG_IPU_BRIDGE_MODULE
endif

ifeq ($(CONFIG_VIDEO_IPU3_CIO2),m)
KBUILD_CFLAGS += -DCONFIG_VIDEO_IPU3_CIO2_MODULE
endif

ifeq ($(CONFIG_INTEL_VSC),m)
KBUILD_CFLAGS += -DCONFIG_INTEL_VSC_MODULE
endif

ifeq ($(CONFIG_INTEL_ATOMISP),m)
KBUILD_CFLAGS += -DCONFIG_INTEL_ATOMISP_MODULE
endif

ifeq ($(CONFIG_VIDEO_ATOMISP),m)
KBUILD_CFLAGS += -DCONFIG_VIDEO_ATOMISP_MODULE
endif

ifeq ($(CONFIG_VIDEO_ATOMISP_MT9M114),m)
KBUILD_CFLAGS += -DCONFIG_VIDEO_ATOMISP_MT9M114_MODULE
endif

ifeq ($(CONFIG_VIDEO_ATOMISP_GC2235),m)
KBUILD_CFLAGS += -DCONFIG_VIDEO_ATOMISP_GC2235_MODULE
endif

ifeq ($(CONFIG_VIDEO_ATOMISP_OV2722),m)
KBUILD_CFLAGS += -DCONFIG_VIDEO_ATOMISP_OV2722_MODULE
endif

ifeq ($(CONFIG_VIDEO_ATOMISP_GC0310),m)
KBUILD_CFLAGS += -DCONFIG_VIDEO_ATOMISP_GC0310_MODULE
endif

ifeq ($(CONFIG_VIDEO_ATOMISP_MSRLIST_HELPER),m)
KBUILD_CFLAGS += -DCONFIG_VIDEO_ATOMISP_MSRLIST_HELPER_MODULE
endif

ifneq ($(KERNELRELEASE),)
# call from kernel build system

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

KVER_MAJ_MIN    := $(word 2,$(VERS-AS-LIST))

$(info $(MAJOR)-$(MINOR)-$(BUGFIX))
$(exit 1)

obj-y := $(DRIVER_NAME)/

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
	rm -f ${MDIR}/kernel/extra/drivers/staging/media/$(DRIVER_NAME)/$(DRIVER_NAME).ko
	install -m644 -b -D atomisp/$(KVER_MAJ_MIN)/drivers/staging/media/$(DRIVER_NAME)/$(DRIVER_NAME).ko ${MDIR}/kernel/extra/drivers/staging/media/$(DRIVER_NAME)/$(DRIVER_NAME).ko
	depmod -aq

PHONY += uninstall
uninstall:
	rm -rf ${MDIR}/kernel/extra/drivers/staging/media/$(DRIVER_NAME)/$(DRIVER_NAME).ko
	depmod -aq

endif

.PHONY : $(PHONY)
