savedcmd_drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.mod := printf '%s\n'   tps68470.o tps68470_board_data.o common.o | awk '!x[$$0]++ { print("drivers/platform/x86/intel/int3472/"$$0) }' > drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.mod