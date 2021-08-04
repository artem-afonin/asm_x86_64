#include "string.h"

extern void __strprint(char *str, int length);

int main(int argc, char **argv)
{
    char str[128] = "Hello, World!\n";
    int length = strlen(str);
    __strprint(str, length);
    return 0;
}