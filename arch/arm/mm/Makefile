# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the linux arm-specific parts of the memory manager.
#

obj-y				:= extable.c fault.c init.c iomap.c
obj-y				+= dma-mapping$(MMUEXT).c
obj-$(CONFIG_MMU)		+= fault-armv.c flush.c idmap.c ioremap.c \
				   mmap.c pgd.c mmu.c pageattr.c

ifneq ($(CONFIG_MMU),y)
obj-y				+= nommu.c
endif

obj-$(CONFIG_ARM_PTDUMP)	+= dump.c

ifneq ($(CONFIG_ARM_LPAE),y)
ifeq ($(CONFIG_ARCH_HAS_PTE_SPECIAL),y)
obj-$(CONFIG_MMU)		+= gup.c
endif
endif

obj-$(CONFIG_MODULES)		+= proc-syms.c
obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.c

obj-$(CONFIG_ALIGNMENT_TRAP)	+= alignment.c
obj-$(CONFIG_HIGHMEM)		+= highmem.c
obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.c
obj-$(CONFIG_ARM_PV_FIXUP)	+= pv-fixup-asm.c

obj-$(CONFIG_CPU_ABRT_NOMMU)	+= abort-nommu.c
obj-$(CONFIG_CPU_ABRT_EV4)	+= abort-ev4.c
obj-$(CONFIG_CPU_ABRT_EV4T)	+= abort-ev4t.c
obj-$(CONFIG_CPU_ABRT_LV4T)	+= abort-lv4t.c
obj-$(CONFIG_CPU_ABRT_EV5T)	+= abort-ev5t.c
obj-$(CONFIG_CPU_ABRT_EV5TJ)	+= abort-ev5tj.c
obj-$(CONFIG_CPU_ABRT_EV6)	+= abort-ev6.c
obj-$(CONFIG_CPU_ABRT_EV7)	+= abort-ev7.c

AFLAGS_abort-ev6.c	:=-Wa,-march=armv6k
AFLAGS_abort-ev7.c	:=-Wa,-march=armv7-a

obj-$(CONFIG_CPU_PABRT_LEGACY)	+= pabort-legacy.c
obj-$(CONFIG_CPU_PABRT_V6)	+= pabort-v6.c
obj-$(CONFIG_CPU_PABRT_V7)	+= pabort-v7.c

obj-$(CONFIG_CPU_CACHE_V4)	+= cache-v4.c
obj-$(CONFIG_CPU_CACHE_V4WT)	+= cache-v4wt.c
obj-$(CONFIG_CPU_CACHE_V4WB)	+= cache-v4wb.c
obj-$(CONFIG_CPU_CACHE_V6)	+= cache-v6.c
obj-$(CONFIG_CPU_CACHE_V7)	+= cache-v7.c
obj-$(CONFIG_CPU_CACHE_FA)	+= cache-fa.c
obj-$(CONFIG_CPU_CACHE_NOP)	+= cache-nop.c
obj-$(CONFIG_CPU_CACHE_V7M)	+= cache-v7m.c
obj-$(CONFIG_MEDIATEK_SOLUTION)	+= cache-mtk-v8.c

AFLAGS_cache-v6.c	:=-Wa,-march=armv6
AFLAGS_cache-v7.c	:=-Wa,-march=armv7-a
AFLAGS_cache-v7m.c	:=-Wa,-march=armv7-m

obj-$(CONFIG_CPU_COPY_V4WT)	+= copypage-v4wt.c
obj-$(CONFIG_CPU_COPY_V4WB)	+= copypage-v4wb.c
obj-$(CONFIG_CPU_COPY_FEROCEON)	+= copypage-feroceon.c
obj-$(CONFIG_CPU_COPY_V6)	+= copypage-v6.c context.c
obj-$(CONFIG_CPU_SA1100)	+= copypage-v4mc.c
obj-$(CONFIG_CPU_XSCALE)	+= copypage-xscale.c
obj-$(CONFIG_CPU_XSC3)		+= copypage-xsc3.c
obj-$(CONFIG_CPU_COPY_FA)	+= copypage-fa.c

