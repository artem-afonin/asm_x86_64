.global __strlength

.text
__strlength:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x10, %rsp
    movq %rdi, -0x10(%rbp) # str pointer

    movq -0x10(%rbp), %rbx
    xorl %ecx, %ecx
    jmp 2f

    1:
        addq $0x1, %rbx
        incl %ecx
    2:
        cmpq $0x0, (%rbx)
        jne 1b

    movl %ecx, %eax
    leave
    ret
