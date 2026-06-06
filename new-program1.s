
.data
C:      .space  40      # 10 elements of int
size:   .word   10      #  represents the elements within the  arrays
B:       .word   4, 15, 16, 5, 7, 9, 15, 10, 22, 6
A:       .word   10, 5, 6, 15, 17, 19, 25, 30, 12, 56

result_msg: .asciiz "Result is ["
comma:   .asciiz ", "
close_bracket: .asciiz "]"
newline: .asciiz "\n"

.text
.globl main

main:
    la $s0, A           # address of array A
    la $s1, B           #  address of array B
    la $s2, C           #   address of array C
    lw $s3, size        #  size of arrays
    
    li $t0, 0           # Initialization of the  loop for  counter i=0

loop:
    bge $t0, $s3, end_loop  # If i >= size  then  exit  the loop
    
    # Calculates the  addresses of A[i] and also of B[i]
    sll $t1, $t0, 2     # Here multiplies the  i by 4
    add $t2, $s0, $t1    # Address of A[i]
    add $t3, $s1, $t1    # Address of B[i]
    
    # Loads the  A[i] and also the  B[i]
    lw $t4, 0($t2)      # Here will load the  A[i]
    lw $t5, 0($t3)      # Here will load the Load B[i]
    
    # Subtracts and stores in C[i]
    sub $t6, $t4, $t5   # Is essentially the expression of C[i] = A[i] - B[i]
    add $t7, $s2, $t1   # Address of C[i]
    sw $t6, 0($t7)      # Stores the  result into C[i]
    
    addi $t0, $t0, 1    
    j loop

end_loop:
    # Here prints  the results as a  message.
    li $v0, 4
    la $a0, result_msg
    syscall
    
    # Here prints the  the elements of array C
    li $t0, 0           # Resets the  counterr to  i=0
    la $s2, C           # Resets the e address of C 

print_loop:
    bge $t0, $s3, end_print_loop  # If the   i > = size,  then exit the  loop
    
    # Here finds the Calculates the address of C[i]
    sll $t1, $t0, 2     # Multiplying the  i by 4
    add $t2, $s2, $t1   # The Address of C[i]
    lw $a0, 0($t2)      # Loads the  C[i] for printing
    
    # created to print  the number
    li $v0, 1
    syscall
    
    # Print  an comma and space if it is  not the  last element
    addi $t0, $t0, 1    
    bge $t0, $s3, no_comma
    
    li $v0, 4
    la $a0, comma
    syscall
    
no_comma:
    j print_loop

end_print_loop:
    # Prints the  closing bracket and  also the newline
    li $v0, 4
    la $a0, close_bracket
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    #  now will exit  the program
    li $v0, 10
    syscall
