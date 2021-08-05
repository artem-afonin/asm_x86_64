#include "stdio.h"

#include "linked_list.h"

int main(int argc, char **argv)
{
    struct LinkedList *list;
    long long x = 0, y = 0;
    int list_size = 0;

    __ll_create(&list);
    __ll_append(1, 2, list);
    __ll_append(3, 4, list);
    __ll_append(5, 6, list);
    list_size = __ll_size(list);
    fprintf(stdout, "After first append:\n");
    for (int i = 0; i < list_size; ++i)
    {
        __ll_get(i, &x, &y, list);
        fprintf(stdout, "%4lld %4lld\n", x, y);
    }
    fprintf(stdout, "\n");

    __ll_create(&list);
    __ll_append(6, 1, list);
    __ll_append(5, 2, list);
    __ll_append(4, 3, list);
    fprintf(stdout, "After second append:\n");
    for (int i = 0; i < list_size; ++i)
    {
        __ll_get(i, &x, &y, list);
        fprintf(stdout, "%4lld %4lld\n", x, y);
    }
    fprintf(stdout, "\n");

    return 0;
}
