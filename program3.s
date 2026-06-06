.data
    # This is the array that I'm  going to search in. The array holds 5 integer values.
    ArrayA:         .word 10, 11, -3, -10, 50

    # This variable holds  the number of elements witin the array, which is 5.
    ArraySize:      .word 5

    # This is the number I'm trying to   to search for in the array. I hardcoded it. Change the number here to get different result/output.
    SearchNumber:   .word -10

    # The message heree  will be printed if the number is found within the array.
    FoundMsg:       .asciiz "Number found at index: "

    # This message here will print if the number is cannnot  be found in the array.
    NotFoundMsg:    .asciiz "Number not found. Index: -1\n"

.text
.globl main

main:
    # Here will load the address of the array  into  an register $t0 so  that I  can get its elements.
    la   $t0, ArrayA

    # Here will also  load the search number into an  register $t1 that will compare it to array elements.
    lw   $t1, SearchNumber

    # Loads the size of the array into the  register $t2 to use as the loop limit.
    lw   $t2, ArraySize

    # I  Initialized the index counter to 0. I Did it by  by loading 0 into register $t3.
    li   $t3, 0       # $t3 will  noww be used to keep track of the current index in the array

search_loop:
    # If the current index $t3 equals the array size $t2, so the search has finished and the number is not found.
    beq  $t3, $t2, not_found

    # Here are  multiplying  the index by 4 to get the byte offset since each word is 4 bytes.
    sll  $t4, $t3, 2       # $t4 now holds the offset in bytes

    # Here I am adding the offsets to the base address of the array, to get the address of the current element.
    add  $t5, $t0, $t4     # $t5 pointss to  the ArrayA[ the index]

    # This will  loads the current array element into register $t6 for comparison.
    lw   $t6, 0($t5)

    # implemented to compare the current array element $t6 with the search number $t1.
    #  and if they are equal, the number was found.
    beq  $t6, $t1, found

    # This here is incrementing the index by 1 to check the next element in the next loop.
    addi $t3, $t3, 1

    # This will make it jump back to the beginning of the loop to check the next element.
    j    search_loop

found:
    # Prints the message which measn that the number was found.
    li   $v0, 4              # The System call code for printing a string
    la   $a0, FoundMsg       # Loadingg the the address of the message string
    syscall                  # Here will p rint the message

    # implemented to print the index at which the number was found.
    li   $v0, 1              # System call code used for printing an integer
    move $a0, $t3            # Moves the found index to $a0 for printing
    syscall                  # Prints the index

    # created to jumps to the exit label to end the program.
    j exit

not_found:
    # This will print an message  which will indicate the number was not found in the array.
    li   $v0, 4              # System call code for printing a string
    la   $a0, NotFoundMsg    # Loads the address of the message string
    syscall                  # Prints  an  message

exit:
    # Now I am exitting the program using the  system call code 10.
    li   $v0, 10             # System call code for  the program to  exit
    syscall                  # This will Exit the program
