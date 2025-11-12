# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the linux arm-specific parts of the memory manager.
#

obj-y				:= extable.S fault.S init.S iomap.S
obj-y				+= dma-mapping$(MMUEXT).S
obj-$(CONFIG_MMU)		+= fault-armv.S flush.S idmap.S ioremap.S \
				   mmap.S pgd.S mmu.S pageattr.S

ifneq ($(CONFIG_MMU),y)
obj-y				+= nommu.S
endif

obj-$(CONFIG_ARM_PTDUMP)	+= dump.S

ifneq ($(CONFIG_ARM_LPAE),y)
ifeq ($(CONFIG_ARCH_HAS_PTE_SPECIAL),y)
obj-$(CONFIG_MMU)		+= gup.S
endif
endif

obj-$(CONFIG_MODULES)		+= proc-syms.S
obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.S

obj-$(CONFIG_ALIGNMENT_TRAP)	+= alignment.S
obj-$(CONFIG_HIGHMEM)		+= highmem.S
obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.S
obj-$(CONFIG_ARM_PV_FIXUP)	+= pv-fixup-asm.S

obj-$(CONFIG_CPU_ABRT_NOMMU)	+= abort-nommu.S
obj-$(CONFIG_CPU_ABRT_EV4)	+= abort-ev4.S
obj-$(CONFIG_CPU_ABRT_EV4T)	+= abort-ev4t.S
obj-$(CONFIG_CPU_ABRT_LV4T)	+= abort-lv4t.S
obj-$(CONFIG_CPU_ABRT_EV5T)	+= abort-ev5t.S
obj-$(CONFIG_CPU_ABRT_EV5TJ)	+= abort-ev5tj.S
obj-$(CONFIG_CPU_ABRT_EV6)	+= abort-ev6.S
obj-$(CONFIG_CPU_ABRT_EV7)	+= abort-ev7.S

AFLAGS_abort-ev6.S	:=-Wa,-march=armv6k
AFLAGS_abort-ev7.S	:=-Wa,-march=armv7-a

obj-$(CONFIG_CPU_PABRT_LEGACY)	+= pabort-legacy.S
obj-$(CONFIG_CPU_PABRT_V6)	+= pabort-v6.S
obj-$(CONFIG_CPU_PABRT_V7)	+= pabort-v7.S

obj-$(CONFIG_CPU_CACHE_V4)	+= cache-v4.S
obj-$(CONFIG_CPU_CACHE_V4WT)	+= cache-v4wt.S
obj-$(CONFIG_CPU_CACHE_V4WB)	+= cache-v4wb.S
obj-$(CONFIG_CPU_CACHE_V6)	+= cache-v6.S
obj-$(CONFIG_CPU_CACHE_V7)	+= cache-v7.S
obj-$(CONFIG_CPU_CACHE_FA)	+= cache-fa.S
obj-$(CONFIG_CPU_CACHE_NOP)	+= cache-nop.S
obj-$(CONFIG_CPU_CACHE_V7M)	+= cache-v7m.S
obj-$(CONFIG_MEDIATEK_SOLUTION)	+= cache-mtk-v8.S

AFLAGS_cache-v6.S	:=-Wa,-march=armv6
AFLAGS_cache-v7.S	:=-Wa,-march=armv7-a
AFLAGS_cache-v7m.S	:=-Wa,-march=armv7-m

obj-$(CONFIG_CPU_COPY_V4WT)	+= copypage-v4wt.S
obj-$(CONFIG_CPU_COPY_V4WB)	+= copypage-v4wb.S
obj-$(CONFIG_CPU_COPY_FEROCEON)	+= copypage-feroceon.S
obj-$(CONFIG_CPU_COPY_V6)	+= copypage-v6.S context.S
obj-$(CONFIG_CPU_SA1100)	+= copypage-v4mc.S
obj-$(CONFIG_CPU_XSCALE)	+= copypage-xscale.S
obj-$(CONFIG_CPU_XSC3)		+= copypage-xsc3.S
obj-$(CONFIG_CPU_COPY_FA)	+= copypage-fa.S

