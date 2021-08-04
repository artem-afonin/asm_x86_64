.PHONY: all build objdump_att objdump_intel clean

all: build

build:
	as -o main_bubble_sort.S.o main_bubble_sort.S
	as -o bubble_sort.S.o bubble_sort.S
	as -o print_array.S.o print_array.S
	gcc -o main_bubble_sort main_bubble_sort.S.o bubble_sort.S.o print_array.S.o

objdump_att: build
	objdump -d -Matt main_bubble_sort

objdump_intel: build
	objdump -d -Mintel main_bubble_sort

clean:
	rm -f *.o *.s main_bubble_sort
