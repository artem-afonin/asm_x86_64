.PHONY: all build objdump_att objdump_intel clean

all: build

build:
	gcc -I.. -c -o linked_list.c.o linked_list.c
	as -o linked_list.S.o ../full_asm/linked_list.S
	gcc -o linked_list linked_list.c.o linked_list.S.o

objdump_att: build
	objdump -d -Matt linked_list

objdump_intel: build
	objdump -d -Mintel linked_list

clean:
	rm -f *.o *.s linked_list
