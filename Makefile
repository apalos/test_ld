objects := $(patsubst %.c,%.o,$(wildcard *.c))
asm_objects := $(patsubst %.S,%.o,$(wildcard *.S))
LDFLAGS=-flto=32 -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations \
	-fno-pic -mno-unaligned-access -ffunction-sections -fdata-sections \
	-fno-common -mgeneral-regs-only -pipe \
	-D__LINUX_ARM_ARCH__=7 -mtune=generic-armv7-a \
	-DLTO_ENABLE -flto=32 -fno-stack-protector \
	-fno-delete-null-pointer-checks -Wno-pointer-sign \
	-Wno-stringop-truncation -Wno-zero-length-bounds -Wno-array-bounds \
	-Wno-stringop-overflow -Wno-maybe-uninitialized \
	-gdwarf-4 -fstack-usage -Wno-format-nonliteral \
	-Wno-address-of-packed-member -Wno-unused-but-set-variable \
	-Wno-packed-not-aligned \
	-marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -fno-pic \
	-ffixed-r9 -mgeneral-regs-only -pipe
CC?=

lto: test.o s.o
	$(CC) -O2 test.c s.S -o test $(LDFLAGS)

nolto: test.o
	$(CC) test.c -o test

.PHONY: clean
clean:
	rm -f $(objects) $(asm_objects) test

