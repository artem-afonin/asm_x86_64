.global __strprint

.text
__strprint:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x10, %rsp
    movq %rdi, -0x8(%rbp) # str pointer
    movl %esi, -0xc(%rbp) # str len

    movq $1, %rax
    movq $1, %rdi
    movq -0x8(%rbp), %rsi
    movslq -0xc(%rbp), %rdx
    syscall

    leaveq
    retq
