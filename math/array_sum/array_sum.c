#include <malloc.h>
#include <stdio.h>

#define SIZE 100

extern int __iarray_sum(int *array, int length);
extern long __larray_sum(long *array, int length);

void test_array_int() {
    int *array_ptr;
    array_ptr = (int *) malloc(SIZE * sizeof(*array_ptr));

    fprintf(stdout, "int\n");
    for (int i = 0; i < SIZE; ++i) {
        array_ptr[i] = i + 1;
        fprintf(stdout, "%d ", array_ptr[i]);
    }
    fprintf(stdout, "\n");

    int sum = __iarray_sum(array_ptr, SIZE);
    fprintf(stdout, "sum: %d\n", sum);
}

void test_array_long() {
    long *array_ptr;
    array_ptr = (long *) malloc(SIZE * sizeof(*array_ptr));

    fprintf(stdout, "long\n");
    for (long i = 0; i < SIZE; ++i) {
        array_ptr[i] = i + 1;
        fprintf(stdout, "%ld ", array_ptr[i]);
    }
    fprintf(stdout, "\n");

    long sum = __larray_sum(array_ptr, SIZE);
    fprintf(stdout, "sum: %ld\n", sum);
}

int main(int argc, char **argv) {
    test_array_int();
    fprintf(stdout, "\n");
    test_array_long();

    return 0;
}
