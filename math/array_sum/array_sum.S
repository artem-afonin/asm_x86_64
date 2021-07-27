.global __iarray_sum
.global __larray_sum

.text
__iarray_sum:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x10, %rsp
    movq %rdi, -0x8(%rbp) # array pointer
    movl %esi, -0xc(%rbp) # array size

    xorl %eax, %eax       # %eax for sum
    movq -0x8(%rbp), %rbx # %rbx for array pointer
    movl -0xc(%rbp), %ecx # %ecx for array size

    1:
        cmpl $0x0, %ecx
        jle 2f
        addl (%rbx), %eax
        addq $0x4, %rbx
        decl %ecx
        jmp 1b
    2:

    leave
    ret

__larray_sum:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x10, %rsp
    movq %rdi, -0x8(%rbp) # array pointer
    movl %esi, -0xc(%rbp) # array size

    xorq %rax, %rax       # %rax for sum
    movq -0x8(%rbp), %rbx # %rbx for array pointer
    movl -0xc(%rbp), %ecx # %ecx for array size

    1:
        cmpl $0x0, %ecx
        jle 2f
        addq (%rbx), %rax
        addq $0x8, %rbx
        decl %ecx
        jmp 1b
    2:

    leave
    ret
