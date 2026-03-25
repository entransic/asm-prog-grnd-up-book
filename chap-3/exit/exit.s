# PURPOSE: simple program that exits and returns status code to the Linux kernel

# INPUT: none

# OUTPUT status code that can be read by typing 'echo $?'

# VARIABLES: 
#   %eax - holds the system call number
#   %ebx - holds the status code

.section .data   

.section .text
.globl _start

_start:
    movl $1, %eax    # this places 1 in the eax register - system call numbner
    movl $0, %ebx    # this places 0 in the ebx register - status code
    int $0x80       # this interrupts the kernel
