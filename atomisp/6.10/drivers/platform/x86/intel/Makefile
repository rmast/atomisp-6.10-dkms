# SPDX-License-Identifier: GPL-2.0
#
# Makefile for drivers/platform/x86/intel
# Intel x86 Platform-Specific Drivers
#

obj-$(CONFIG_INTEL_ATOMISP2_PDX86)	+= atomisp2/
obj-$(CONFIG_INTEL_SAR_INT1092)		+= int1092/
obj-$(CONFIG_INTEL_TELEMETRY)		+= telemetry/
obj-$(CONFIG_INTEL_WMI)			+= wmi/


# Intel PMIC / PMC / P-Unit drivers
intel_bxtwc_tmu-y			:= bxtwc_tmu.o
obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
intel_bytcrc_pwrsrc-y			:= bytcrc_pwrsrc.o
obj-$(CONFIG_INTEL_BYTCRC_PWRSRC)	+= intel_bytcrc_pwrsrc.o
intel_chtdc_ti_pwrbtn-y			:= chtdc_ti_pwrbtn.o
obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
intel_mrfld_pwrbtn-y			:= mrfld_pwrbtn.o
obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
intel_punit_ipc-y			:= punit_ipc.o
obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
