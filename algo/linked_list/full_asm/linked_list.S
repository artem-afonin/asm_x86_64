.data
coord_node_sizeof:
    .quad 0x18

linked_list_sizeof:
    .quad 0x10

.text
.global __ll_create
/**
 * Create empty LinkedList
 * @param struct LinkedList **list - pointer to new empty list
 */
__ll_create:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x10, %rsp
    movq %rdi, -0x10(%rbp) # address of list pointer

    movq linked_list_sizeof(%rip), %rdi
    callq malloc@plt
    movq $0x0, (%rax)    # head
    movq $0x0, 0x8(%rax) # tail

    movq -0x10(%rbp), %rdx
    movq %rax, (%rdx)

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
    subq $0x20, %rsp
    movq %rdi, -0x20(%rbp) # x coordinate
    movq %rsi, -0x18(%rbp) # y coordinate
    movq %rdx, -0x10(%rbp) # list structure address

    movq -0x10(%rbp), %rax # get list address
    movq (%rax), %rax      # get head node address

    cmpq $0x0, %rax
    # TODO: inline subfunctions in this one
    # Prepare arguments
    movq -0x20(%rbp), %rdi # x coord
    movq -0x18(%rbp), %rsi # y coord
    movq -0x10(%rbp), %rdx # get list address
    je 1f # goto append to empty
    callq __ll_append_to_not_empty
    jmp 2f
    1: # append to empty list
        callq __ll_append_to_empty
    2: # after list append

    leave
    ret

# long long x
# long long y
# struct LinkedList *list
__ll_append_to_empty:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x20, %rsp
    movq %rdi, -0x20(%rbp) # x coordinate
    movq %rsi, -0x18(%rbp) # y coordinate
    movq %rdx, -0x10(%rbp) # list structure address
    movq $0x0, -0x8(%rbp)  # new node address

    movq coord_node_sizeof(%rip), %rdi
    callq malloc@plt

    movq -0x20(%rbp), %rdx
    movq %rdx, (%rax)      # set X coordinate
    movq -0x18(%rbp), %rdx
    movq %rdx, 0x8(%rax)   # set Y coordinate
    movq $0x0, 0x10(%rax)  # set NULL for *next pointer
    movq %rax, -0x8(%rbp)  # place new node in variable

    movq -0x10(%rbp), %rax # load list address
    movq -0x8(%rbp), %rdx  # load new node address
    movq %rdx, (%rax)      # set new node as head of list
    movq %rdx, 0x8(%rax)   # set new node as tail of list

    leave
    ret

# long long x
# long long y
# struct LinkedList *list
__ll_append_to_not_empty:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x20, %rsp
    movq %rdi, -0x20(%rbp) # x coordinate
    movq %rsi, -0x18(%rbp) # y coordinate
    movq %rdx, -0x10(%rbp) # list structure address
    movq $0x0, -0x8(%rbp)  # new node address

    movq coord_node_sizeof(%rip), %rdi
    callq malloc@plt

    movq -0x20(%rbp), %rdx
    movq %rdx, (%rax)      # set X coordinate
    movq -0x18(%rbp), %rdx
    movq %rdx, 0x8(%rax)   # set Y coordinate
    movq $0x0, 0x10(%rax)  # set NULL for *next pointer
    movq %rax, -0x8(%rbp)  # place new node in variable

    movq -0x10(%rbp), %rax # load list address
    movq -0x8(%rbp), %rdx  # load new node address
    movq 0x8(%rax), %rax   # load tail node address
    movq %rdx, 0x10(%rax)  # set new node as next for tail node

    movq -0x10(%rbp), %rax # load list address
    movq %rdx, 0x8(%rax)   # set new node as tail for list

    leave
    ret


.global __ll_get
/**
 * Get coordinates from list element
 * @param int index               - element index, starting from 0
 * @param long long *x            - variable to store X coordinate
 * @param long long *y            - variable to store Y coordinate
 * @param struct LinkedList *list - list pointer
 * @return int - -1 if index is uncorrect, else 0 if element found
 */
__ll_get:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x30, %rsp
    movq %rsi, -0x30(%rbp) # x address
    movq %rdx, -0x28(%rbp) # y address
    movq %rcx, -0x20(%rbp) # list address
    movq (%rcx), %rax
    movq %rax, -0x18(%rbp) # current node
    movl %edi, -0x10(%rbp) # index

    # if index < 0     -> error
    cmpl $0x0, -0x10(%rbp)
    jl 4f

    # if index >= size -> error
    movq -0x20(%rbp), %rdi
    callq __ll_size
    cmpl %eax, -0x10(%rbp)
    jge 4f

    xorl %ecx, %ecx        # counter

    jmp 2f
    1:
        movq -0x18(%rbp), %rax
        movq 0x10(%rax), %rdi
        movq %rdi, -0x18(%rbp)
        incl %ecx
    2:
        cmpl -0x10(%rbp), %ecx
        jne 1b

    # we found element
    movq -0x18(%rbp), %rax
    movq (%rax), %rsi
    movq -0x30(%rbp), %rdi
    movq %rsi, (%rdi)
    movq 0x8(%rax), %rsi
    movq -0x28(%rbp), %rdi
    movq %rsi, (%rdi)

    3:                     # exit with success
        movl $0x0, %eax
        leave
        ret
    4:                     # exit immediately with error
        movl $-0x1, %eax
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

    movq 0x8(%rdi), %rsi      # load tail node address
    movq (%rdi), %rdi         # load head node address
    xorl %ecx, %ecx           # counter
    cmpq $0x0, %rdi
    je 3f

    jmp 2f
    1:
        movq 0x10(%rdi), %rdi # get next node address
    2:
        incl %ecx
        cmpq %rdi, %rsi
        jne 1b

    3: # immediate end
        movl %ecx, %eax

    leave
    ret


.global __ll_free
/**
 * Clear list and free all nodes memory
 * @param struct LinkedList **list - pointer to list which should be cleared. After clear - pointer should be NULL
 */
__ll_free:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x20, %rsp
    movq %rdi, -0x20(%rbp)     # store list pointer address in var
    movq (%rdi), %rax          # load list address
    movq 0x8(%rax), %rdx       # load tail node address
    movq %rdx, -0x18(%rbp)     # store tail node address in var
    movq (%rax), %rdx          # load head node address
    movq %rdx, -0x10(%rbp)     # store head node address in var

    jmp 2f
    1:
        movq -0x10(%rbp), %rdx # get head node
        movq %rdx, %rdi        # prepare as arg for free@plt
        movq 0x10(%rdx), %rdx  # new head is head->next
        movq %rdx, -0x10(%rbp) # store new head in var
        callq free@plt
    2:
        movq -0x10(%rbp), %rdx
        cmpq %rdx, -0x18(%rbp)
        jne 1b

    # free last node
    movq -0x18(%rbp), %rdi
    callq free@plt

    movq -0x20(%rbp), %rax
    movq (%rax), %rdi
    callq free@plt

    movq -0x20(%rbp), %rax
    movq $0x0, (%rax)

    leave
    ret
