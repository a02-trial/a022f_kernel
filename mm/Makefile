# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the linux memory manager.
#

subdir-ccflags-y += -Werror
ccflags-y += -I$(srctree)/drivers/misc/mediatek/include

ifdef CONFIG_MTK_ION
subdir-ccflags-y += -I$(srctree)/drivers/staging/android/ion
endif

KASAN_SANITIZE_slab_common.c := n
KASAN_SANITIZE_slab.c := n
KASAN_SANITIZE_slub.c := n

# These files are disabled because they produce non-interesting and/or
# flaky coverage that is not a function of syscall inputs. E.g. slab is out of
# free pages, or a task is migrated between nodes.
KCOV_INSTRUMENT_slab_common.c := n
KCOV_INSTRUMENT_slob.c := n
KCOV_INSTRUMENT_slab.c := n
KCOV_INSTRUMENT_slub.c := n
KCOV_INSTRUMENT_page_alloc.c := n
KCOV_INSTRUMENT_debug-pagealloc.c := n
KCOV_INSTRUMENT_kmemleak.c := n
KCOV_INSTRUMENT_memcontrol.c := n
KCOV_INSTRUMENT_mmzone.c := n
KCOV_INSTRUMENT_vmstat.c := n

mmu-y			:= nommu.c
mmu-$(CONFIG_MMU)	:= gup.c highmem.c memory.c mincore.c \
			   mlock.c mmap.c mprotect.c mremap.c msync.c \
			   page_vma_mapped.c pagewalk.c pgtable-generic.c \
			   rmap.c vmalloc.c


ifdef CONFIG_CROSS_MEMORY_ATTACH
mmu-$(CONFIG_MMU)	+= process_vm_access.c
endif

obj-y			:= filemap.c mempool.c oom_kill.c \
			   maccess.c page_alloc.c page-writeback.c \
			   readahead.c swap.c truncate.c vmscan.c shmem.c \
			   util.c mmzone.c vmstat.c backing-dev.c \
			   mm_init.c mmu_context.c percpu.c slab_common.c \
			   compaction.c vmacache.c swap_slots.c \
			   interval_tree.c list_lru.c workingset.c showmem_extra.c \
			   debug.c $(mmu-y) mm_debug.c

obj-y += init-mm.c

obj-y += sec_mm/

ifdef CONFIG_NO_BOOTMEM
	obj-y		+= nobootmem.c
else
	obj-y		+= bootmem.c
endif

obj-$(CONFIG_ADVISE_SYSCALLS)	+= fadvise.c
ifdef CONFIG_MMU
	obj-$(CONFIG_ADVISE_SYSCALLS)	+= madvise.c
endif
obj-$(CONFIG_HAVE_MEMBLOCK) += memblock.c

obj-$(CONFIG_SWAP)	+= page_io.c swap_state.c swapfile.c
obj-$(CONFIG_FRONTSWAP)	+= frontswap.c
obj-$(CONFIG_ZSWAP)	+= zswap.c
obj-$(CONFIG_HAS_DMA)	+= dmapool.c
obj-$(CONFIG_HUGETLBFS)	+= hugetlb.c
obj-$(CONFIG_NUMA) 	+= mempolicy.c
obj-$(CONFIG_SPARSEMEM)	+= sparse.c
obj-$(CONFIG_SPARSEMEM_VMEMMAP) += sparse-vmemmap.c
obj-$(CONFIG_SLOB) += slob.c
obj-$(CONFIG_MMU_NOTIFIER) += mmu_notifier.c
obj-$(CONFIG_KSM) += ksm.c
obj-$(CONFIG_PAGE_POISONING) += page_poison.c
obj-$(CONFIG_SLAB) += slab.c
obj-$(CONFIG_SLUB) += slub.c
obj-$(CONFIG_KASAN)	+= kasan/
obj-$(CONFIG_FAILSLAB) += failslab.c
obj-$(CONFIG_MEMORY_HOTPLUG) += memory_hotplug.c
obj-$(CONFIG_MEMTEST)		+= memtest.c
obj-$(CONFIG_MIGRATION) += migrate.c
obj-$(CONFIG_QUICKLIST) += quicklist.c
obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += huge_memory.c khugepaged.c
obj-$(CONFIG_PAGE_COUNTER) += page_counter.c
obj-$(CONFIG_MEMCG) += memcontrol.c vmpressure.c
obj-$(CONFIG_MEMCG_SWAP) += swap_cgroup.c
obj-$(CONFIG_CGROUP_HUGETLB) += hugetlb_cgroup.c
obj-$(CONFIG_MEMORY_FAILURE) += memory-failure.c
obj-$(CONFIG_HWPOISON_INJECT) += hwpoison-inject.c
obj-$(CONFIG_DEBUG_KMEMLEAK) += kmemleak.c
obj-$(CONFIG_DEBUG_KMEMLEAK_TEST) += kmemleak-test.c
obj-$(CONFIG_DEBUG_RODATA_TEST) += rodata_test.c
obj-$(CONFIG_PAGE_OWNER) += page_owner.c
obj-$(CONFIG_CLEANCACHE) += cleancache.c rbinregion.c rbincache.c
obj-$(CONFIG_MEMORY_ISOLATION) += page_isolation.c
obj-$(CONFIG_ZPOOL)	+= zpool.c
obj-$(CONFIG_ZBUD)	+= zbud.c
obj-$(CONFIG_ZSMALLOC)	+= zsmalloc.c
obj-$(CONFIG_Z3FOLD)	+= z3fold.c
obj-$(CONFIG_GENERIC_EARLY_IOREMAP) += early_ioremap.c
obj-$(CONFIG_CMA)	+= cma.c
obj-$(CONFIG_MEMORY_BALLOON) += balloon_compaction.c
obj-$(CONFIG_PAGE_EXTENSION) += page_ext.c
obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.c
obj-$(CONFIG_USERFAULTFD) += userfaultfd.c
obj-$(CONFIG_IDLE_PAGE_TRACKING) += page_idle.c
obj-$(CONFIG_FRAME_VECTOR) += frame_vector.c
obj-$(CONFIG_DEBUG_PAGE_REF) += debug_page_ref.c
obj-$(CONFIG_HARDENED_USERCOPY) += usercopy.c
obj-$(CONFIG_PERCPU_STATS) += percpu-stats.c
obj-$(CONFIG_HMM) += hmm.c
obj-$(CONFIG_PAGE_BOOST_RECORDING) += io_record.c
