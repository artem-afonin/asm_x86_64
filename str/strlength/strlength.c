#include "stdio.h"
#include "string.h"

extern int __strlength(char *str);

int main(int argc, char **argv)
{
    char str[128] = "Hello, World!";
    int length = __strlength(str);
    fprintf(stdout, "str: %s\nlen: %d\n", str, length);
    return 0;
}