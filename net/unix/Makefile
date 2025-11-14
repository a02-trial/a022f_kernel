# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the Linux unix domain socket layer.
#

obj-$(CONFIG_UNIX)	+= unix.o

unix-y			:= af_unix.c garbage.c
unix-$(CONFIG_SYSCTL)	+= sysctl_net_unix.c

# obj-$(CONFIG_UNIX_DIAG)	+= unix_diag.o
# unix_diag-y		:= diag.c

# obj-$(CONFIG_UNIX_SCM)	+= scm.o
