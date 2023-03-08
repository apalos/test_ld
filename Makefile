src = $(wildcard *.c)
obj = $(src:.c=.o)
LDFLAGS=-flto

lto: test.o s.o
	gcc test.c s.S -o test -flto

nolto: test.o
	cc test.c -o test

.PHONY: clean
clean:
	rm -f $(obj) test