CFLAGS_copypage-feroceon.S := -march=armv5te

obj-$(CONFIG_CPU_TLB_V4WT)	+= tlb-v4.S
obj-$(CONFIG_CPU_TLB_V4WB)	+= tlb-v4wb.S
obj-$(CONFIG_CPU_TLB_V4WBI)	+= tlb-v4wbi.S
obj-$(CONFIG_CPU_TLB_FEROCEON)	+= tlb-v4wbi.S	# reuse v4wbi TLB functions
obj-$(CONFIG_CPU_TLB_V6)	+= tlb-v6.S
obj-$(CONFIG_CPU_TLB_V7)	+= tlb-v7.S
obj-$(CONFIG_CPU_TLB_FA)	+= tlb-fa.S

AFLAGS_tlb-v6.S		:=-Wa,-march=armv6
AFLAGS_tlb-v7.S		:=-Wa,-march=armv7-a

obj-$(CONFIG_CPU_ARM7TDMI)	+= proc-arm7tdmi.S
obj-$(CONFIG_CPU_ARM720T)	+= proc-arm720.S
obj-$(CONFIG_CPU_ARM740T)	+= proc-arm740.S
obj-$(CONFIG_CPU_ARM9TDMI)	+= proc-arm9tdmi.S
obj-$(CONFIG_CPU_ARM920T)	+= proc-arm920.S
obj-$(CONFIG_CPU_ARM922T)	+= proc-arm922.S
obj-$(CONFIG_CPU_ARM925T)	+= proc-arm925.S
obj-$(CONFIG_CPU_ARM926T)	+= proc-arm926.S
obj-$(CONFIG_CPU_ARM940T)	+= proc-arm940.S
obj-$(CONFIG_CPU_ARM946E)	+= proc-arm946.S
obj-$(CONFIG_CPU_FA526)		+= proc-fa526.S
obj-$(CONFIG_CPU_ARM1020)	+= proc-arm1020.S
obj-$(CONFIG_CPU_ARM1020E)	+= proc-arm1020e.S
obj-$(CONFIG_CPU_ARM1022)	+= proc-arm1022.S
obj-$(CONFIG_CPU_ARM1026)	+= proc-arm1026.S
obj-$(CONFIG_CPU_SA110)		+= proc-sa110.S
obj-$(CONFIG_CPU_SA1100)	+= proc-sa1100.S
obj-$(CONFIG_CPU_XSCALE)	+= proc-xscale.S
obj-$(CONFIG_CPU_XSC3)		+= proc-xsc3.S
obj-$(CONFIG_CPU_MOHAWK)	+= proc-mohawk.S
obj-$(CONFIG_CPU_FEROCEON)	+= proc-feroceon.S
obj-$(CONFIG_CPU_V6)		+= proc-v6.S
obj-$(CONFIG_CPU_V6K)		+= proc-v6.S
obj-$(CONFIG_CPU_V7)		+= proc-v7.S proc-v7-bugs.S
obj-$(CONFIG_CPU_V7M)		+= proc-v7m.S

AFLAGS_proc-v6.S	:=-Wa,-march=armv6
AFLAGS_proc-v7.S	:=-Wa,-march=armv7-a

obj-$(CONFIG_OUTER_CACHE)	+= l2c-common.S
obj-$(CONFIG_CACHE_FEROCEON_L2)	+= cache-feroceon-l2.S
obj-$(CONFIG_CACHE_L2X0)	+= cache-l2x0.S l2c-l2x0-resume.S
obj-$(CONFIG_CACHE_L2X0_PMU)	+= cache-l2x0-pmu.S
obj-$(CONFIG_CACHE_XSC3L2)	+= cache-xsc3l2.S
obj-$(CONFIG_CACHE_TAUROS2)	+= cache-tauros2.S
obj-$(CONFIG_CACHE_UNIPHIER)	+= cache-uniphier.S

KBUILD_CPPFLAGS += -I$(srctree)/drivers/misc/mediatek/include

obj-$(CONFIG_MEDIATEK_SOLUTION)	+= cache-mtk-v7.S
