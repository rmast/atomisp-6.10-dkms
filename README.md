# Atom ISP Camera driver for Linux Kernels >= 6.10
This is Atom ISP Camera (Image Signal Processor for camera) DKMS driver for Kernels >= 6.10.

Why drivers below 6.10? Because from this version Intel started to add and fix something. I've tried the drivers for 6.8 and 6.9 without success, so is useless to create DKMS for Kernels below 6.10.

This driver is the original Atom ISP driver from Kernels but converted as DKMS.

Because the kernels are not comming with a precompiled Atom ISP driver, I did this repository to be able to compile as external driver.

Be careful that is possible to still not be able to use the camera because the drivers are still in staging and Intel is move with snail speed to fix the drivers.

Please check this thread on GitHub https://github.com/jfwells/linux-asus-t100ta/issues/4 for more details.

