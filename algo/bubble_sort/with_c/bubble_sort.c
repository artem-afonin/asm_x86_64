#include "malloc.h"
#include "stdio.h"
#include "stdlib.h"
#include "time.h"

#define SIZE 32

void fill_array_rand(int *array, int length);
void print_array(int *array, int length);
extern void __bubble_sort(int *array, int length);

int main(int argc, char **argv) {
    srand(time(NULL));

    int *array;
    array = (int *) malloc(SIZE * sizeof(*array));
    fill_array_rand(array, SIZE);
    print_array(array, SIZE);
    fprintf(stdout, "\n");

    __bubble_sort(array, SIZE);
    print_array(array, SIZE);

    free(array);
    return 0;
}

void fill_array_rand(int *array, int length) {
    for (int i = 0; i < length; ++i) {
        array[i] = rand() % 201 - 100;
    }
}

void print_array(int *array, int length) {
    for (int i = 0; i < length; ++i) {
        fprintf(stdout, "%5d", array[i]);
    }
    fprintf(stdout, "\n");
}