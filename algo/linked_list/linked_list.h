#ifndef LINKED_LIST_H
#define LINKED_LIST_H

struct CoordNode
{
    long long x;
    long long y;
    struct CoordNode *next;
};

struct LinkedList
{
    struct CoordNode *head;
    struct CoordNode *tail;
};

/**
 * Create empty LinkedList
 * @param struct LinkedList **list - pointer to new empty list
 */
extern void __ll_create(struct LinkedList **list);

/**
 * Append new coordinate to the list tail
 * @param long long x             - x coordinate
 * @param long long y             - y coordinate
 * @param struct LinkedList *list - list pointer
 */
extern void __ll_append(long long x, long long y, struct LinkedList *list);

/**
 * Get coordinates from list element
 * @param int index               - element index, starting from 0
 * @param long long *x            - variable to store X coordinate
 * @param long long *y            - variable to store Y coordinate
 * @param struct LinkedList *list - list pointer
 * @return int - -1 if index is uncorrect, else 0 if element found
 */
extern int __ll_get(int index, long long *x, long long *y, struct LinkedList *list);

/**
 * Calculate current list size
 * @param struct LinkedList *list - list pointer
 * @return int                    - list size
 */
extern int __ll_size(struct LinkedList *list);

/**
 * Clear list and free all nodes memory
 * @param struct LinkedList **list - pointer to list which should be cleared. After clear - pointer should be NULL
 */
extern void __ll_free(struct LinkedList **list);

#endif
