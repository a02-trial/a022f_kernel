# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the linux kernel.
#

ccflags-y := -fno-function-sections -fno-data-sections

ifdef CONFIG_MTPROF
ccflags-y += -Idrivers/misc/mediatek/mtprof/
endif

ifdef CONFIG_MTK_RAM_CONSOLE
ccflags-y += -Idrivers/misc/mediatek/include/
endif

obj-y                          := main.c version.c mounts.o
obj-y                          += noinitramfs.c
obj-$(CONFIG_BLK_DEV_INITRD)   += initramfs.c
obj-$(CONFIG_GENERIC_CALIBRATE_DELAY) += calibrate.c

ifneq ($(CONFIG_ARCH_INIT_TASK),y)
obj-y                          += init_task.c
endif

mounts-y			:= do_mounts.c
mounts-$(CONFIG_BLK_DEV_RAM)	+= do_mounts_rd.c
mounts-$(CONFIG_BLK_DEV_INITRD)	+= do_mounts_initrd.c
mounts-$(CONFIG_BLK_DEV_MD)	+= do_mounts_md.c

# dependencies on generated files need to be listed explicitly
$(obj)/version.o: include/generated/compile.h

# compile.h changes depending on hostname, generation number, etc,
# so we regenerate it always.
# mkcompile_h will make sure to only update the
# actual file if its content has changed.

       chk_compile.h = :
 quiet_chk_compile.h = echo '  CHK     $@'
silent_chk_compile.h = :
include/generated/compile.h: FORCE
	@$($(quiet)chk_compile.h)
	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
	"$(CC) $(KBUILD_CFLAGS)" "$(LD)"
