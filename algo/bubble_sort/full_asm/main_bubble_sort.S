.data
static_array_int:
    .long 90, 64, 20, -100, 92, 64, 36, -74, -85, 85, 16, -51, -87, -3, -63, -31, 4, 20, -15, -27, 22, -99, 82, 76, 8, 91, -24, -10, 69, -65, 84, 59

static_array_int_size:
    .long 0x20

.text
.global main
main:
    pushq %rbp
    movq %rsp, %rbp

    leaq static_array_int(%rip), %rdi
    movq static_array_int_size(%rip), %rsi
    callq __print_array

    leaq static_array_int(%rip), %rdi
    movq static_array_int_size(%rip), %rsi
    callq __bubble_sort

    leaq static_array_int(%rip), %rdi
    movq static_array_int_size(%rip), %rsi
    callq __print_array

    leave
    ret
