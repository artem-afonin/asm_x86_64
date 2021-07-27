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
    jmp 2f

    1:
        addl (%rbx), %eax
        addq $0x4, %rbx
        decl %ecx
    2:
        cmpl $0x0, %ecx
        jg 1b

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
    jmp 2f

    1:
        addq (%rbx), %rax
        addq $0x8, %rbx
        decl %ecx
    2:
        cmpl $0x0, %ecx
        jg 1b

    leave
    ret