CFLAGS_copypage-feroceon.c := -march=armv5te

obj-$(CONFIG_CPU_TLB_V4WT)	+= tlb-v4.c
obj-$(CONFIG_CPU_TLB_V4WB)	+= tlb-v4wb.c
obj-$(CONFIG_CPU_TLB_V4WBI)	+= tlb-v4wbi.c
obj-$(CONFIG_CPU_TLB_FEROCEON)	+= tlb-v4wbi.c	# reuse v4wbi TLB functions
obj-$(CONFIG_CPU_TLB_V6)	+= tlb-v6.c
obj-$(CONFIG_CPU_TLB_V7)	+= tlb-v7.c
obj-$(CONFIG_CPU_TLB_FA)	+= tlb-fa.c

AFLAGS_tlb-v6.c		:=-Wa,-march=armv6
AFLAGS_tlb-v7.c		:=-Wa,-march=armv7-a

obj-$(CONFIG_CPU_ARM7TDMI)	+= proc-arm7tdmi.c
obj-$(CONFIG_CPU_ARM720T)	+= proc-arm720.c
obj-$(CONFIG_CPU_ARM740T)	+= proc-arm740.c
obj-$(CONFIG_CPU_ARM9TDMI)	+= proc-arm9tdmi.c
obj-$(CONFIG_CPU_ARM920T)	+= proc-arm920.c
obj-$(CONFIG_CPU_ARM922T)	+= proc-arm922.c
obj-$(CONFIG_CPU_ARM925T)	+= proc-arm925.c
obj-$(CONFIG_CPU_ARM926T)	+= proc-arm926.c
obj-$(CONFIG_CPU_ARM940T)	+= proc-arm940.c
obj-$(CONFIG_CPU_ARM946E)	+= proc-arm946.c
obj-$(CONFIG_CPU_FA526)		+= proc-fa526.c
obj-$(CONFIG_CPU_ARM1020)	+= proc-arm1020.c
obj-$(CONFIG_CPU_ARM1020E)	+= proc-arm1020e.c
obj-$(CONFIG_CPU_ARM1022)	+= proc-arm1022.c
obj-$(CONFIG_CPU_ARM1026)	+= proc-arm1026.c
obj-$(CONFIG_CPU_SA110)		+= proc-sa110.c
obj-$(CONFIG_CPU_SA1100)	+= proc-sa1100.c
obj-$(CONFIG_CPU_XSCALE)	+= proc-xscale.c
obj-$(CONFIG_CPU_XSC3)		+= proc-xsc3.c
obj-$(CONFIG_CPU_MOHAWK)	+= proc-mohawk.c
obj-$(CONFIG_CPU_FEROCEON)	+= proc-feroceon.c
obj-$(CONFIG_CPU_V6)		+= proc-v6.c
obj-$(CONFIG_CPU_V6K)		+= proc-v6.c
obj-$(CONFIG_CPU_V7)		+= proc-v7.c proc-v7-bugs.c
obj-$(CONFIG_CPU_V7M)		+= proc-v7m.c

AFLAGS_proc-v6.c	:=-Wa,-march=armv6
AFLAGS_proc-v7.c	:=-Wa,-march=armv7-a

obj-$(CONFIG_OUTER_CACHE)	+= l2c-common.c
obj-$(CONFIG_CACHE_FEROCEON_L2)	+= cache-feroceon-l2.c
obj-$(CONFIG_CACHE_L2X0)	+= cache-l2x0.c l2c-l2x0-resume.c
obj-$(CONFIG_CACHE_L2X0_PMU)	+= cache-l2x0-pmu.c
obj-$(CONFIG_CACHE_XSC3L2)	+= cache-xsc3l2.c
obj-$(CONFIG_CACHE_TAUROS2)	+= cache-tauros2.c
obj-$(CONFIG_CACHE_UNIPHIER)	+= cache-uniphier.c

KBUILD_CPPFLAGS += -I$(srctree)/drivers/misc/mediatek/include

obj-$(CONFIG_MEDIATEK_SOLUTION)	+= cache-mtk-v7.c
