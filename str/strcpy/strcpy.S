.global __strcpy

.text
__strcpy:
    pushq %rbp
    movq %rsp, %rbp
    jmp 2f

    1:
        movb (%rsi), %al
        movb %al, (%rdi)
        incq %rsi
        incq %rdi
    2:
        cmpb $0x0, (%rsi)
        jne 1b

    movb $0x0, (%rdi)

    leave
    ret
