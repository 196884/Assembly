# A recursive implementation of the factorial
#
# ./factorial_rec_03
# echo $?
#
# should yield 120 (= 5!)

.section __TEXT,__text
.globl _main

# The recursive function _fact takes two 32-bit
# arguments from the top of the pile:
# * n, the argument to the factorial function
# * a, an accumulator
#
# It returns a * n * (n-1) * ... * 1 in %eax
_fact:
    pushq %rbp
    movq %rsp, %rbp
    movl 16(%rbp), %ebx # Main argument
    movl 20(%rbp), %eax # Accumulator
    cmpl $0, %ebx
    je _fact_done
    jmp _fact_rec
_fact_rec:
    movl %ebx, %edx
    mull %edx # Result in eax, edx is destroyed
    subl $1, %ebx
    # Before the recursive call, we push the 
    # arguments at the top of the stack
    # It looks like there's no push instruction
    # for a 32 bit register in 64 bit Intel on OSX
    subq $8, %rsp
    movl %ebx, (%rsp)
    movl %eax, 4(%rsp)
    call _fact # Recursive call, puts the result in %eax
    addq $8, %rsp
_fact_done:
    # At this point, the result is in %eax
    movq %rbp, %rsp
    popq %rbp
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    # Make room for arguments (result is passed via %eax)
    subq $0x8, %rsp # for 2 arguments
    movl $5, (%rsp)  # Argument
    movl $1, 4(%rsp) # Accumulator
    call _fact
    movl %eax, %edi
    movl $0x2000001, %eax
    syscall

