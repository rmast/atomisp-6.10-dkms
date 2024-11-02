savedcmd_drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.o := ld -m elf_x86_64 -z noexecstack   -r -o drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.o @drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.mod  ; ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --static-call --uaccess --prefix=16  --link  --module drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.o

drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.o: $(wildcard ./tools/objtool/objtool)
