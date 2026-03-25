# PURPOSE - find the maximum in a set of data items
# VARIABLES -
#   %edi - holds the index to the list of items
#   %ebx - holds the last largest item found
#   %eax - holds the current item
#   memory locations used:
#       data_items - contains a list of items and 0 will mark the end of the list

.section .data
    data_items: .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

    .section .text
    .globl _start

_start:
    movl $0, %edi                       # set the index to 0
    movl data_items(,%edi,4), %eax      # move the first item into %eax
    movl %eax, %ebx                     # the first item is the largest, move into %ebx

start_loop:
    cmp $0, %eax                        # check to see if the current item is 0 (end of list)
    je loop_exit                        # exit the program we are at the end of the list
    inc %edi                            # increment the index
    movl data_items(,%edi,4), %eax      # move the next item into %eax
    cmp %ebx, %eax                      # compare the current item to the largest item
    jle start_loop                      # if the current item is less than or equal to the largest, loop
    movl %eax, %ebx                     # store the largest value in %ebx
    jmp start_loop                      # loop unconditionally since not at the end of the list

loop_exit:
    # %ebx holds the max value
    movl $1, %eax
    int $0x80
    


    