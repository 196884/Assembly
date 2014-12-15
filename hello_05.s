# 'Hello, World!' via the 'write' system call
#
# ./hello_05
#
# should print 'Hello, World!' on stdout (and exit with 0)

.section __TEXT,__text
.globl _main

_main:
    pushq %rbp
    movq %rsp, %rbp

    # Because we're using 64 bit, we have to do the following
    # to load the address of the string in %rcx
    movq str@GOTPCREL(%rip), %rcx # %rcx points to the start of the string

    # We determine the length of the string to write
    # (using the fact that it's nil terminated)
    movl $0, %edx # accumulator for the result
    movq $0, %rax # the first byte, %al, is the current byte of the string
    mov  (%rcx), %al
_loop_start:
    cmp $0, %al
    je _loop_end
    addl $1, %edx
    addq $1, %rcx
    mov (%rcx), %al
    jmp _loop_start
_loop_end:
    # At this point the length of the string is in %edx

    # Call write(4)
    movl $1, %edi # stdout is 1
    movq str@GOTPCREL(%rip), %rsi # the value to print
    movl $0x2000004, %eax
    syscall

    # Call exit(0)
    movl $0, %edi
    movl $0x2000001, %eax
    syscall


.section __DATA, __cstring
str:
    .asciz "Hello, World!\n"
