# Atom ISP Camera driver for Linux Kernels >= 6.10
This is Atom ISP Camera (Image Signal Processor for camera) DKMS driver for Kernels >= 6.10.

Why drivers below 6.10? Because from this version Intel started to add and fix something. I've tried the drivers for 6.8 and 6.9 without success, so is useless to create DKMS for Kernels below 6.10.

This driver is the original Atom ISP driver from Kernels but converted as DKMS.

Because the kernels are not comming with a precompiled Atom ISP driver, I did this repository to be able to compile as external driver.

Be careful that is possible to still not be able to use the camera because the drivers are still in staging and Intel is move with snail speed to fix the drivers.

Please check this thread on GitHub https://github.com/jfwells/linux-asus-t100ta/issues/4 for more details.

# Note
After adding a new driver, you must run ./build-dkms script.

Because DKMS is expecting to have the same modules name and paths. If a new driver it has more or less modules DKMS will fail.

This script will search for symbols and modules in each version of atomisp directory and will compare between kernel versions.

In case there are some differences between the Kernel drivers, will automatically creates a new package.

Each package will contain drivers which has same modules names and modules paths.

Example: we have drivers for kernels 6.10, 6.11, 6.12, 6.13, 6.14 and 6.15.

1. 6.10 and 6.11 are identical (modules names and paths), but 6.12 is different from 6.11.

2. 6.12 and 6.13 are identical (modules names and paths), but 6.14 is different from 6.13.

3. 6.14 and 6.15 are identical (modules names and paths).

The script will create these packages:

1. atomisp-6.10-dkms containing drivers for 6.10 and 6.11.
2. atomisp-6.12-dkms containing drivers for 6.12 and 6.13.
3. atomisp-6.14-dkms containing drivers for 6.14 and 6.15.

Each package has a MIN and MAX kernel defined, so will not be processed by kernels < MIN and > MAX.

So atomisp-6.10-dkms will be compiled on kernels 6.10 and 6.11 only. If you have a kernel 6.12, DKMS will skip this package.
