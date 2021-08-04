.data
printf_int_format:
    .asciz "%5d"

printf_newline_format:
    .asciz "\n"

.text
.global __print_array
__print_array:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x20, %rsp
    movq %rdi, -0x20(%rbp) # array pointer
    movl %esi, -0x18(%rbp) # array size
    movq $0x0, -0x10(%rbp) # loop counter

    jmp 2f
    1:
        movq -0x20(%rbp), %rdx
        movq -0x10(%rbp), %rcx
        leaq (%rdx, %rcx, 4), %rdx
        leaq printf_int_format(%rip), %rdi
        movl (%rdx), %esi
        xorq %rax, %rax
        callq printf@plt
        incl -0x10(%rbp)
    2:
    movq -0x10(%rbp), %rcx
    cmpl -0x18(%rbp), %ecx
    jl 1b

    leaq printf_newline_format(%rip), %rdi
    xorq %rax, %rax
    callq printf@plt

    leave
    ret
