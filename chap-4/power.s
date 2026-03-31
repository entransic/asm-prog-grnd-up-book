# PURPOSE: to illustrate the use of functions in assembly language
# this program will compute the value of 2^3 + 5^2

# Everything in the prgram will be stored in regsiters
# so the data section will be empty

.section .data

.section .text

.globl _start

_start:
    pushl $3            # push the second argument - base number
    pushl $2            # push the first argument - power
    call power          # call the funcion 'power'
    addl $8, %esp       # move the stack pointer back
    pushl %eax          # save the first answer before calling the next funcion
    pushl $2            # push the second argument
    pushl $5            # push the first argument
    call power          # call the function 'power'
    addl $8, %esp       # move the stack pointer back  
    popl %ebx           # the first answer is in %eax, we pop the second answer into %ebx
    addl %eax, %ebx     # add the two and havc ewthe result in %ebx
    movl $1, %eax       # move the system call number into %eax
    int $0x80           # interrupt the kernel

# PURPOSE: function to raise the value of a number to a power

# INPUT: 
#   first argument - the base number
#   second number - the power to raise it to

# OUTPUT: the resulting value of the number raised to the power

# NOTES: the power must be greater than 1

# VARIABLES: 
#   %ebx - holds the base number
#   %ecx - holds the power to be raised
#   -4(%ebp) - holds the current result
#   %eax - temporary storage

.type power, @function
power: 
    # prologue
    pushl %ebp              # save the old base pointer
    movl %esp, %ebp         # move the stack pointer to the base pointer

    # local storage
    subl $4, %esp           # word for storage space - grow the stack by a word
    movl 8(%ebp), %ebx      # put the first argument (base number) into %ebx
    movl 12(%ebp), %ecx     # put the second argument (power) into %ecx
    movl %ebx, -4(%ebp)     # store the current result

power_loop_start:
    cmp $1, %ecx            # check to see if the power is 1
    je  end_power           # if it is 1 we are done - jump to the end
    movl -4(%ebp), %eax     # move the current result into %eax
    imull %ebx, %eax        # multiple the current result by the base number
    movl  %eax, -4(%ebp)    # store the result in %eax
    decl  %ecx              # decrease the power value for the loop
    jmp power_loop_start    # jump to the top of the loop

end_power:
    # epilogue
    movl -4(%ebp), %eax     # move the result into %eax
    movl  %ebp, %esp        # restore the stack pointer
    popl  %ebp              # restore the base pointer
    ret


