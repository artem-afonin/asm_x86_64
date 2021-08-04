.PHONY: all build objdump_att objdump_intel clean

all: build

build:
	gcc -c -o bubble_sort.c.o bubble_sort.c
	as -o bubble_sort.S.o ../full_asm/bubble_sort.S
	gcc -o bubble_sort bubble_sort.c.o bubble_sort.S.o

objdump_att: build
	objdump -d -Matt bubble_sort

objdump_intel: build
	objdump -d -Mintel bubble_sort

clean:
	rm -f *.o *.s bubble_sort
