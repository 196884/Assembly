# An imperative implementation of the factorial
#
# ./factorial_imp_04
# echo $?
#
# should yield 120 (= 5!)

.section __TEXT,__text
.globl _main

# Takes a single argument from the top
# of the stack, returns its factorial in %eax
_fact:
    pushq %rbp
    movq %rsp, %rbp
    movl 16(%rbp), %ebx # the argument
    movl $1, %eax       # the result (initialization)
_loop_start:
    cmpl $0, %ebx
    je _loop_end
    movl %ebx, %edx # the multiplication destroys the argument
    mull %edx
    subl $1, %ebx
    jmp _loop_start
_loop_end:
    # At this point, the result is in %eax
    movq %rbp, %rsp
    popq %rbp
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    # Make room for the argument
    subq $0x4, %rsp # for 2 arguments
    movl $5, (%rsp)  # Argument
    call _fact
    movl %eax, %edi
    movl $0x2000001, %eax
    syscall
 
