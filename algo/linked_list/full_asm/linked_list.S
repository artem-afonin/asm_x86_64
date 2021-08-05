.text
.global __ll_create
/**
 * Create empty LinkedList
 * @param struct LinkedList **list - pointer to new empty list
 */
__ll_create:
    pushq %rbp
    movq %rsp, %rbp

    leave
    ret


.global __ll_append
/**
 * Append new coordinate to the list tail
 * @param long long x             - x coordinate
 * @param long long y             - y coordinate
 * @param struct LinkedList *list - list pointer
 */
__ll_append:
    pushq %rbp
    movq %rsp, %rbp

    leave
    ret


.global __ll_get
/**
 * Get coordinates from list element
 * @param int index               - element index, starting from 0
 * @param long long *x            - variable to store X coordinate
 * @param long long *y            - variable to store Y coordinate
 * @param struct LinkedList *list - list pointer
 */
__ll_get:
    pushq %rbp
    movq %rsp, %rbp

    leave
    ret


.global __ll_size
/**
 * Calculate current list size
 * @param struct LinkedList *list - list pointer
 * @return int                    - list size
 */
__ll_size:
    pushq %rbp
    movq %rsp, %rbp

    leave
    ret


.global __ll_clear
/**
 * Clear list and free all nodes memory
 * @param struct LinkedList **list - pointer to list which should be cleared. After clear - pointer should be NULL
 */
__ll_clear:
    pushq %rbp
    movq %rsp, %rbp

    leave
    ret
