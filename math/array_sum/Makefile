.PHONY: all build objdump_att objdump_intel clean

all: build

build:
	gcc -c -o array_sum.c.o array_sum.c
	as -o array_sum.S.o array_sum.S
	gcc -o array_sum array_sum.c.o array_sum.S.o

objdump_att: build
	objdump -d -Matt array_sum

objdump_intel: build
	objdump -d -Mintel array_sum

clean:
	rm -f *.o *.s array_sum
