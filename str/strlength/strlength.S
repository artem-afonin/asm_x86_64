.global __strlength

.text
__strlength:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x10, %rsp
    movq %rdi, -0x10(%rbp) # str pointer

    movq -0x10(%rbp), %rbx
    xorl %ecx, %ecx

    loop_start:
        cmpq $0x0, (%rbx)
        je loop_end
        addq $0x1, %rbx
        incl %ecx
        jmp loop_start
    loop_end:

    movl %ecx, %eax
    leave
    ret
