.data
arr:    .word   10, 3, 45, 90, 12       # Declare the array
size:   .word   5                        # Number of elements in array
max_msg:.asciiz "Largest in given array is "
newline:.asciiz "\n"

.text
.globl main

main:
    la $t0, arr         # Load address of array
    lw $t1, size        # Load size of array
    lw $t2, 0($t0)      # Initialize max = arr[0] (first element)
    
    li $t3, 1           # Initialize loop counter i = 1

find_max:
    bge $t3, $t1, print_result  # If i >= size, exit loop
    
    # Calculate address of arr[i]
    sll $t4, $t3, 2     # Multiply i by 4 (word size)
    add $t4, $t0, $t4   # Address of arr[i]
    lw $t5, 0($t4)      # Load arr[i]
    
    # Compare arr[i] with current max
    ble $t5, $t2, skip_update  # If arr[i] <= max, skip update
    move $t2, $t5       # Update max = arr[i]

skip_update:
    addi $t3, $t3, 1    # i++
    j find_max

print_result:
    # Print the result message
    li $v0, 4
    la $a0, max_msg
    syscall
    
    # Print the maximum value
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Exit program
    li $v0, 10
    syscall