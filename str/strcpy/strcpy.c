#include "malloc.h"
#include "stdio.h"
#include "string.h"

#define SIZE 64

extern void __strcpy(char *dest, char *src);

int main(int argc, char **argv)
{
    char *main_str, *dummy_str;
    main_str = (char *)malloc(SIZE * sizeof(*main_str));
    dummy_str = (char *)malloc(SIZE * sizeof(*main_str));

    __strcpy(main_str, "Hello, World!");
    __strcpy(dummy_str, "Dummy");
    fprintf(stdout, "main:  %s\ndummy: %s\n", main_str, dummy_str);

    __strcpy(main_str, dummy_str);
    fprintf(stdout, "main:  %s\ndummy: %s\n", main_str, dummy_str);

    free(main_str);
    free(dummy_str);
    return 0;
}
