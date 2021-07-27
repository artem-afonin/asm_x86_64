.PHONY: all build objdump_att objdump_intel clean

all: build

build:
	gcc -c -o strlength.c.o strlength.c
	as -o strlength.S.o strlength.S
	gcc -o strlength strlength.c.o strlength.S.o

objdump_att: build
	objdump -d -Matt strlength

objdump_intel: build
	objdump -d -Mintel strlength

clean:
	rm -f *.o *.s strlength
