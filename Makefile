src = $(wildcard *.c)
obj = $(src:.c=.o)
LDFLAGS=-flto
CC?=

lto: test.o s.o
	$(CC) test.c s.S -o test -flto -DLTO_ENABLE

nolto: test.o
	$(CC) test.c -o test

.PHONY: clean
clean:
	rm -f $(obj) test
