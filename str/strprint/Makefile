.PHONY: all build objdump_att objdump_intel clean

all: build

build:
	gcc -c -o strprint.c.o strprint.c
	as -o strprint.S.o strprint.S
	gcc -o strprint strprint.c.o strprint.S.o

objdump_att: build
	objdump -d -Matt strprint

objdump_intel: build
	objdump -d -Mintel strprint

clean:
	rm -f *.o *.s strprint
