# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the linux kernel.
#

CPPFLAGS_vmlinux.lds := -DTEXT_OFFSET=$(TEXT_OFFSET)
AFLAGS_head.o        := -DTEXT_OFFSET=$(TEXT_OFFSET)

ifdef CONFIG_FUNCTION_TRACER
CFLAGS_REMOVE_ftrace.o = -pg
CFLAGS_REMOVE_insn.o = -pg
CFLAGS_REMOVE_patch.o = -pg
endif

ifeq ($(cc-name),clang)
ccflags-y += -DCONFIG_CC_IS_CLANG
endif

CFLAGS_REMOVE_return_address.o = -pg
ccflags-y += -I$(srctree)/drivers/misc/mediatek/mtprof/
ccflags-y += -I$(srctree)/drivers/misc/mediatek/include/
# Object file lists.

obj-y		:= elf.c entry-common.S irq.c opcodes.c \
		   process.c ptrace.c reboot.c return_address.c \
		   setup.c signal.c sigreturn_codes.S \
		   stacktrace.c sys_arm.c time.c traps.c

obj-$(CONFIG_ATAGS)		+= atags_parse.c
obj-$(CONFIG_ATAGS_PROC)	+= atags_proc.c
obj-$(CONFIG_DEPRECATED_PARAM_STRUCT) += atags_compat.c

ifeq ($(CONFIG_CPU_V7M),y)
obj-y		+= entry-v7m.c v7m.c
else
obj-y		+= entry-armv.c
endif

obj-$(CONFIG_MMU)		+= bugs.c
obj-$(CONFIG_CPU_IDLE)		+= cpuidle.c
obj-$(CONFIG_ISA_DMA_API)	+= dma.c
obj-$(CONFIG_FIQ)		+= fiq.c fiqasm.c
obj-$(CONFIG_MODULES)		+= armksyms.c module.c
obj-$(CONFIG_ARM_MODULE_PLTS)	+= module-plts.c
obj-$(CONFIG_ISA_DMA)		+= dma-isa.c
obj-$(CONFIG_PCI)		+= bios32.c isa.c
obj-$(CONFIG_ARM_CPU_SUSPEND)	+= sleep.c suspend.c
obj-$(CONFIG_HIBERNATION)	+= hibernate.c
obj-$(CONFIG_SMP)		+= smp.c
ifdef CONFIG_MMU
obj-$(CONFIG_SMP)		+= smp_tlb.c
endif
obj-$(CONFIG_HAVE_ARM_SCU)	+= smp_scu.c
obj-$(CONFIG_HAVE_ARM_TWD)	+= smp_twd.c
obj-$(CONFIG_ARM_ARCH_TIMER)	+= arch_timer.c
obj-$(CONFIG_FUNCTION_TRACER)	+= entry-ftrace.c
obj-$(CONFIG_DYNAMIC_FTRACE)	+= ftrace.c insn.c
obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.c insn.c
obj-$(CONFIG_JUMP_LABEL)	+= jump_label.c insn.c patch.c
obj-$(CONFIG_KEXEC)		+= machine_kexec.c relocate_kernel.c
# Main staffs in KPROBES are in arch/arm/probes/ .
obj-$(CONFIG_KPROBES)		+= patch.c insn.c
obj-$(CONFIG_OABI_COMPAT)	+= sys_oabi-compat.c
obj-$(CONFIG_ARM_THUMBEE)	+= thumbee.c
obj-$(CONFIG_KGDB)		+= kgdb.c patch.c
obj-$(CONFIG_ARM_UNWIND)	+= unwind.c
obj-$(CONFIG_HAVE_TCM)		+= tcm.c
obj-$(CONFIG_OF)		+= devtree.c
obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.c
obj-$(CONFIG_SWP_EMULATE)	+= swp_emulate.c
CFLAGS_swp_emulate.c		:= -Wa,-march=armv7-a
obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.c

obj-$(CONFIG_CPU_XSCALE)	+= xscale-cp0.c
obj-$(CONFIG_CPU_XSC3)		+= xscale-cp0.c
obj-$(CONFIG_CPU_MOHAWK)	+= xscale-cp0.c
obj-$(CONFIG_CPU_PJ4)		+= pj4-cp0.c
obj-$(CONFIG_CPU_PJ4B)		+= pj4-cp0.c
obj-$(CONFIG_IWMMXT)		+= iwmmxt.c
obj-$(CONFIG_PERF_EVENTS)	+= perf_regs.c perf_callchain.c
obj-$(CONFIG_HW_PERF_EVENTS)	+= perf_event_xscale.c perf_event_v6.c \
				   perf_event_v7.c
AFLAGS_iwmmxt.c			:= -Wa,-mcpu=iwmmxt
obj-$(CONFIG_ARM_CPU_TOPOLOGY)  += topology.c
obj-$(CONFIG_VDSO)		+= vdso.c
obj-$(CONFIG_EFI)		+= efi.c

ifneq ($(CONFIG_ARCH_EBSA110),y)
  obj-y		+= io.c
endif
obj-$(CONFIG_PARAVIRT)	+= paravirt.c

head-y			:= head$(MMUEXT).c
obj-$(CONFIG_DEBUG_LL)	+= debug.c
obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.c

obj-$(CONFIG_ARM_VIRT_EXT)	+= hyp-stub.c
AFLAGS_hyp-stub.c		:=-Wa,-march=armv7-a
ifeq ($(CONFIG_ARM_PSCI),y)
obj-$(CONFIG_SMP)		+= psci_smp.c
endif

obj-$(CONFIG_HAVE_ARM_SMCCC)	+= smccc-call.c

extra-y := $(head-y) vmlinux.lds
