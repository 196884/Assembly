# First step:
# Simply does a system call (1, the code for exit)
# The value of %edi is returned
#
# You can run
# ./exit_01
# echo $?
#
# which should return to you the return value (42)

.section __TEXT,__text
.globl _main

_main:
    pushq %rbp
    movq %rsp, %rbp
    movl $42, %edi
    # The 2000000 offset is because it's a Unix class system call
    # The 1 corresponds to exit (cf. syscall.h)
    movl $0x2000001, %eax
    syscall
