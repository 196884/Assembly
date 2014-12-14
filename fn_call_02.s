# A simple function call to _foo, that adds the two numbers
# (32 bits) put by _main at the top of the stack, and stores
# the result on the stack.
#
# ./fn_call_02
# echo $?
#
# should yield 42 (= 15 + 27)

.section __TEXT,__text
.globl _main

_foo:
    # Since we're not using the stack to store local variables,
    # the stack bookkeeping is not strictly necessary
    pushq %rbp
    movq %rsp, %rbp
    subq $4, %rsp # If we needed to store a 4 byte local variable
    movl 16(%rbp), %eax
    movl 20(%rbp), %edx
    addl %edx, %eax
    movl %eax, 24(%rbp)
    movq %rbp, %rsp # Unwind the stack
    popq %rbp
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    # Make room for arguments and result:
    subq $0xC, %rsp     # 12, for 2 arguments and the result
    movl $0xF, (%rsp)   # 15 (first argument)
    movl $0x1B, 4(%rsp) # 27 (second argument)
    call _foo
    movl 8(%rsp), %edi  # the result
    # We chose to pass the result via the stack, but we
    # could just as well have retrieved it from %eax 
    # at this point
    movl $0x2000001, %eax
    syscall

