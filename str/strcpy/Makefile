.PHONY: all build objdump_att objdump_intel clean

all: build

build:
	gcc -c -o strcpy.c.o strcpy.c
	as -o strcpy.S.o strcpy.S
	gcc -o strcpy strcpy.c.o strcpy.S.o

objdump_att: build
	objdump -d -Matt strcpy

objdump_intel: build
	objdump -d -Mintel strcpy

clean:
	rm -f *.o *.s strcpy
