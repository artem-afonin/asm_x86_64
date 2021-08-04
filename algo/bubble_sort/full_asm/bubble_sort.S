.global __bubble_sort

.text

# rdi         - array pointer
# esi         - array size
# -0x10(%rbp) - array size - 1
# %rax        - i loop counter
# %rbx        - j loop counter
# %ecx        - array[j] tmp var
# %edx        - array[j - 1] tmp var
__bubble_sort:
    pushq %rbp
    movq %rsp, %rbp
    subq $0x10, %rsp
    leal -1(%esi), %eax
    movl %eax, -0x10(%rbp)
    pushq %rbx

    xorq %rax, %rax
    1: # i loop
        movl -0x10(%rbp), %ebx
        2: # j loop
            movl (%rdi, %rbx, 4), %ecx
            movl -4(%rdi, %rbx, 4), %edx
            cmpl %edx, %ecx
            jge 3f
            movl %edx, (%rdi, %rbx, 4)
            movl %ecx, -4(%rdi, %rbx, 4)
            3: # no swap jmp address
            decq %rbx
            cmpq %rax, %rbx
            jg 2b
        incq %rax
        cmpl %esi, %eax
        jl 1b

    popq %rbx
    leave
    ret
