# SPDX-License-Identifier: GPL-2.0

hostprogs-y	:= genksyms
always		:= $(hostprogs-y)

genksyms-objs	:= genksyms.c parse.tab.c_shipped lex.lex.c_shipped

# -I needed for generated C source (shipped source)
HOSTCFLAGS_parse.tab.c_shipped := -I$(src)
HOSTCFLAGS_lex.lex.c_shipped := -I$(src)

# dependencies on generated files need to be listed explicitly
$(obj)/lex.lex.c_shipped: $(obj)/parse.tab.h_shipped

clean-files	:= lex.lex.c_shipped parse.tab.c_shipped parse.tab.h_shipped
